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
    <link rel="stylesheet" href="{{ asset('client/css/checkout.css') }}">
    <script src="{{ asset('client/js/jquery.js') }}"></script>
    <link rel="icon" href="{{ asset('client/img/toan.png') }}" type="image/x-icon">
    <link rel="stylesheet" href="{{asset('client/css/checkout-respon.css')}}">

</head>

<body>
    <div id="content">
        <div id="left">
            <div id="l-content">
                <nav id="breadcrumb-nav" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('client.cart_show') }}">Giỏ hàng</a></li>
                        <li class="breadcrumb-item active text-secondary" aria-current="page">Thông tin</li>
                        <!-- <li class="breadcrumb-item active" aria-current="page">Data</li> -->
                    </ol>
                </nav>
                <h3>Thông tin nhận hàng</h3>
                <form action="{{ route('client.order') }}" method="POST">
                    @csrf
                    <div class="input-contact">
                        <input type="text" name="email" readonly value="{{ $customer->email }}">
                        <label class="lb-ic placeholder" for="">Email</label>
                    </div>
                    <div class="input-contact">
                        <input type="text" name="fullname" readonly value="{{ $customer->fullname }}">
                        <label class="lb-ic placeholder" for="">Họ và tên</label>
                    </div>
                    <div class="input-contact">
                        <input type="text" readonly name="phone" value="{{ $customer->phone }}">
                        <label class="lb-ic placeholder" for="">Số điện thoại</label>
                    </div>
                    {{-- <div class="input-contact">
                        <input type="text" name="delivery_address">
                        <label class="lb-ic" for="">Địa chỉ (Tùy chỉnh)</label>
                    </div> --}}
                    <div id="select-address">
                        <div id="city_select">
                            <select class="city" name="city" id="">
                                <option value="">Chọn tỉnh thành</option>
                                <option value="Hà Nội">Hà Nội</option>
                                <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                            </select>
                            @error('city')
                                <small
                                    style="color:rgb(232, 30, 30); font-weight:700;font-size:14px;">{{ $message }}</small>
                            @enderror
                        </div>
                        <div id="district_select">
                            <select class="district" name="district" id="">
                                <option value="">Chọn quận, huyện</option>
                                {{-- <option value="">Thủ Đức</option>
                                <option value="">Thanh Xuân</option> --}}
                            </select>
                            @error('district')
                                <small
                                    style="color:rgb(232, 30, 30); font-weight:700;font-size:14px;">{{ $message }}</small>
                            @enderror
                        </div>
                        <div id="ward_select">
                            <select class="ward" name="ward" id="">
                                <option value="">Chọn phường, xã</option>
                                <option value="Tân Mai">Thủ Đức</option>
                                <option value="Ngọc Hà">Ngọc Hà</option>
                                <option value="Ngọc Khánh">Ngọc Khánh</option>
                            </select>
                            @error('ward')
                                <small
                                    style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="input-contact">
                        <textarea name="note" id="" cols="" rows=""></textarea>
                        <label class="lb-ic" for="">Ghi chú (Tùy chọn)</label>
                    </div>
                    <div id="ship">
                        <span class="lb-bot">Phương thức vận chuyển</span>
                        <div class="bot-item">
                            <input type="radio" id="ship-method" checked name="delivery_method"
                                value="Giao hàng tận nơi">
                            <label for="ship-method">Giao hàng tận nơi</label>
                        </div>
                    </div>
                    <div id="pay-method">
                        <span class="lb-bot">Phương thức thanh toán</span>
                        <div class="bot-item">
                            <input checked type="radio" id="cod" name="payment_method" value="Khi nhận hàng">
                            <label for="cod">Thanh toán khi nhận hàng (COD)</label>
                        </div>
                        <div class="bot-item">
                            <input type="radio" id="bank" name="payment_method"
                                value="Chuyển khoản qua ngân hàng">
                            <label for="bank">Chuyển khoản qua ngân hàng</label>
                        </div>
                        <div class="bot-item">
                            <input type="radio" id="option" name="payment_method"
                                value="Phương thức thanh toán tùy chọn">
                            <label for="option">Phương thức thanh toán tùy chọn</label>
                        </div>
                    </div>
                    <div id="order">
                        <a href="{{ route('client.cart_show') }}" class="center">
                            < Quay lại giỏ hàng</a>
                                <button name="btn_order" value="Đặt hàng">Đặt hàng</button>
                    </div>
                </form>
            </div>
        </div>
        <div id="right">
            <div id="r-content">
                <h3>Thông tin đơn hàng</h3>
                <ul id="list-product">
                    @foreach ($order_details as $order_detail)
                        <li class="product-item">
                            <div class="p-img">
                                @php
                                    $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color->id)->first();
                                    
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
                    @endforeach
                </ul>
                <div id="amount">
                    <div class="a-item">
                        <span class="a-title">Tạm tính</span>
                        <span
                            class="money">{{ number_format($draft_order->payment_amount, 0, '.', ',') . ' ₫' }}</span>
                    </div>
                    <div class="a-item">
                        <span class="a-title">Phí vận chuyển</span>
                        <span class="money">Miễn phí</span>
                    </div>
                </div>
                <div id="total">
                    <span class="t-title">Tổng tiền</span>
                    <span
                        class="total-amount">{{ number_format($draft_order->payment_amount, 0, '.', ',') . ' ₫' }}</span>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function() {
        $('label.lb-ic').click(function() {
            $(this).addClass('placeholder');
        })
        $('input').focus(function() {
            $(this).parent('.input-contact').children('label.lb-ic').addClass('placeholder');
        });
        $('input').blur(function() {
            if ($(this).val() === '') {
                $(this).parent('.input-contact').children('label.lb-ic').removeClass('placeholder');
            }
        });
        $('textarea').focus(function() {
            $(this).parent('.input-contact').children('label.lb-ic').addClass('placeholder');
        });
        $('textarea').blur(function() {
            if ($(this).val() === '') {
                $(this).parent('.input-contact').children('label.lb-ic').removeClass('placeholder');
            }
        });
        $(".city").on("change", function() {
            var selectedCity = $(this).val();
            var districtOptions = $(".district");

            // Xóa các tùy chọn hiện tại trong select quận huyện
            districtOptions.empty();

            // Thêm các tùy chọn mới dựa trên giá trị được chọn trong select tỉnh thành

            if (selectedCity === "Hà Nội") {
                districtOptions.append('<option value="">Chọn quận, huyện</option>');
                districtOptions.append('<option value="Ba Đình">Ba Đình</option>');
                districtOptions.append('<option value="Hoàng Mai">Hoàng Mai</option>');
                districtOptions.append('<option value="Bắc Từ Liêm">Bắc Từ Liêm</option>');
                districtOptions.append('<option value="Cầu Giấy">Cầu Giấy</option>');
                districtOptions.append('<option value="Đống Đa">Đống Đa</option>');
                districtOptions.append('<option value="Hà Đông">Hà Đông</option>');
                districtOptions.append('<option value="Hai Bà Trưng">Hai Bà Trưng</option>');
                districtOptions.append('<option value="Hoàn Kiếm">Hoàn Kiếm</option>');
                districtOptions.append('<option value="Long Biên">Long Biên</option>');
                districtOptions.append('<option value="Tây Hồ">Tây Hồ</option>');
                districtOptions.append('<option value="Thanh Xuân">Thanh Xuân</option>');
                // Thêm các tùy chọn quận/huyện khác của Hà Nội
            } else if (selectedCity === "Hồ Chí Minh") {
                districtOptions.append('<option value="">Chọn quận, huyện</option>');
                districtOptions.append('<option value="Bình Tân">Bình Tân</option>');
                districtOptions.append('<option value="Bình Thạnh">Bình Thạnh</option>');
                districtOptions.append('<option value="Gò Vấp">Gò Vấp</option>');
                districtOptions.append('<option value="Phú Nhuận">Phú Nhuận</option>');
                districtOptions.append('<option value="Tân Bình">Tân Bình</option>');
                districtOptions.append('<option value="Tân Phú">Tân Phú</option>');
                districtOptions.append('<option value="Bình Thạnh">Bình Thạnh</option>');
                districtOptions.append('<option value="Thủ Đức">Thủ Đức</option>');
                districtOptions.append('<option value="Bình Chánh">Bình Chánh</option>');
                districtOptions.append('<option value="Cần Giờ">Cần Giờ</option>');
                districtOptions.append('<option value="Hóc Môn">Hóc Môn</option>');
                districtOptions.append('<option value="Nhà Bè">Nhà Bè</option>');
                districtOptions.append('<option value="Củ Chi">Củ Chi</option>');


                // Thêm các tùy chọn quận/huyện khác của Hồ Chí Minh
            } else if (!selectedCity) {
                districtOptions.append('<option value="">Quận, huyện</option>');
            }
        });
    })
</script>

</html>
