<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    {{-- <link rel="stylesheet" href="{{ asset('css/mail-order.css') }}"> --}}
</head>

<body>
    <style>
        #wrapper {
            width: 780px;
            margin: 0px auto;
        }

        #header #logo {
            height: 70px;
            width: 100%;
        }

        #header #logo img {
            height: 70px;
            width: auto;
            ;
        }

        #header #title {
            background-color: #1594E6;
            padding: 15px 20px;
            /* margin-bottom: 20px; */

        }

        #header #title h2 {
            color: #FFFFFF;
            margin: 0px;
            font-weight: 500;
        }

        #header #title h2 a {
            color: #FFFFFF;
        }

        #header #title h2 a:hover {
            color: #000000;
        }

        #content {
            background-color: #F2F2F2;
            padding: 30px;
        }

        .note {
            color: #EA2027;
            font-weight: 600;
        }

        .orderer {
            margin: 20px 0px;
        }

        span {
            color: #363638;
            font-weight: 500;
            font-size: 17px;
        }

        .content-item {
            margin-bottom: 15px;
        }

        #content-2 table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;

        }

        #content-2 table thead tr {
            background-color: #1594E6;
            color: #FFFFFF;
        }

        td {
            padding: 20px 10px;
            margin: 0px;
            border: 1px solid #747373;
            font-size: 17px;
            font-weight: 500;
        }

        #content-2 table tbody tr {
            color: #4c4c4c;
        }

        #content-2 table tbody tr span {
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        #content-2 table tbody tr td {
            max-width: 100px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        #content-2 table tbody tr a {
            text-decoration: none;
            color: #044c7b;

            max-width: 150px;
        }

        tfoot tr {
            background-color: #FFFFFF;
        }

        #content-4 {
            background-color: #FFFFFF;
            padding: 20px;
            border: 1px solid #e6e0e0;
            box-shadow: 0px 2px 4px rgb(168 168 168 / 25%);
            border-radius: 20px;
        }

        #footer {
            background-color: #F2F2F2;
            padding: 15px 30px;
        }

        #content-6 {
            background-color: #FFFFFF;
            padding: 20px;
            border: 1px solid #e6e0e0;
            box-shadow: 0px 2px 4px rgb(168 168 168 / 25%);
            border-radius: 20px;
        }
    </style>
    <div id="wrapper" style=" width: 780px;
    margin: 0px auto;">
        <div id="header">
            {{-- <div id="logo" style="height: 70px;
            width: 100%;">
                <img src="" alt="" style=" height: 70px;
                width: auto;">
            </div> --}}
            <div id="title" style=" background-color: #1594E6;
            padding: 15px 20px;">
                <h2 style="color: #FFFFFF;
                margin: 0px;
                font-weight: 500;">Thông báo
                    SapoShop đã nhận được thông tin đơn đặt hàng của quý khách tại <a style="color: #FFFFFF;"
                        href="https://ductoan.unitopcv.com/">Sapo.vn</a></h2>
            </div>
        </div>
        <div id="content" style="background-color: #F2F2F2;
        padding: 30px;">
            <div class="note" style=" color: #EA2027;
            font-weight: 600;"><i>Đây là email được gửi tự động
                    từ hệ thống, vui lòng không phản hồi (reply) lại email
                    này.</i></div>
            <div class="orderer" style="margin: 20px 0px;">
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>Kính
                        gửi: Anh(Chị) {{ $order->customer->fullname }}</b></span><br><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Cửa
                    hàng điện tử Sapo xin chân thành cảm ơn Quý khách đã tin tưởng, lựa chon sử dụng phần sản
                    phẩm của của hàng chúng tôi.</span><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Sapo
                    đã nhận được thông tin đơn đặt hàng của Quý khách như sau: </span>
            </div>
            <div class="content-item" id="content-1" style="margin-bottom: 15px;">
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>1.
                        Thông tin đơn Đặt hàng</b></span><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>Mã
                        đơn hàng: #{{ $order->id }}</b></span>
            </div>
            <div class="content-item" id="content-2" style="margin-bottom: 15px;">
                <table
                    style="width: 100%;
                border-collapse: collapse;
                border-spacing: 0;">
                    <thead>
                        <tr style=" background-color: #1594E6;
                        color: #FFFFFF;">
                            <td
                                style=" padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                STT</td>
                            <td
                                style=" padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Tên sản phẩm</td>
                            <td
                                style=" padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Màu sắc</td>
                            <td
                                style=" padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Số lượng</td>
                            <td
                                style=" padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Giá</td>
                            <td
                                style=" padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Thành tiền</td>
                        </tr>
                    </thead>
                    @php
                        $count = 1;
                    @endphp
                    <tbody>
                        @foreach ($order->orderDetails as $order_detail)
                            <tr style=" color: #4c4c4c;">
                                <td
                                    style="max-width: 100px;
                                overflow: hidden;
                                white-space: nowrap; 
                                text-overflow: ellipsis;padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500; ">
                                    <span
                                        style=" display: flex;
                                    width: 100%;
                                    justify-content: center;
                                    align-items: center; color: #363638;
    font-weight: 500;
    font-size: 17px;">{{ $count++ }}</span>
                                </td>
                                <td
                                    style="  max-width: 100px;
                                overflow: hidden;
                                white-space: nowrap; 
                                text-overflow: ellipsis; padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                    <a href="{{ route('c_product.detail', ['name' => $order_detail->product->name, 'id' => $order_detail->product->id]) }}"
                                        style="text-decoration: none;
                                    color: #044c7b;
                                    max-width: 150px;">{{ $order_detail->product->name }}</a>
                                </td>
                                <td
                                    style="  max-width: 100px;
                                overflow: hidden;
                                white-space: nowrap; 
                                text-overflow: ellipsis;padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500; ">
                                    {{ $order_detail->color->name }}</td>
                                <td
                                    style="  max-width: 100px;
                                overflow: hidden;
                                white-space: nowrap; 
                                text-overflow: ellipsis; padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                    <span
                                        style=" display: flex;
                                    width: 100%;
                                    justify-content: center;
                                    align-items: center;  color: #363638;
    font-weight: 500;
    font-size: 17px;">{{ $order_detail->count }}</span>
                                </td>
                                <td
                                    style="  max-width: 100px;
                                overflow: hidden;
                                white-space: nowrap; 
                                text-overflow: ellipsis; padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                    {{ number_format($order_detail->product->price * 0.91, 0, '.', ',') . ' đ' }}</td>
                                <td
                                    style="  max-width: 100px;
                                overflow: hidden;
                                white-space: nowrap; 
                                text-overflow: ellipsis; padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                    {{ number_format($order_detail->product->price * 0.91 * $order_detail->count, 0, '.', ',') . ' đ' }}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr style="background-color: #FFFFFF;">
                            <td colspan="5"
                                style="color: #000000; font-weight: 600;font-size: 18px;padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Phí vận chuyển:
                            </td>
                            <td
                                style=" font-weight: 600;font-size: 18px; color: #0c94f0;padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                               Miễn phí</td>
                        </tr>
                        <tr style="background-color: #FFFFFF;">
                            <td colspan="5"
                                style="color: #000000; font-weight: 600;font-size: 18px;padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                Thành tiền:
                            </td>
                            <td
                                style=" font-weight: 600;font-size: 18px; color: #0870b6;padding: 20px 10px;
                            margin: 0px;
                            border: 1px solid #747373;
                            font-size: 17px;
                            font-weight: 500;">
                                {{ number_format($order->payment_amount, 0, '.', ',') . ' đ' }}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="content-item" id="content-3" style="margin-bottom: 15px;">
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>2.
                        Thông tin Sapo xuất hóa đơn cho Quý khách</b></span>
            </div>
            <div class="content-item" id="content-4"
                style=" background-color: #FFFFFF; margin-bottom: 15px;
            padding: 20px;
            border: 1px solid #e6e0e0;
            box-shadow: 0px 2px 4px rgb(168 168 168 / 25%);
            border-radius: 20px;">
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Tên
                    khách hàng: <b>{{ $order->customer->fullname }}</b></span><br><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Địa
                    chỉ: <b>{{ $order->delivery_address }}</b></span><br><br>
                <span
                    style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">E-mail:
                    <b>{{ $order->customer->email }}</b></span><br><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Số
                    điện thoại: <b>{{ $order->customer->phone }}</b></span><br><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Phương
                    thức thanh toán: <b>{{ $order->payment_method }}</b></span>
            </div>
            <div class="content-item" id="content-5" style="margin-bottom: 15px;">
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>3.
                        Liên hệ</b></span>
            </div>
            <div class="content-item" id="content-6"
                style=" background-color: #FFFFFF;
            padding: 20px;
            border: 1px solid #e6e0e0;
            box-shadow: 0px 2px 4px rgb(168 168 168 / 25%);
            border-radius: 20px;  margin-bottom: 15px;">
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;">Mọi
                    thắc mắc quý khách vui lòng liên hệ:</span><br><br>
                <span style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>Trụ
                        sở chính:</b>. Ladeco Building, 266 Doi Can Street, Ba Dinh District, Hanoi</span><br><br>
                <span
                    style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>Email:</b>
                    support@sapo.vn</span><br><br>
                <span
                    style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>Hotline: </b>
                    1900 6750</span><br>
                <span
                    style=" color: #363638;
                font-weight: 500;
                font-size: 17px;"><b>Quý khách có thể theo dõi thông tin về đơn hàng trong trang cá nhân của mình.</b>
                </span><br>
                <span
                    style=" color: #363638;
                    font-weight: 500;
                    font-size: 17px;">Trân
                    trọng kính
                    chào</span><br>
                <span
                    style=" color: #363638;
                    font-weight: 500;
                    font-size: 17px;"><b>Cửa
                        hàng điện
                        tử Sapo.</b></span>
            </div>
        </div>
        {{-- <div id="footer" style=" background-color: #F2F2F2;
        padding: 15px 30px;">
            <span style=" color: #363638;
            font-weight: 500;
            font-size: 17px;">Trân trọng kính
                chào</span><br>
            <span style=" color: #363638;
            font-weight: 500;
            font-size: 17px;"><b>Cửa hàng điện
                    tử Sapo.</b></span>
        </div> --}}
    </div>
</body>

</html>
