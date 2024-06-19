<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Thumb;
use Illuminate\Support\Facades\Auth;
use App\Models\NotifiCation;
class OrderController extends Controller
{
    //

    public function show(Request $request)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();

        $current_status = $request->input('status');
        if (!$current_status) $current_status = 'all';
        $orders = $request->session()->get('orders');
        $revenue = Order::where('delivery_status' ,'Hoàn thành')->sum('payment_amount');
        session()->forget('orders');
        if (!$orders)
            if ($current_status == 'all')
                $orders = Order::orderBy('created_at','desc')->get();
            else $orders = Order::where('user_id', Auth::user()->id)->orderBy('created_at','desc')->get();
        return view('admin.order.show', compact('orders', 'current_status','revenue', 'conversations', 'conversationIds', 'checkNew'));
    }
    function detail($id)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $order = Order::find($id);
        if (!$order->user_id) {
            $order->user_id = Auth::user()->id;
            $order->save();
        }
        $order_details = $order->orderDetails;
        $check = 'true';
        foreach ($order_details as $order_detail) {
            $color = $order_detail->color;
            $product = $order_detail->product;
            $product_colors = $product->colors;
            foreach ($product_colors as $product_color) {
                if ($color->name == $product_color->name) {
                    if ($product_color->pivot->count < $order_detail->count) {
                        $check = 'false';
                        break;
                    }
                }
            }
        }
        return view('admin.order.detail', compact('order', 'order_details', 'check', 'conversations', 'conversationIds', 'checkNew'));
    }
    function ship($id)
    {
        $order = Order::find($id);
        if ($order->user_id == Auth::user()->id) {
            $order->delivery_status = 'Chờ lấy hàng';
            $order_details = $order->orderDetails;
            foreach ($order_details as $order_detail) {
                $product = $order_detail->product;
                $count = $order_detail->count;
                $color = $order_detail->color;
                $colors = $product->colors;
                foreach ($colors as $color_product) {
                    if ($color_product->id == $color->id) {
                        $count_update = $color_product->pivot->count - $count;
                        $product->colors()->syncWithoutDetaching([$color->id => ['count' => $count_update]]);
                        break;
                    }
                }
                $product->count = $product->count - $count;
                $product->save();
            }
            $order->save();
            $title = "Xác nhận đơn hàng";
            $user_id = Auth::user()->id;
            $message = "Đơn hàng #$order->id đã được nhân viên #$user_id xử lý";
            NotifiCation::create([
                'title' => $title,
                'message' => $message
            ]);
            $status = 'Đơn hàng #' . $order->id . ' đã được xác nhận, đang chờ lấy hàng';
        } else $status = 'Đơn hàng #' . $order->id . ' đang được xử lý bởi người dùng #' . $order->user_id;
        return redirect()->route('order.show')->with('status', $status);
    }
    function cancel($id, Request $request)
    {
        $order = Order::find($id);
        if ($order->user_id == Auth::user()->id) {
            $validate = $request->validate([
                'cancel_description' => 'required|string'
            ]);
            if ($order->delivery_status != 'Chờ xử lý') {
                $order_details = $order->orderDetails;
                foreach ($order_details as $order_detail) {
                    $product = $order_detail->product;
                    $count = $order_detail->count;
                    $color = $order_detail->color;
                    $colors = $product->colors;
                    foreach ($colors as $color_product) {
                        if ($color_product->id == $color->id) {
                            $count_update = $color_product->pivot->count + $count;
                            $product->colors()->syncWithoutDetaching([$color->id => ['count' => $count_update]]);
                            break;
                        }
                    }
                    $product->count = $product->count + $count;
                    $product->save();
                }
            }
            $order->update([
                'delivery_status' => 'Đã hủy',
                'cancel_description' => $request->input('cancel_description'),
                'cancel_reason' => $request->input('cancel_reason')
            ]);
            $status = 'Đơn hàng #' . $order->id . ' đã được hủy thành công';
            $title = "Hủy đơn hàng";
            $user_id = Auth::user()->id;
            $message = "Đơn hàng #$order->id đã được hủy bởi nhân viên #$user_id";
            NotifiCation::create([
                'title' => $title,
                'message' => $message
            ]);
        } else  $status = 'Đơn hàng #' . $order->id . ' đang được xử lý bởi người dùng #' . $order->user_id;
        return redirect()->route('order.show')->with('status', $status);
    }
    function status($status, $id)
    {
        $order = Order::find($id);
        if ($order->user_id == Auth::user()->id) {
            if ($status == 'picked') {
                $order->delivery_status = 'Đang giao';
                $order->save();
                $status = 'Đơn hàng #' . $order->id . ' đang được giao.';
            } else if ($status == 'completed') {
                $order->delivery_status = 'Hoàn thành';
                $order->payment_status = 'Đã thanh toán';
                $order_details = $order->orderDetails;
                foreach($order_details as $order_detail)
                {
                    $product = $order_detail->product;
                    $color = $order_detail->color;
                    $count = $order_detail->count;
                    $sold = $product->sold;
                    if(empty($sold))$sold = 0;
                    $sold += $count;
                    $product->sold = $sold;
                    $product->save();            
                }

                $order->save();
                $title = "Đơn hàng hoàn thành";
                $message = "Đơn hàng #$order->id đã giao thành công";
                NotifiCation::create([
                    'title' => $title,
                    'message' => $message
                ]);
                $status = 'Đơn hàng #' . $order->id . ' đã hoàn thành';
            }
        } else  $status = 'Đơn hàng #' . $order->id . ' đang được xử lý bởi người dùng #' . $order->user_id;
        return redirect()->route('order.show')->with('status', $status);
    }
    function payment_complete($id)
    {
        $order = Order::find($id);
        if ($order->user_id == Auth::user()->id) {
            $order->payment_status = "Đã thanh toán";
            $order->save();
            $status = 'Đơn hàng #' . $order->id . ' đã được thanh toán';
            $title = "Thanh toán thành công";
            $message = "Đơn hàng #$order->id đã được thanh toán";
            NotifiCation::create([
                'title' => $title,
                'message' => $message
            ]);
        } else  $status = 'Đơn hàng #' . $order->id . ' đang được xử lý bởi người dùng #' . $order->user_id;
        return redirect()->route('order.show')->with('status', $status);
    }
    function to_return($id)
    {
        $order = Order::find($id);
        if ($order->user_id == Auth::user()->id) {
            $order->payment_status = "Hoàn trả";
            $order->save();
            $status = 'Đơn hàng #' . $order->id . ' đã được hoàn trả và gửi thông báo đến ' . $order->customer->fullname;
            $title = "Hoàn trả";
            $customer_id = $order->customer->id;
            $message = "Đã hoàn trả lại tiền và gửi thông báo đến khách hàng $customer_id";
            NotifiCation::create([
                'title' => $title,
                'message' => $message
            ]);
        } else  $status = 'Đơn hàng #' . $order->id . ' đang được xử lý bởi người dùng #' . $order->user_id;
        return redirect()->route('order.show')->with('status', $status);
    }
    public function filter(Request $request)
    {
        $status = $request->input('status');
        $filter = $request->input('btn_filter');
        if ($status == 'all') {
            $orders = Order::orderBy('created_at','desc')->get();
            if ($filter == 'type') {
                $type = $request->input('type');
                if (!empty($type))
                {if ($type == 'open') {
                    $orders = Order::whereNot('delivery_status', 'Đã hủy')->whereNot('delivery_status', 'Hoàn thành')->orderBy('created_at','desc')->get();
                } else if ($type == 'store') {
                    $orders = Order::where('delivery_status', 'Hoàn thành')->orderBy('created_at','desc')->get();
                } else {
                    if ($type == 'cancel') $orders = Order::where('delivery_status', 'Đã hủy')->orderBy('created_at','desc')->get();
                }
                    
                }
            } else if ($filter == 'payment') {
                $payment = $request->input('payment');
                if (!empty($payment))
                $orders = Order::where('payment_status', $payment)->orderBy('created_at','desc')->get();
            } else if ($filter == 'delivery') {
                $ships = $request->input('ship');
                if (!empty($ships))
                $orders = Order::whereIn('delivery_status', $ships)->orderBy('created_at','desc')->get();
            } else if ($filter == 'arrange') {
                $arrange = $request->input('arrange');
                if (!empty($arrange))
               { 
                $arrange = explode(",", $arrange);
                $part_1 = $arrange[0];
                $part_2 = $arrange[1];
                $orders = Order::orderBy($part_1, $part_2)->get();
               }
            }
        } else {
            $orders = Order::where('user_id', Auth::user()->id)->orderBy('created_at','desc')->get();
            if ($filter == 'type') {
                $type = $request->input('type');
                if (!empty($type))
                {if ($type == 'open') {
                    $orders = Order::where('user_id', Auth::user()->id)->whereNot('delivery_status', 'Đã hủy')->whereNot('delivery_status', 'Hoàn thành')->orderBy('created_at','desc')->get();
                } else if ($type == 'store') {
                    $orders = Order::where('user_id', Auth::user()->id)->where('delivery_status', 'Hoàn thành')->orderBy('created_at','desc')->get();
                } else {
                    if ($type == 'cancel') $orders = Order::where('user_id', Auth::user()->id)->where('delivery_status', 'Đã hủy')->orderBy('created_at','desc')->get();
                }
                }
            } else if ($filter == 'payment') {
                $payment = $request->input('payment');
                if (!empty($payment))
                $orders = Order::where('user_id', Auth::user()->id)->where('payment_status', $payment)->orderBy('created_at','desc')->get();
            } else if ($filter == 'delivery') {
                $ships = $request->input('ship');
                if (!empty($ships)) 
                $orders = Order::where('user_id', Auth::user()->id)->whereIn('delivery_status', $ships)->orderBy('created_at','desc')->get();
            } else if ($filter == 'arrange') {
                $arrange = $request->input('arrange');
                if (!empty($arrange)) 
                {$arrange = explode(",", $arrange);
                $part_1 = $arrange[0];
                $part_2 = $arrange[1];
                $orders = Order::where('user_id', Auth::user()->id)->orderBy($part_1, $part_2)->get();
                }
            }
        }
        $request->session()->put('orders', $orders);
        return redirect()->route('order.show', ['status' => $status]);
    }
    function search_ajax(Request $request)
    {
        if ($request->input('query')) {

            $query = $request->input('query');
            $data = Order::find($query);
            $output = '<ul class="dropdown-menu" style="display:block; position:relative">';
            if (!empty($data->id))
                $output .= '
               <li class ="px-3"><a href="' . route('order.detail', $data->id) . '">' . "Đơn hàng  #" . $data->id . '</a></li>
               ';
            else
                $output .= '
            <li class ="px-3">' . "Không tồn tại đơn hàng trên"  . '</li>
            ';
            $output .= '</ul>';
            echo $output;
        }
    }
}
