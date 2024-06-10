<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Customer;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Models\OrderDetail;
use App\Models\Color;
use App\Models\Cat;
use Illuminate\Support\Facades\Session;
use App\Models\NotifiCation;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderCompletedMail;
use App\Models\Review;
use App\Events\MessageSend;
class ClientController extends Controller
{
    //

    function index()
    {
        event(new MessageSend('Tạm biệt'));
        $products = Product::all();
        // $product = Product::find(8);
        //  return $product->thumbs;
        $randomProducts = Product::inRandomOrder()->take(10)->get();
        $randomSPhones = Product::where('type', 'Điện thoại')->inRandomOrder()->take(8)->get();
        $randomLaptops = Product::where('type', 'Laptop')->inRandomOrder()->take(8)->get();
        return view('client.index', compact('products', 'randomProducts', 'randomSPhones', 'randomLaptops'));
    }
    function detail($name, $id)
    {
        $product = Product::find($id);
        $product_review_count = $product->reviews->count();
        if ($product_review_count == 0) $product_review = 0;
        else
            $product_review = $product->reviews->sum('star') / $product_review_count;
        $product_review = number_format($product_review, 1, '.', '');
        if (Auth::guard('customers')->check()) {
            $customer = Auth::guard('customers')->user();
            $review = $customer->reviews->where('product_id', $product->id)->first();
            if ($review)
                $star = $review->star;
            else $star = 0;
            return view('client.product.detail', compact('product', 'star', 'product_review'));
        };
        return view('client.product.detail', compact('product', 'product_review'));
    }
    function cart_act($id, Request $request)
    {
        $product = Product::find($id);
        $product_colors = $product->product_color;
        $customer = Auth::guard('customers')->user();
        $act = $request->input('btn_act');
        if ($act == 'add_cart') {
            if (!$customer->draft_order) {
                $order = Order::create([
                    'customer_id' => $customer->id,
                    'payment_status' => 'Chưa thanh toán',
                    'payment_method' => 'Khi nhận hàng',
                    'payment_amount' => $request->input('count') * $product->price * 0.91,
                    'delivery_status' => 'Đơn hàng nháp',
                    'delivery_address' => 'Đang cập nhật',
                    'delivery_method' => 'Giao hàng tận nơi'
                ]);
                $order->products()->attach($product->id, ['color_id' => $request->input('color'), 'count' => $request->input('count')]);
                // $order->products()->attach($product->id, ['count' => $request->input('count')]);
                Customer::find($customer->id)->update(
                    ['draft_order' => $order->id]
                );
            } else {
                $order = Order::find($customer->draft_order);
                $order->update([
                    'payment_amount' => $request->input('count') * $product->price * 0.91 + $order->payment_amount
                ]);
                $orderDetails = $order->orderDetails;
                $check = false;
                foreach ($orderDetails as $orderDetail) {
                    if ($orderDetail->product_id == $product->id && $orderDetail->color_id == $request->input('color')) {
                        $check = true;
                        $orderDetail->update([
                            //'count' => $request->input('count') + $orderDetail->count;
                            'count' => $request->input('count') + $orderDetail->count
                        ]);
                        break;
                    }
                }
                if (!$check) {
                    $order->products()->attach($product->id, ['color_id' => $request->input('color'), 'count' => $request->input('count')]);
                }
                // return redirect()->route('c_product.detail', [$product->name, $product->id]);
            }
            return redirect()->back()->with('status', 'Đã thêm sản phẩm vào giỏ hàng thành công');
        } else if ($act == 'buy') {
            $customer = Auth::guard('customers')->user();
            $color = $request->input('color');
            $count = $request->input('count');
            $data = [
                'customer' => $customer,
                'product' => $product,
                'color' => $color,
                'count' => $count
            ];
            Session::put('data', serialize($data));
            return redirect()->route('client.buynow');
        }
    }
    function buynow()
    {
        $data = Session::get('data');
        if ($data) {
            $data = unserialize($data);
        } else {
            $data = [];
        }
        $customer = $data['customer'];
        $product = $data['product'];
        $count = $data['count'];
        $color = $data['color'];
        return view('client.cart.buynow', compact('customer', 'product', 'count', 'color'));
    }
    function bn_completed(Request $request)
    {
        $validate = $request->validate([
            'city' => 'required',
            'district' => 'required',
            'ward' => 'required'
        ]);
        $product = Product::find($request->input('product'));
        $delivery_address = "Thành phố {$request->input('city')}" . ", Quận  {$request->input('district')}" . ", Phường {$request->input('ward')}";
        $customer = Auth::guard('customers')->user();
        $color = $request->input('color');
        $count = $request->input('count');
        $order = Order::create([
            'customer_id' => $customer->id,
            'payment_status' => 'Chưa thanh toán',
            'payment_method' => $request->input('payment_method'),
            'payment_amount' => $request->input('count') * $product->price * 0.91,
            'delivery_status' => 'Chờ xử lý',
            'delivery_address' => $delivery_address,
            'delivery_method' => $request->input('delivery_method'),
            'note' => $request->input('note')
        ]);
        $order->products()->attach($product->id, ['color_id' => $request->input('color'), 'count' => $request->input('count')]);
        $order_detail = $order->orderDetails->first();
        Mail::to($customer->email)
            ->send(new OrderCompletedMail($order));
        return view('client.cart.bn_completed', compact('customer', 'order', 'order_detail'));
    }
    function cart_show()
    {
        if (Auth::guard('customers')->user()->draft_order) {
            $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
            $order_details = $draft_order->orderDetails;
            return view('client.cart.show', compact('order_details', 'draft_order'));
        } else return view('client.cart.show');
    }
    function cart_cal(Request $request)
    {
        $val = $request->input('val');
        $price = intval($request->input('price'));
        $new_price = $val * $price;
        $total_amount = $request->input('total_amount') + $price * $request->input('sign');
        $data  = [
            'new_price' => $new_price,
            'total_amount' => $total_amount
        ];
        return response()->json($data);
    }
    function delete_item($id)
    {
        $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
        $order_details = $draft_order->orderDetails;
        foreach ($order_details as $order_detail) {
            if ($order_detail->id == $id) {
                $draft_order->payment_amount = $draft_order->payment_amount - $order_detail->count * $order_detail->product->price * 0.91;
                if ($draft_order->payment_amount != 0)
                    $draft_order->save();
                else $draft_order->delete();
                $order_detail->delete();
                return redirect()->route('client.cart_show');
            }
        }
    }

    function delete_all()
    {
        $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
        $order_details = $draft_order->orderDetails;
        foreach ($order_details as $order_detail) {
            $order_detail->delete();
        }
        $draft_order->delete();
        return redirect()->route('client.cart_show');
    }
    function pay(Request $request)
    {
        $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
        $order_details = $draft_order->orderDetails;
        $counts = $request->input('counts');
        $draft_order->payment_amount = 0;
        foreach ($order_details as $order_detail) {
            $count = intval($counts[$order_detail->id]);
            $order_detail->count = $count;
            $order_detail->save();
            $draft_order->payment_amount += $order_detail->product->price * 0.91 * $order_detail->count;
        }
        $draft_order->save();
        return redirect()->route('client.checkout');
    }
    function checkout()
    {
        if (Auth::guard('customers')->user()->draft_order) {
            $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
            $order_details = $draft_order->orderDetails;
            $customer = Auth::guard('customers')->user();
            return view('client.cart.checkout', compact('order_details', 'draft_order', 'customer'));
        }
        return redirect()->route('client.index');
    }
    function order(Request $request)
    {
        if (Auth::guard('customers')->user()->draft_order) {
            $validate = $request->validate([
                'city' => 'required',
                'district' => 'required',
                'ward' => 'required'
            ]);
            $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
            $draft_order_id = $draft_order->id;
            $delivery_address = "Thành phố {$request->input('city')}" . ", Quận  {$request->input('district')}" . ", Phường {$request->input('ward')}";
            $draft_order = $draft_order->update([
                'payment_status' => 'Chưa thanh toán',
                'payment_method' => $request->input('payment_method'),
                'delivery_status' => 'Chờ xử lý',
                'delivery_address' => $delivery_address,
                'delivery_method' => $request->input('delivery_method'),
                'note' => $request->input('note')
            ]);

            $customer = Auth::guard('customers')->user();
            $title = "Đơn hàng mới";
            $message = "Khách hàng #$customer->id đã đặt đơn hàng #$customer->draft_order";
            Notification::create([
                'title' => $title,
                'message' => $message
            ]);
            $customer->draft_order = null;
            $customer->save();
            return redirect()->route('client.cart_completed', $draft_order_id);
        }
        return redirect()->route('client.index');
    }
    function completed($id)
    {

        $order = Order::find($id);
        $order_details = $order->orderDetails;
        $customer = Auth::guard('customers')->user();
        Mail::to($customer->email)
            ->send(new OrderCompletedMail($order));
        return view('client.cart.completed', compact('order', 'order_details', 'customer'));
    }
    function search_type($type)
    {

        $products = Product::where('type', $type)->get();
        $suppliers = Product::where('type', $type)->distinct()->pluck('supplier')->toArray();
        $cats = Cat::whereHas('products', function ($query) use ($type) {
            $query->where('type', $type);
        })->get();
        // Session::put('products', $products);
        session(['products' => $products]);
        return view('client.product.list', compact('products', 'suppliers', 'cats', 'type'));
    }
    function search_key($type, $form, $key)
    {
        if ($form == 'supplier') {
            if ($key != 'Android')
                $products = Product::where('type', $type)->where($form, $key)->get();
            else $products = Product::where('type', $type)->whereNot($form, 'Apple')->get();
        } else if ($form == 'price') {
            if ($key == 'Nhỏ hơn 10 triệu')
                $products = Product::where('type', $type)->where('price', '<', 10 * 1000000)->get();
            else if ($key == 'Từ 10 đến 20 triệu')
                $products = Product::where('type', $type)->where('price', '>', 10 * 1000000)->where('price', '<', 20 * 1000000)->get();
            else if ($key == 'Từ 20 đến 30 triệu')
                $products = Product::where('type', $type)->where('price', '>', 20 * 1000000)->where('price', '<', 30 * 1000000)->get();
            else if ($key == 'Lớn hơn 30 triệu')
                $products = Product::where('type', $type)->where('price', '>', 30 * 1000000)->get();
        } else
            $products = Product::where('type', $type)->where($form, 'LIKE', '%' . $key . '%')->get();
        $suppliers = Product::where('type', $type)->distinct()->pluck('supplier')->toArray();
        $cats = Cat::whereHas('products', function ($query) use ($type) {
            $query->where('type', $type);
        })->get();
        session(['products' => $products]);;
        return view('client.product.list', compact('products', 'suppliers', 'cats', 'type'));
    }
    function search_cat($type, $cat)
    {
        $products = Product::where('type', $type)->whereHas('cats', function ($query) use ($cat) {
            $query->where('name', 'LIKE', '%' . $cat . '%');
        })->get();
        // Session::put('products', serialize($products));
        session(['products' => $products]);
        $suppliers = Product::where('type', $type)->distinct()->pluck('supplier')->toArray();
        $cats = Cat::whereHas('products', function ($query) use ($type) {
            $query->where('type', $type);
        })->get();
        return view('client.product.list', compact('products', 'suppliers', 'cats', 'type'));
    }
    function filter_products(Request $request, $type)
    {
        $max = $request->input('maximum_price') * 1000000;
        $min = $request->input('minimum_price') * 1000000;
        $products = session('products');
        if (!empty($products)) {
            if (!empty($min) && !empty($max)) {
                $products = $products->filter(function ($product) use ($min, $max) {
                    return $product->price * 0.9 >= $min && $product->price * 0.9 <= $max;
                });
            } else if (!empty($min) && empty($max)) {
                $products = $products->filter(function ($product) use ($min, $max) {
                    return $product->price * 0.9 >= $min;
                });
            } else if (empty($min) && !empty($max)) {
                $products = $products->filter(function ($product) use ($min, $max) {
                    return $product->price * 0.9 <= $max;
                });
            }
        }
        $suppliers = Product::where('type', $type)->distinct()->pluck('supplier')->toArray();
        $cats = Cat::whereHas('products', function ($query) use ($type) {
            $query->where('type', $type);
        })->get();
        return view('client.product.list', compact('products', 'suppliers', 'cats', 'type', 'max', 'min'));
    }
    function sort($type, $sort)
    {
        $products = session('products');
        if (!empty($products)) {
            if ($sort == 'Desc') {
                $products = $products->sortByDesc('price');
            }
            if ($sort == 'Asc') {
                $products = $products->sortBy('price');
            }
            if ($sort == 'Newest') {
                $products = $products->sortBy('created_at');
            }
        }
        $suppliers = Product::where('type', $type)->distinct()->pluck('supplier')->toArray();
        $cats = Cat::whereHas('products', function ($query) use ($type) {
            $query->where('type', $type);
        })->get();
        return view('client.product.list', compact('products', 'suppliers', 'cats', 'type'));
    }
    function search_ajax(Request $request)
    {
        if ($request->input('query')) {

            $query = $request->input('query');
            $data = Product::where('name', 'LIKE', "%{$query}%")->orWhere('type', 'LIKE', "%{$query}%")->get();
            $output = '<ul>';
            if (!empty($data->first())) {
                foreach ($data as $product) {
                    $thumb = $product->thumbs->first();
                    $link = $thumb->link;
                    $output .= '
                <li>
                <img src="' . asset($link) . '"
                    alt="">
                <div class="search_detail">
                    <a href="' . route('c_product.detail', [$product->name, $product->id]) . '" class="search_name">' . $product->name . '</a>
                    <div class="price">
                        <span class="new-p">' .  number_format($product->price * 0.91, 0, '.', ',') . ' đ' . '</span>
                        <span class="old-p text-secondary">' .  number_format($product->price, 0, '.', ',') . ' đ'  . '</span>
                    </div>
                </div>
             </li>
               ';
                }
            } else $output .= '<li style ="color:#D60019; font-size:17px; font-weight:600; ">Không có sản phẩm nào</li>';
            $output .= '</ul>';
            echo $output;
        }
    }
    function search(Request $request)
    {
        $key = $request->input('key_search');
        $products = Product::where('name', 'LIKE', "%{$key}%")->orWhere('type', 'LIKE', "%{$key}%")->get();
        $count = $products->count();
        return view('client.product.search_results', compact('products', 'key', 'count'));
    }
    function review(Request $request)
    {
        $star = $request->input('star');
        $customer = Auth::guard('customers')->user();
        $product_id = $request->input('product_id');
        $review = $customer->reviews->where('product_id', $product_id)->first();
        if ($review) {
            $review->star = $star;
            $review->save();
        } else {
            Review::create([
                'customer_id' => $customer->id,
                'product_id' => $product_id,
                'star' => $star
            ]);
        }
    }
}
