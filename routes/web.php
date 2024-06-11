<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminUserController;
use Illuminate\Auth\Middleware\Authenticate;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CatController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ClientCustomerController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ChatController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('admin/login', [AdminUserController::class, 'login'])->name('admin.login');
Route::post('admin/login_handle', [AdminUserController::class, 'login_handle'])->name('admin.login_handle');
Route::middleware('auth')->group(function () {

    Route::get('admin/', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('search_admin_ajax', [DashboardController::class, 'search_admin_ajax'])->name('search_admin_ajax');
    Route::get('admin/user/show', [AdminUserController::class, 'show'])->name('admin_user.show')->can('user.show');
    Route::get('admin/user/add', [AdminUserController::class, 'add'])->name('admin_user.add')->can('user.add');
    Route::post('admin/user/store', [AdminUserController::class, 'store'])->name('admin_user.store')->can('user.add');
    Route::get('admin/user/profile/{id}', [AdminUserController::class, 'profile_show'])->name('admin_user.profile')->can('user.profile');
    Route::get('admin/user/edit/{id}', [AdminUserController::class, 'edit'])->name('admin_user.edit')->can('user.update');
    Route::post('admin/user/update/{id}', [AdminUserController::class, 'update'])->name('admin_user.update')->can('user.update');
    Route::get('admin/user/softdelete/{id}', [AdminUserController::class, 'softdelete'])->name('admin_user.softdelete')->can('user.delete');
    Route::get('admin/user/search', [AdminUserController::class, 'search_ajax'])->name('admin_user.search_ajax')->can('user.search');
    Route::get('admin/user/force_delete/{id}', [AdminUserController::class, 'force_delete'])->name('admin_user.force_delete')->can('user.force_delete');
    Route::get('admin/user/restore/{id}', [AdminUserController::class, 'restore'])->name('admin_user.restore')->can('user.restore');
    Route::post('admin/user/action', [AdminUserController::class, 'action'])->name('admin_user.action')->can('user.action');
    Route::post('admin/user/arrange', [AdminUserController::class, 'arrange'])->name('admin_user.arrange');
    Route::get('admin/logout', [AdminUserController::class, 'logout'])->name('admin.logout');
    Route::get('admin/permission/show', [PermissionController::class, 'show'])->name('permission.show')->can('permission.show');
    Route::post('admin/permission/store', [PermissionController::class, 'store'])->name('permission.store')->can('permission.add');
    Route::get('admin/permission/edit/{id}', [PermissionController::class, 'edit'])->name('permission.edit')->can('permission.edit');
    Route::post('admin/permission/update/{id}', [PermissionController::class, 'update'])->name('permission.update')->can('permission.edit');
    Route::get('admin/permission/delete/{id}', [PermissionController::class, 'delete'])->name('permission.delete')->can('permission.edit');
    Route::get('admin/role/show', [RoleController::class, 'show'])->name('role.show')->can('role.show');
    Route::get('admin/role/add', [RoleController::class, 'add'])->name('role.add')->can('role.add');
    Route::post('admin/role/store', [RoleController::class, 'store'])->name('role.store')->can('role.add');
    Route::get('admin/role/edit/{id}', [RoleController::class, 'edit'])->name('role.edit')->can('role.edit');
    Route::post('admin/role/update/{id}', [RoleController::class, 'update'])->name('role.update')->can('role.edit');
    Route::get('admin/role/delete/{id}', [RoleController::class, 'delete'])->name('role.delete')->can('role.delete');
    Route::get('admin/cat/add', [CatController::class, 'add'])->name('cat.add')->can('cat.add');
    Route::post('admin/cat/store', [CatController::class, 'store'])->name('cat.store')->can('cat.store');
    Route::get('admin/cat/show', [CatController::class, 'show'])->name('cat.show')->can('cat.show');
    Route::get('admin/cat/detail/{id}', [CatController::class, 'detail'])->name('cat.detail')->can('cat.detail');
    Route::post('admin/cat/action/{id}', [CatController::class, 'action'])->name('cat.action')->can('cat.action');
    Route::get('admin/product/add', [ProductController::class, 'add'])->name('product.add')->can('product.add');
    Route::post('admin/product/store', [ProductController::class, 'store'])->name('product.store')->can('product.store');
    Route::get('admin/product/show', [ProductController::class, 'show'])->name('product.show')->can('product.show');
    Route::get('admin/product/detail/{id}', [ProductController::class, 'detail'])->name('product.detail')->can('product.detail');
    Route::post('admin/product/action/{id}', [ProductController::class, 'action'])->name('product.action')->can('product.action');
    Route::get('admin/product/thumb/delete/{id}', [ProductController::class, 'thumb_delete'])->name('thumb.delete')->can('thumb.delete');
    Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
        \UniSharp\LaravelFilemanager\Lfm::routes();
    });
    Route::get('admin/product/your_products', [ProductController::class, 'your_products'])->name('your_products')->can('product.yourproducts');
    Route::any('admin/product/filter', [ProductController::class, 'filter'])->name('product.filter')->can('product.filter');
    Route::get('admin/product/search', [ProductController::class, 'search_ajax'])->name('product.search_ajax')->can('product.searchajax');
    Route::get('admin/customer/show', [CustomerController::class, 'show'])->name('customer.show')->can('customer.show');
    Route::get('admin/customer/profile/{id}', [CustomerController::class, 'profile'])->name('customer.profile')->can('customer.profile');
    Route::get('admin/customer/search', [CustomerController::class, 'search_ajax'])->name('customer.search_ajax')->can('customer.searchajax');
    Route::post('admin/customer/update/{id}', [CustomerController::class, 'update'])->name('customer.update')->can('customer.update');
    Route::get('admin/customer/delete/{id}', [CustomerController::class, 'delete'])->name('customer.delete')->can('customer.delete');
    Route::get('admin/order/show', [OrderController::class, 'show'])->name('order.show')->can('order.show');
    Route::get('admin/order/detail/{id}', [OrderController::class, 'detail'])->name('order.detail')->can('order.detail');
    Route::get('admin/order/ship/{id}', [OrderController::class, 'ship'])->name('order.ship')->can('order.ship');
    Route::post('admin/order/cancel/{id}', [OrderController::class, 'cancel'])->name('order.cancel')->can('order.cancel');
    Route::get('admin/order/{status}/{id}', [OrderController::class, 'status'])->name('order.status')->can('order.status');
    Route::get('admin/order/payment/complete/{id}', [OrderController::class, 'payment_complete'])->name('order.payment_complete')->can('order.pmcompleted');
    Route::post('admin/order/to_return/{id}', [OrderController::class, 'to_return'])->name('order.to_return')->can('order.toreturn');
    Route::post('admin/order/filter', [OrderController::class, 'filter'])->name('order.filter')->can('order.filter');
    Route::get('admin/order/search', [OrderController::class, 'search_ajax'])->name('order.search_ajax')->can('order.searchajax');
    Route::get('admin/dashboard', [DashboardController::class, 'index'])->name('dashboard')->can('dashboard.view');
    Route::get('admin/current_user', [AdminUserController::class, 'current_user'])->name('current_user');
    Route::post('reset_password', [AdminUserController::class, 'reset_password'])->name('reset_password');
    Route::get('chat/getConversation', [ChatController::class, 'getConversation'])->name('chat.getConversation');




    Route::get('admin/advise', [ChatController::class, 'advise'])->name('advise');
    Route::get("chat/sendToCustomer", [ChatController::class, 'sendToCustomer'])->name('chat.sendToCustomer');
});
Route::get('/', [ClientController::class, 'index'])->name('client.index');
Route::get("/chat/handle",[ChatController::class, 'handle'])->name('chat.handle');
Route::group(['prefix' => 'sapo'], function () {
    Route::get('login', [ClientCustomerController::class, 'login'])->name('client.login');
    Route::get('register', [ClientCustomerController::class, 'register'])->name('client.register');
    Route::get('/', [ClientController::class, 'index'])->name('client.index');
    Route::post('register/handle', [ClientCustomerController::class, 'register_handle'])->name('client.register_handle');
    Route::post('login/handle', [ClientCustomerController::class, 'login_handle'])->name('client.login_handle');
    Route::get('logout', [ClientCustomerController::class, 'logout'])->name('client.logout');
    Route::get('product/{name}/{id}', [ClientController::class, 'detail'])->name('c_product.detail');
    Route::get('type/{type}/form/{form}/key/{key}', [ClientController::class, 'search_key'])->name('client.search_key');
    Route::get('type/{type}/cat/{cat}', [ClientController::class, 'search_cat'])->name('client.search_cat');
    Route::get('type/{type}/sort/{sort}', [ClientController::class, 'sort'])->name('client.sort');
    Route::get('type/{type}', [ClientController::class, 'search_type'])->name('client.search_type');
    Route::post('{type}/filter', [ClientController::class, 'filter_products'])->name('client.filter_products');
    Route::get('search_ajax', [ClientController::class, 'search_ajax'])->name('client.search_ajax');
    Route::get('search', [ClientController::class, 'search'])->name('client.search');
    Route::get('recover_pass', [ClientCustomerController::class, 'recover_pass'])->name('client.recover_pass');
    Route::post('reset_pass', [ClientCustomerController::class, 'reset_pass'])->name('client.reset_pass');
    Route::middleware('auth.customer')->group(function () {
        Route::post('cart/{id}', [ClientController::class, 'cart_act'])->name('client.cart_act');
        Route::get('cart/show', [ClientController::class, 'cart_show'])->name('client.cart_show');
        Route::get('cart/cal', [ClientController::class, 'cart_cal'])->name('client.cart_cal');
        Route::get('cart/delete_item/{id}', [ClientController::class, 'delete_item'])->name('client.delete_item');
        Route::get('cart/delete_all', [ClientController::class, 'delete_all'])->name('client.delete_all');
        Route::post('pay', [ClientController::class, 'pay'])->name('client.pay');
        Route::get('buynow', [ClientController::class, 'buynow'])->name('client.buynow');
        Route::post('buynow/completed', [ClientController::class, 'bn_completed'])->name('client.buynow_completed');
        Route::get('checkout', [ClientController::class, 'checkout'])->name('client.checkout');
        Route::post('order', [ClientController::class, 'order'])->name('client.order');
        Route::get('completed/{id}', [ClientController::class, 'completed'])->name('client.cart_completed');
        Route::get('profile', [ClientCustomerController::class, 'profile'])->name('client.profile');
        Route::get('profile/edit', [ClientCustomerController::class, 'edit'])->name('client.profile_edit');
        Route::post('profile/update', [ClientCustomerController::class, 'update'])->name('client.profile_update');
        Route::post('profile/edit_password', [ClientCustomerController::class, 'edit_password'])->name('client.profile_editpass');
        Route::post('feedback', [ClientCustomerController::class, 'feedback'])->name('client.feedback');
        Route::get('review', [ClientController::class, 'review'])->name('review');
        Route::get("chat/send", [ChatController::class, 'send'])->name('chat.send');
    });
});
