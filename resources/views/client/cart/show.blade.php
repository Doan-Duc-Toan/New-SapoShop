@extends('client.layout')
@section('content')
    <style>
        .no_product {
            color: #EA2027;
            font-size: 18px;
            font-weight: 700;

        }
    </style>
    <link rel="stylesheet" href="{{ asset('client/css/cart.css') }}">
    <script src="{{ asset('client/js/jquery.js') }}"></script>
    <nav id="breadcrumb-nav" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('client.index') }}"><i class="fa-solid fa-house"></i> Trang chủ</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
            <!-- <li class="breadcrumb-item active" aria-current="page">Data</li> -->
        </ol>
    </nav>
    <div id="content">
        <h4>GIỎ HÀNG</h4>
        @if (Auth::guard('customers')->user()->draft_order)
            <form action="{{ route('client.pay') }}" method="POST">
                @csrf
                <div id="list-product-cart">
                    @foreach ($order_details as $order_detail)
                        <div class="product-cart">
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
                                    <div class="count">
                                        <span class="sub num center no-select">-</span>
                                        <input type="text" readonly id="{{ $order_detail->product->id }}" min="1"
                                            name="counts[{{ $order_detail->id }}]" value="{{ $order_detail->count }}">
                                        <span class="add num center no-select">+</span>
                                    </div>
                                </div>
                            </div>
                            <div class="p-cart-price">
                                <span
                                    class="p-price">{{ number_format($order_detail->product->price * 0.91 * $order_detail->count, 0, '.', ',') . ' đ' }}</span>
                                <span class="price-hide"
                                    style="display:none;">{{ $order_detail->product->price * 0.91 }}</span>
                                <a href="{{ route('client.delete_item', [$order_detail->id]) }}"
                                    class="delete center">Xóa</a>
                            </div>
                        </div>
                    @endforeach

                </div>
                <div id="pay">
                    <div class="pay-top">
                        <span class="total">Tổng tiền:</span>
                        <span
                            class="total-price text-secondary">{{ number_format($draft_order->payment_amount, 0, '.', ',') . ' ₫' }}</span>
                        <span class="total-hide" style="display:none;">{{ $draft_order->payment_amount }}</span>
                    </div>
                    <div class="pay-mid center">
                        {{-- <a href="" class="center">Thanh toán</a> --}}
                        <button name="btn_pay" value="pay">Thanh toán</button>
                    </div>
                    <div class="pay-bot">
                        <a href="{{ route('client.delete_all') }}" class="center">Xóa tất cả</a>
                    </div>
                </div>
            </form>
        @else
            <span class="no_product">Không có sản phẩm nào trong giỏ hàng (<a href="{{ route('client.index') }}"
                    style="">Quay lại Sapo để mua sắm</a> )</span>
        @endif


    </div>
    <link rel="stylesheet" href="{{asset('client/css/cart-respon.css')}}">
    <script>
        $(document).ready(function() {
            $('.add').click(function() {
                var element = $(this);
                var val = $(this).parent(".count").children("input").val();
                var price = $(this).parent(".count").parent('.p-cart-name').parent('.p-cart-detail').parent(
                    '.product-cart').children('.p-cart-price').children('.price-hide').text();
                parseInt(val)
                var total_amount = $('.total-hide').text();
                parseInt(total_amount);
                parseInt(price)
                var sign = 1
                val++;
                $(this).parent('.count').children("input").val(val)
                $.ajax({
                    url: '{{ route('client.cart_cal') }}',
                    method: 'GET',
                    data: {
                        val: val,
                        price: price,
                        total_amount: total_amount,
                        sign: sign
                    },
                    success: function(response) {
                        var new_price = response.new_price;
                        var total_amount_new = response.total_amount;
                        var formattedPrice = parseFloat(new_price).toLocaleString('vi-VN', {
                            style: 'currency',
                            currency: 'VND'
                        });
                        element.parent(".count").parent('.p-cart-name').parent('.p-cart-detail')
                            .parent(
                                '.product-cart').children('.p-cart-price').children('.p-price')
                            .text(formattedPrice)
                        var formatted_amount = parseFloat(total_amount_new).toLocaleString(
                            'vi-VN', {
                                style: 'currency',
                                currency: 'VND'
                            });
                        var total_amount_new_text = total_amount_new.toString();
                        $('.total-hide').text(total_amount_new_text)
                        $('.total-price').text(formatted_amount)
                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                        // Xử lý lỗi nếu có
                    }
                });
            })
            $('.sub').click(function() {
                var element = $(this);
                var val = $(this).parent(".count").children("input").val();
                var price = $(this).parent(".count").parent('.p-cart-name').parent('.p-cart-detail').parent(
                    '.product-cart').children('.p-cart-price').children('.price-hide').text();
                var total =
                    parseInt(val)
                var total_amount = $('.total-hide').text();
                var sign = -1;
                parseInt(total_amount);
                parseInt(price)
                val--;
                if (val >= 1) {
                    $(this).parent('.count').children("input").val(val)
                    $.ajax({
                        url: '{{ route('client.cart_cal') }}',
                        method: 'GET',
                        data: {
                            val: val,
                            price: price,
                            total_amount: total_amount,
                            sign: sign
                        },
                        success: function(response) {
                            var new_price = response.new_price;
                            var total_amount_new = response.total_amount;
                            var formattedPrice = parseFloat(new_price).toLocaleString('vi-VN', {
                                style: 'currency',
                                currency: 'VND'
                            });
                            element.parent(".count").parent('.p-cart-name').parent(
                                    '.p-cart-detail')
                                .parent(
                                    '.product-cart').children('.p-cart-price').children(
                                    '.p-price')
                                .text(formattedPrice)
                            var formatted_amount = parseFloat(total_amount_new).toLocaleString(
                                'vi-VN', {
                                    style: 'currency',
                                    currency: 'VND'
                                });
                            var total_amount_new_text = total_amount_new.toString();
                            $('.total-hide').text(total_amount_new_text)
                            $('.total-price').text(formatted_amount)
                        },
                        error: function(xhr, status, error) {
                            console.error(error);
                            // Xử lý lỗi nếu có
                        }
                    });
                }
            })
        })
    </script>
@endsection
