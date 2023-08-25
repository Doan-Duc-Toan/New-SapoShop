<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Customer;
use App\Models\Product_Color;
use App\Models\NotifiCation;

class DashboardController extends Controller
{
    //
    function index()
    {
        // $order_completed= Order::where('delivery_status','Hoàn thành')->get();
        // $order_in_day = $order_completed->whereDate('created_at', '2023-07-03');

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
        return view('admin.dashboard.index', compact('amounts', 'total', 'customer', 'orders_of_day', 'trending_product', 'messages'));
    }
}
