@extends('client.layout')
@section('content')
    <link rel="stylesheet" href="{{ asset('client/css/profile.css') }}">
    <link rel="stylesheet" href="{{asset('client/css/toast-respon.css')}}">
    @if (!empty(session('status')))
            <script>
                $(document).ready(function() {
                    setTimeout(function() {
                        $(".wr-toast").show(500)
                    }, 0)
                    setTimeout(function() {
                        $(".wr-toast").hide(500); // Ẩn trong 0.5 giây
                    }, 4000);
                    $('.toast-x').click(function() {
                        $(".toast-notify").hide(500);
                    })
                })
            </script>
            <div class="wr-toast">
                <div class="toast-notify">
                    <div class="toast-icon center">
                        <span class="center"><i class="fa-solid fa-check"></i></span>
                    </div>
                    <div class="toast-body">
                        <span class="toast-title">
                            <b>Thành công</b>
                        </span><br>
                        <span class="toast-content">
                            {{session('status')}}
                        </span>
                    </div>
                    <div class="toast-x">
                        <span><i class="fa-solid fa-x"></i></span>
                    </div>
                </div>
            </div>
        @endif
        @if (!empty(session('error')))
            <script>
                $(document).ready(function() {
                    setTimeout(function() {
                        $(".wr-toast").show(500)
                    }, 0)
                    setTimeout(function() {
                        $(".wr-toast").hide(500); // Ẩn trong 0.5 giây
                    }, 4000);
                    $('.toast-x').click(function() {
                        $(".toast-notify").hide(500);
                    })
                })
            </script>
            <div class="wr-toast">
                <div class="toast-notify" style="border-left: 5px solid #EA2027 !important;">
                    <div class="toast-icon center">
                        <span class="center" style= "background-color:#EA2027 !important;color: #FFFFFF; font-size:17px;">!</span>
                    </div>
                    <div class="toast-body">
                        <span class="toast-title">
                            <b>Xảy ra lỗi</b>
                        </span><br>
                        <span class="toast-content">
                            {{session('error')}}
                        </span>
                    </div>
                    <div class="toast-x">
                        <span><i class="fa-solid fa-x"></i></span>
                    </div>
                </div>
            </div>
        @endif
    <nav id="breadcrumb-nav" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('client.index') }}"><i class="fa-solid fa-house"></i> Trang chủ</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin cá nhân</li>
            <!-- <li class="breadcrumb-item active" aria-current="page">Data</li> -->
        </ol>
    </nav>
    <div id="content">
        <div id="profile-left">
            <div id="pl-top">
                <div class="pl-top-item" id="order_history">
                    <div class="img-pltop">
                        <img src="{{ asset('client/img/checklist.webp') }}" alt="">
                        <span class="center">{{$order_count}}</span>
                    </div>
                    <a href="{{ route('client.profile', ['status' => 'order_history']) }}"  class="@php
if($status == 'order_history')echo "pr-active"; @endphp">Lịch sử đơn hàng</a>
                </div>
                <div class="pl-top-item" id="hello">
                    <div class="img-pltop">
                        @if ($customer->gender == 'male')
                            <img src="{{ asset('client/img/account.webp') }}" alt="">
                        @else
                            <img src="{{ asset('client/img/female.webp') }}" alt="">
                        @endif
                    </div>
                    <a href="{{ route('client.profile', ['status' => 'show']) }}"
                        class="@php
if($status == 'show')echo "pr-active"; @endphp">Hi, {{ $customer->fullname }}!</a>
                </div>
            </div>
            <div id="pl-bot">
                @if ($status == 'show')
                    <h4>Thông tin cá nhân</h4>
                    <span><b>Họ và tên: </b> {{ $customer->fullname }}</span><br>
                    <span><b>Email: </b>{{ $customer->email }}</span><br>
                    <span><b>Số điện thoại:</b> {{ $customer->phone }}</span><br>
                    <span><b>Địa chỉ:</b> {{ $customer->address }}</span>
                @endif

                @if ($status == 'change_pass')
                    <h4>Đổi mật khẩu</h4>
                    <form action="{{ route('client.profile_editpass') }}" method="POST">
                        @csrf
                        <label for="old-pass">Mật khẩu hiện tại</label>
                        <input type="password" name="old_password" placeholder="Nhập mật hiện tại">
                        <label for="new-pass">Mật khẩu mới</label>
                        <input type="password" placeholder="Nhập mật khẩu mới" name="re_password">
                        @error('password')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                        <label for="renew-pass">Nhập lại mật khẩu mới</label>
                        <input type="password" placeholder="Nhập lại mật khẩu mới" name="password_confirmation">
                        @error('password_confirmation')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                        <button name="btn_updatepass">Đổi mật khẩu</button>
                    </form>
                @endif

                @if ($status == 'order_history')
                    <h4>Danh sách đơn hàng</h4>
                    <ul id="list-order">
                        @foreach ($orders as $order)
                            <li class="order-item">
                                <a href="{{ route('client.profile', ['status' => 'order_detail', 'id' => $order->id]) }}">
                                    <div class="oi-left">
                                        <span class="order-status"><b>#{{ $order->id }}</b> -
                                            {{ $order->payment_status }} - {{ $order->delivery_status }}</span><br>
                                        <span class="order-address"><b>Địa chỉ giao hàng:</b>
                                            {{ $order->delivery_address }}</span><br>
                                        <span class="order-time"><b>Ngày:</b> {{ $order->created_at }}</span>
                                    </div>
                                    <div class="oi-right">
                                        <span
                                            class="amount">{{ number_format($order->payment_amount, 0, '.', ',') . ' đ' }}</span>
                                    </div>
                                </a>
                            </li>
                        @endforeach

                    </ul>
                @endif

                @if ($status == 'order_detail')
                    <h4>Chi tiết đơn hàng #{{ $order->id }}</h4>
                    <ul class="od-list">
                        <li class="od-item">
                            <span><b>Ngày tạo: </b>{{ $order->created_at }}</span><br>
                            <span class="pr-active">{{ $order->delivery_status }}</span>
                        </li>
                        <li class="od-item">
                            <h5 class="pr-active">Thông tin giao hàng</h5>
                            <div class="sp-bt">
                                <span><b>Tên người nhận:</b> <br> {{ $customer->fullname }}</span>
                                <span><b>Số điện thoại:</b> <br> {{ $customer->phone }}</span>
                            </div>
                        </li>
                        <li class="od-item">
                            <span><b>Địa chỉ giao hàng:</b> <br>{{ $order->delivery_address }}</span>
                        </li>
                        <li class="od-item">
                            <span><b>Thanh toán:</b></span><br>
                            <span class="pr-active">{{ $order->payment_status }}</span>
                        </li>
                        <li class="od-item">
                            <span><b>Phương thức thanh toán:</b></span><br>
                            <span style="color: #2DA853;font-weight: 700;">{{ $order->payment_method }}</span>
                        </li>
                        <li class="od-item">
                            <h5 class="pr-active">Danh sách sản phẩm</h5><br>
                            <ul class="list-product-in-order">
                                @foreach ($order->orderDetails as $order_detail)
                                    <li class="product-order">
                                        <div class="p-cart-detail">
                                            <div class="img-p-cart">
                                                @php
                                                    $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color->id)->first();
                                                @endphp
                                                @if (!empty($thumb))
                                                    <img src="{{ asset($thumb->link) }}" alt="">
                                                @endif
                                            </div>
                                            <div class="p-cart-name">
                                                <a href="{{ route('c_product.detail', [$order_detail->product->name, $order_detail->product->id]) }}"
                                                    class="p-name">{{ $order_detail->product->name }}</a>
                                                <span class="p-color">{{ $order_detail->color->name }}</span>
                                                <span><b>Số lượng: </b>{{ $order_detail->count }}</span>
                                            </div>
                                        </div>
                                        <div class="p-cart-price">
                                            <span
                                                class="p-price">{{ number_format($order_detail->product->price * $order_detail->count * 0.91, 0, '.', ',') . ' VND' }}</span>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </li>
                        <li class="od-item sp-bt">
                            <span><b>Phí vận chuyển:</b></span>
                            <span>Miễn phí (Giao hàng tận nơi)</span>
                        </li>
                        <li class="od-item sp-bt">
                            <span><b>Tổng tiền:</b></span>
                            <span class="pr-active">{{ number_format($order->payment_amount, 0, '.', ',') . ' đ' }}</span>
                        </li>
                        <li class="od-item">
                            <h5 style="color: #2DA853;font-weight: 700;">Ghi chú:</h5>
                            @if (empty($order->note))
                                <span>Không có ghi chú nào!</span>
                            @else
                                <span>{{ $order->note }}</span>
                            @endif
                        </li>
                    </ul>
                @endif
            </div>
        </div>
        <div id="profile-right">
            <ul>
                <li>
                    <i class="fa-regular fa-user"></i>
                    <a class="@php
if($status == 'show')echo "pr-active"; @endphp"
                        href="{{ route('client.profile', ['status' => 'show']) }}">Thông tin tài khoản</a>
                </li>
                <li><i class="fa-regular fa-address-book"></i>
                    <a href="{{ route('client.profile_edit') }}">Chỉnh sửa thông tin cá nhân</a>
                </li>
                <li>
                    <i class="fa-solid fa-retweet"></i>
                    <a class="@php
if($status == 'change_pass')echo "pr-active"; @endphp"
                        href="{{ route('client.profile', ['status' => 'change_pass']) }}">Đổi mật khẩu</a>
                </li>
                <li><i class="fa-solid fa-arrow-right-from-bracket"></i>
                    <a href="{{ route('client.logout') }}">Đăng xuất</a>
                </li>
            </ul>
        </div>
    </div>
    <link rel="stylesheet" href="{{asset('client/css/profile-respon.css')}}">
@endsection
