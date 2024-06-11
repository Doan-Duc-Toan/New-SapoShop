<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
use App\Models\Feedback;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPassMail;
use App\Models\User;
use App\Models\Conversation;

class ClientCustomerController extends Controller
{
    //
    function login()
    {
        return view('client.login');
    }
    function login_handle(Request $request)
    {
        $validate = $request->validate([
            'email' => 'required|email',
            'password' => 'required|regex:/^[A-Za-z0-9!@#$%^&*()_]{6,32}$/',
        ]);
        $email = $request->input('email');
        $password = $request->input('password');
        if (Auth::guard('customers')->attempt(['email' => $email, 'password' => $password])) {
            return redirect()->route('client.index');
        } else return redirect()->route('client.login')->with('error', 'Thông tin đăng nhập không chính xác');
        // return $request->all();
    }
    function register()
    {
        return view('client.register');
    }
    function register_handle(Request $request)
    {
        $validate  = $request->validate([
            'fullname' => 'required|string|min:5|max:50',
            'email' => 'required|unique:customers|email',
            'password' => 'required|regex:/^[A-Za-z0-9!@#$%^&*()_]{6,32}$/',
            'phone' => 'required|unique:customers|regex:/^[0-9]{10}$/',
            'address' => 'required'
        ]);
        $address = $request->input('address');
        $gender = $request->input('gender');
        $customer = Customer::create([
            'email' => $request->input('email'),
            'fullname' => $request->input('fullname'),
            'phone' => $request->input('phone'),
            'password' => Hash::make($request->input('password')),
            'address' => $address,
            'gender' => $gender,
        ]);
        $adminUserId = User::whereHas('roles', function ($query) {
            $query->where('name', 'admin');
        })->first()->id;
        Conversation::create([
            'user_id' => $adminUserId,
            'customer_id' => $customer->id
        ]);
        return redirect()->route('client.login')->with('status', 'Đã đăng kí tài khoản thành công');
    }
    function logout()
    {
        Auth::guard('customers')->logout();
        return redirect()->route('client.index');
    }
    function profile(Request $request)
    {
        if (!empty($request->input('status')))
            $status = $request->input('status');
        else $status = 'show';
        $customer = Auth::guard('customers')->user();
        $order_count = $customer->orders->whereNotIn('delivery_status', 'Đơn hàng nháp')->count();
        if ($status == 'order_history') {
            $orders = $customer->orders->whereNotIn('delivery_status', 'Đơn hàng nháp');
            return view('client.profile.show', compact('customer', 'status', 'orders', 'order_count'));
        }
        if ($status == 'order_detail') {
            $id = $request->input('id');
            $order = Order::find($id);
            return view('client.profile.show', compact('customer', 'status', 'order', 'order_count'));
        }
        return view('client.profile.show', compact('customer', 'status', 'order_count'));
    }
    function edit()
    {
        $customer = Auth::guard('customers')->user();
        return view('client.profile.edit', compact('customer'));
    }
    function update(Request $request)
    {
        $customer = Auth::guard('customers')->user();
        $validate  = $request->validate([
            'fullname' => 'required|string|min:5|max:50',
            'email' => 'required|unique:customers,email,' . $customer->id . '|email',
            'phone' => 'required|unique:customers,phone,' . $customer->id . '|regex:/^[0-9]{10}$/',
            'address' => 'required'
        ]);
        $address = $request->input('address');
        $gender = $request->input('gender');
        $customer->update([
            'email' => $request->input('email'),
            'fullname' => $request->input('fullname'),
            'phone' => $request->input('phone'),
            'address' => $address,
            'gender' => $gender,
        ]);
        return redirect()->route('client.profile')->with('status', 'Đã cập nhật thông tin cá nhân thành công.');
    }
    function edit_password(Request $request)
    {
        $customer = Auth::guard('customers')->user();
        $old_pass = $request->input('old_password');
        if (Hash::check($old_pass, Auth::guard('customers')->user()->password)) {
            // return "0";
            $validate = $request->validate([
                're_password' => 'required|regex:/^[A-Za-z0-9!@#$%^&*()_]{6,32}$/',
                'password_confirmation' => 'required|same:re_password'
            ]);
            $customer->password = Hash::make($request->input('re_password'));
            $customer->save();
            return redirect()->route('client.login')->with('status', 'Đã đổi mật khẩu thành công, hãy đăng nhập lại.');
        } else return redirect()->route('client.profile', ['status' => 'change_pass'])->with('error', 'Mật khẩu bạn nhập không chính xác!');
    }
    function feedback(Request $request)
    {
        $validate = $request->validate([
            'title' => 'required|string',
            'content' => 'required|string'
        ]);
        $feedback = Feedback::create([
            'customer_id' => Auth::guard('customers')->user()->id,
            'section' => $request->input('section'),
            'title' => $request->input('title'),
            'content' => $request->input('content'),
        ]);
        return redirect()->back()->with('status', 'Đã gửi góp ý của bạn thành công.');
    }
    function recover_pass()
    {
        return view('client.recover_pass');
    }
    function reset_pass(Request $request)
    {

        $email = $request->input('email');
        if (empty(Customer::where('email', $email)->first())) return redirect()->route('client.login')->with('notify', 'Tài khoản bạn nhập không tồn tại trong hệ thống');
        $password = Str::random(8);
        $new_pass = Hash::make($password);
        Customer::where('email', $email)->update(['password' => $new_pass]);
        $customer = Customer::where('email', $email)->get();
        $data = [
            'email' => $email,
            'password' => $password
        ];
        Mail::to($email)
            ->send(new ResetPassMail($data));
        return redirect()->route('client.login')->with('status', 'Đã gửi mật khẩu đến email của bạn thành công.');
    }
}
