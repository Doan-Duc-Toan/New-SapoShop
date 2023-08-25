<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\Models\Order;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //public function boot()
        View::composer('*', function ($view) {
            if (Auth::guard('customers')->check()) {
                if (Auth::guard('customers')->user()->draft_order) {
                    $draft_order = Order::find(Auth::guard('customers')->user()->draft_order);
                    $count = $draft_order->orderDetails->count();
                    // $count =5;
                } else {
                    $count = 0;
                }
                $view->with('count_product', $count);
            }
        });
    }
}
