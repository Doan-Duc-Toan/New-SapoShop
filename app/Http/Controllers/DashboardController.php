<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Customer;
use App\Models\Product_Color;
use App\Models\NotifiCation;
use App\Models\Product;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    //
    function index()
    {
        // $order_completed= Order::where('delivery_status','Hoàn thành')->get();
        // $order_in_day = $order_completed->whereDate('created_at', '2023-07-03');
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();

        $orders_of_day = Order::where('delivery_status', 'Hoàn thành')
            ->whereDate('updated_at', Carbon::today())
            ->get();
        $total = 0;
        $customer = Customer::get();
        foreach ($orders_of_day as $order) {
            $total += $order->payment_amount;
        }
        // $startDate = Carbon::now()->subDays(6);
        // $endDate = Carbon::now();

        // $amounts = Order::where('delivery_status', 'Hoàn thành')->whereBetween('updated_at', [$startDate, $endDate])->pluck('payment_amount')->toArray(6);

        $startDate = Carbon::now()->subDays(5)->format('Y-m-d');
        $endDate = Carbon::now()->format('Y-m-d');

        $orders = Order::where('delivery_status', 'Hoàn thành')
            ->whereBetween('updated_at', [$startDate . ' 00:00:00', $endDate . ' 23:59:59'])
            ->pluck('payment_amount', 'updated_at')
            ->toArray();
        $newOrders = [];
        foreach ($orders as $date => $amount) {
            $formattedDate = date('Y-m-d', strtotime($date));
            if (!array_key_exists($formattedDate, $newOrders))
                $newOrders[$formattedDate] = $amount;
            else $newOrders[$formattedDate] += $amount;
        }
        $amounts = [];

        for ($date = Carbon::createFromFormat('Y-m-d', $startDate); $date <= Carbon::createFromFormat('Y-m-d', $endDate); $date->addDay()) {
            $formattedDate = $date->format('Y-m-d');
            $amount = isset($newOrders[$formattedDate]) ? $newOrders[$formattedDate] : 0;
            $amounts[] = $amount;
        }
        foreach ($amounts as &$amount) {
            if ($amount != 0) {
                $amount = number_format($amount / 1000000, 1, ',', '.');
                $amount = floatval(str_replace(['.', ','], ['', '.'], $amount));
            }
        }
        $trending_product = Product_Color::orderBy('sold', 'desc')->take(5)->get();
        $messages = Notification::orderBy('created_at', 'desc')->get();
        return view('admin.dashboard.index', compact('amounts', 'total', 'customer', 'orders_of_day', 'trending_product', 'messages', 'conversations', 'conversationIds', 'checkNew'));
    }
    function search_admin_ajax(Request $request)
    {
        if ($request->input('query')) {

            $query = $request->input('query');
            $data1 = Order::find($query);
            $output = '<ul class="dropdown-menu" style="display:block; position:relative"><li class ="px-3">' . "Đơn hàng"  . '</li>';
            if (!empty($data1->id))
                $output .= '
               <li class ="px-3"><a href="' . route('order.detail', $data1->id) . '">' . "Đơn hàng  #" . $data1->id . '</a></li>
               ';
            $data2 = Product::where('name', 'LIKE', "%{$query}%")->get();

            $output .= '<li class ="px-3">' . "Sản phẩm"  . '</li>';
            foreach ($data2 as $row) {
                $output .= '
               <li class ="px-3"><a href="' . route('product.detail', $row->id) . '">' . "  " . $row->id . "---" . $row->name . '</a></li>
               ';
            }
            $data3 = Customer::where('fullname', 'LIKE', "%{$query}%")->get();
            $output .= '<li class ="px-3">' . "Khách hàng"  . '</li>';
            foreach ($data3 as $row) {
                $output .= '
               <li><a href="' . route('customer.profile', $row->id) . '">' . "  " . $row->id . "---" . $row->fullname . '</a></li>
               ';
            }

            $data4 = User::where('fullname', 'LIKE', "%{$query}%")->get();
            $output .= '<li class ="px-3">' . "Người dùng"  . '</li>';
            foreach ($data4 as $row) {
                $output .= '
               <li><a href="' . route('admin_user.profile', $row->id) . '">' . "  " . $row->id . "---" . $row->fullname . '</a></li>
               ';
            }

            $output .= '</ul>';
            echo $output;
        }
    }
}
