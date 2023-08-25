<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="{{ asset('client/css/fontawesome/css/all.css') }}">
    <!-- <link rel="stylesheet" href="css/checkout.css"> -->
    <link rel="stylesheet" href="{{ asset('client/css/complete.css') }}">
    <script src="asset('client/js/jquery.js')"></script>
    <link rel="icon" href="{{ asset('client/img/Icon-Sapo.webp') }}" type="image/x-icon">
    <link rel="stylesheet" href="{{asset('client/css/completed-respon.css')}}">


</head>

<body>
    <div id="content">
        <div id="left">
            <div id="l-content">
                <div id="confirm">
                    <i class="fa-regular fa-circle-check center"></i>
                    <div class="right-confirm">
                        <span class="rc-title">Cảm ơn bạn đã đặt hàng</span><br>
                        <span class="check-email">Một email xác nhận đã được gửi tới {{$customer->email}}. <br>
                            Xin vui lòng kiểm tra email của bạn</span>
                    </div>
                </div>
                <div id="order-info">
                    <div id="oi-left">
                        <span class="oi-title">
                            Thông tin mua hàng
                        </span><br>
                        <span class="name oi-info">{{ $customer->fullname }}</span><br>
                        <span class="email oi-info">{{ $customer->email }}</span><br>
                        <span class="phone oi-info">{{ $customer->phone }}</span><br><br>
                        <span class="oi-title">
                            Phương thức thanh toán
                        </span><br>
                        <span class="pay-method oi-info">{{ $order->payment_method }}</span>
                    </div>
                    <div id="oi-right">
                        <span class="oi-title">
                            Địa chỉ nhận hàng
                        </span><br>
                        <span class="name oi-info">{{ $customer->fullname }}</span><br>
                        <span class="address oi-info">{{ $order->delivery_address }}</span><br>
                        <span class="phone oi-info">{{ $customer->phone }}</span><br><br>
                        <span class="oi-title">
                            Phương thức vận chuyển
                        </span><br>
                        <span class="tran-method oi-info">{{ $order->delivery_method }}</span>
                    </div>
                </div>
                <a href="{{ route('client.index') }}" class="back">Tiếp tục mua hàng</a>
            </div>
        </div>
        <div id="right">
            <div id="r-content">
                <h3>Thông tin đơn hàng</h3>
                <ul id="list-product">
                    <li class="product-item">
                        <div class="p-img">
                            @php
                                $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color_id)->first();
                            @endphp
                            @if (!empty($thumb))
                                <img class="p-img" src="{{ asset($thumb->link) }}" alt="">
                            @endif
                            <span class="count center">{{ $order_detail->count }}</span>
                        </div>
                        <span class="p-name">{{ $order_detail->product->name }}</span>
                        <span
                            class="price">{{ number_format($order_detail->product->price * 0.91 * $order_detail->count, 0, '.', ',') . ' đ' }}</span>
                    </li>
                </ul>

                <div id="total">
                    <span class="t-title center">Tổng tiền</span>
                    <span class="total-amount">{{ number_format($order->payment_amount, 0, '.', ',') . ' đ' }}</span>
                </div>
            </div>
        </div>
    </div>
</body>
<script></script>

</html>
