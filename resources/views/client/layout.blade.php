<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
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
    <script src="{{ asset('client/js/jquery.js') }}"></script>

    <link rel="stylesheet" href="{{ asset('client/css/chat.css') }}">
    <link rel="icon" href="{{ asset('client/img/Icon-Sapo.webp') }}" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('client/css/layout.css') }}">
    <link rel="stylesheet" href="{{ asset('client/css/layout-respon.css') }}">
    <title>SapoShop</title>
</head>

<body>
    <style>
        #customer {
            height: 100%;
            margin-left: 10px;
        }

        #customer span.customer-name {
            font-size: 16px;
            color: #FFFFFF;
            font-weight: 600;
            cursor: pointer;
            height: 100%;
        }

        #customer:hover span.hello {
            color: #FFDA24;
        }

        #customer:hover span.customer-name {
            color: #FFDA24;
        }

        #customer span.hello {
            width: 100%;
            font-size: 16px;
            color: #FFFFFF;
            font-weight: 600;
            text-align: center;
            display: inline-block;
            cursor: pointer;
        }

        .popover-list li {
            padding: 5px 0px;
            border-bottom: 1px solid #DEE2E6;
        }

        .popover-list li a {
            color: #4c4c4c;
            font-size: 15px;
            font-weight: 600;
            transition: all ease-in-out 0.2s;
        }

        .popover-list li:hover a {
            color: #3498db;
        }

        #list-result {
            position: absolute;
            z-index: 1000;
            top: 100%;
            background-color: #FFFFFF;
            border-radius: 5px;
            padding-top: 5px;
        }

        #list-result ul {
            max-height: 70vh;
            overflow: scroll;
        }

        #list-result li {
            display: flex;
            flex-direction: row;
            height: 80px;
            border-bottom: 1px solid #DEE2E6;
            margin-bottom: 10px;
        }

        #list-result li img {
            flex-basis: 70px;
            max-width: 70px;
            margin-right: 10px;
        }

        #list-result .search_name {
            font-size: 17px;
            font-weight: 600;
            transition: all ease-in-out 0.1s;
        }

        #list-result .search_name:hover {
            color: #d70018;
        }

        #list-result .new-p {
            color: #D60019;
            font-size: 17px;
            font-weight: 600;
        }

        #list-result .old-p {
            font-size: 13px;
            text-decoration: line-through;
            font-weight: 500;
        }

        #search {
            position: relative;
        }

        .chat_icon {
            position: fixed;
            bottom: 100px;
            right: 100px;
            height: 60px;
            width: 60px;
            border-radius: 50%;
            z-index: 100;
            cursor: pointer;
            padding: 10px;
            background: rgb(117, 117, 222);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .chat_icon span {
            font-size: 25px;
            color: #FFFFFF;
        }
    </style>
    <link rel="stylesheet" href="{{ asset('client/css/toast-respon.css') }}">
    <div id="wrapper">
        <div id="header">
            <div id="top-header" class="">
                <div class="" id="logo">
                    <a href="{{ route('client.index') }}"><img src="{{ asset('client/img/logo-sapo-02.png') }}"
                            alt=""></a>
                </div>
                <div class="" id="respon-logo">
                    <a href="{{ route('client.index') }}"><img src="{{ asset('client/img/13458.png') }}"
                            alt=""></a>
                </div>
                <div class="center" id="search">
                    <form action="{{ route('client.search') }}" class="row" method="GET">
                        <input type="text" placeholder="Nhập từ khóa tìm kiếm" id="input_search" name="key_search"
                            class="col-10">
                        <button class="col-2"><i class="fa-solid fa-magnifying-glass"></i></button>
                        <div id="list-result" style="display:none">
                            {{-- <ul>
                                <li>
                                    <img src="{{ asset('client/img/csm_bq_aquaris_v_4_zu_3_ca44688dc9.png') }}"
                                        alt="">
                                    <div class="search_detail">
                                        <a href="#" class="search_name">Samsung Galaxy S22 Ultra (8GB - 128GB)</a>
                                        <div class="price">
                                            <span class="new-p">26.990.000đ</span>
                                            <span class="old-p text-secondary">27.590.000đ</span>
                                        </div>
                                    </div>
                                </li>
                            </ul> --}}
                        </div>
                    </form>
                </div>
                <div class="" id="contact">
                    <a href=""><i class="center fa-solid fa-phone fa-bounce"></i><span>Gọi mua hàng <br>
                            <b>0911577985</b></span> </a>
                </div>
                @if (!Auth::guard('customers')->check())
                    <div class="" id="access">
                        <i class="center fa-solid fa-circle-user"></i>
                        <div>
                            <a href="{{ route('client.login') }}">Đăng nhập</a>
                            <a href="{{ route('client.register') }}">Đăng ký</a>
                        </div>
                    </div>
                @endif
                <div id="feedback" class="center">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><span>Góp ý</span></a>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="{{ route('client.feedback') }}" method="POST">
                                    @csrf
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5 text-danger" id="exampleModalLabel">Gửi góp ý</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label style="font-size: 16px" class="text-secondary" for="s-feedback">Chọn
                                                mục
                                                góp ý<b class="text-danger">*</b></label>
                                            <select class="form-control" name="section" id="s-feedback">
                                                <option value="Báo lỗi-Chỉnh sửa giao diện web">Báo lỗi-Chỉnh sửa giao
                                                    diện web</option>
                                                <option value="Góp ý phản ánh dịch vụ">Góp ý phản ánh dịch vụ</option>
                                                <option value="Tư vấn thiết kế website">Tư vấn thiết kế website</option>
                                                <option value="Hỗ trợ vấn đề khác">Hỗ trợ vấn đề khác</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label style="font-size: 16px" class="text-secondary" for="title">Tiêu
                                                đề<b class="text-danger">*</b></label>
                                            <input type="text" name="title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label style="font-size: 16px" class="text-secondary"
                                                for="content-feedback">Nội dung<b class="text-danger">*</b></label>
                                            <textarea class="form-control" name="content" id="content-feedback" cols="" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Hủy</button>
                                        <button name="btn_send" class="btn btn-primary">Gửi yêu cầu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                @if (!Auth::guard('customers')->check())
                    <div class="" id="cart">
                        <div class="center">
                            <i class="fa-solid fa-basket-shopping"></i>
                            {{-- <span class="count center"></span> --}}
                        </div>
                        <a href="{{ route('client.cart_show') }}">Giỏ hàng</a>
                    </div>
                @else
                    <div class="" id="cart">
                        <div class="center">
                            <i class="fa-solid fa-basket-shopping"></i>
                            <span class="count center">{{ $count_product }}</span>
                        </div>
                        <a href="{{ route('client.cart_show') }}">Giỏ hàng</a>
                    </div>
                    <div id="customer" data-bs-toggle="popover" data-bs-html="true" title="Tài khoản của tôi"
                        data-bs-content="<ul class = 'popover-list'>
                        <li class = 'popover-item'><a href = '{{ route('client.profile', ['status' => 'show']) }}'>Hồ sơ cá nhân</a></li>
                        <li class = 'popover-item'><a href = '{{ route('client.profile_edit') }}'>Cập nhật thông tin</a></li>
                        <li class = 'popover-item'><a href = '{{ route('client.profile', ['status' => 'order_history']) }}'>Lịch sử mua hàng</a></li>
                        <li class = 'popover-item'><a href = '{{ route('client.profile', ['status' => 'change_pass']) }}'>Đổi mật khẩu</a></li>
                        <li class = 'popover-item'><a href = '{{ route('client.logout') }}'>Đăng xuất</a></li>
                        </ul>">
                        <span class="hello">Xin chào</span><br>
                        <span class="customer-name">{{ Auth::guard('customers')->user()->fullname }}</span>
                    </div>
                @endif

            </div>
            <div id="nav-responsive">
                <div id="list-nr">
                    <ul class="list-top">
                        <li class="nr-item center">
                            <span class="nri-item" id="nri-cat" href=""><i
                                    class="fa-solid fa-list center"></i><span>Danh mục</span></span>
                        </li>
                        <li class="nr-item center">
                            <a class="nri-item" href=""><i
                                    class="fa-solid fa-phone-volume center"></i><span>Liên
                                    hệ</span></a>
                        </li>
                        <li class="nr-item center">
                            <span class="nri-item" data-bs-toggle="modal" data-bs-target="#modalfeedback"><i
                                    class="fa-solid fa-pen center"></i><span>Góp
                                    ý</span></span>
                            <!-- Button trigger modal -->
                            <!-- Modal -->


                        </li>

                        <li class="nr-item center">
                            <a class="nri-item" href="{{ route('client.profile', ['status' => 'show']) }}"><i
                                    class="fa-regular fa-user center"></i><span>Tài
                                    khoản</span></a>


                        <li class="nr-item center">
                            <a class="nri-item" href="{{ route('client.cart_show') }}"><i
                                    class="fa-solid fa-cart-shopping center"></i><span>Giỏ
                                    hàng</span></a>
                        </li>

                    </ul>
                    <div class="nr-child">
                        <ul class="list-bot">
                            <li class="nr-child-item">
                                <a href="{{ route('client.search_type', ['Điện thoại']) }}"
                                    class="nrct-img center"><img src="{{ asset('client/img/icon_menu_1.webp') }}"
                                        alt=""></a>
                                <a href="">Điện thoại</a>
                            </li>
                            <li class="nr-child-item">
                                <a href="{{ route('client.search_type', ['Đồng hồ']) }}" class="nrct-img center"><img
                                        src="{{ asset('client/img/icon_menu_2.webp') }}" alt=""></a>
                                <a href="">Smart Watch</a>
                            </li>
                            <li class="nr-child-item">
                                <a href="{{ route('client.search_type', ['Laptop']) }}" class="nrct-img center"><img
                                        src="{{ asset('client/img/icon_menu_3.webp') }}" alt=""></a>
                                <a href="">Laptop</a>
                            </li>
                            <li class="nr-child-item">
                                <a href="" class="nrct-img center"><img
                                        src="{{ asset('client/img/icon_menu_4.webp') }}" alt=""></a>
                                <a href="">Loa</a>
                            </li>
                            <li class="nr-child-item">
                                <a href="{{ route('client.search_type', ['Phụ kiện']) }}"
                                    class="nrct-img center"><img src="{{ asset('client/img/icon_menu_5.webp') }}"
                                        alt=""></a>
                                <a href="">Phụ kiện</a>
                            </li>
                            <li class="nr-child-item">
                                <a href="{{ route('client.search_type', ['Máy tính bảng']) }}"
                                    class="nrct-img center"><img src="{{ asset('client/img/icon_menu_6.webp') }}"
                                        alt=""></a>
                                <a href="">Máy tính bảng</a>
                            </li>
                            <li class="nr-child-item">
                                <a href="{{ route('client.search_type', ['Máy in']) }}" class="nrct-img center"><img
                                        src="{{ asset('client/img/icon_menu_8.webp') }}" alt=""></a>
                                <a href="">Máy in</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="nav">
                <ul class="nav-p">
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Điện thoại']) }}">Điện thoại <i
                                class="fa-solid fa-caret-down"></i></a>
                        <ul class="nav-c row">
                            <li class="col-md-4 nav-item-c text-light"><b>Chọn theo hãng</b>
                                <ul class="nav-cc">
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Apple']) }}">Apple</a>
                                    </li>
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Samsung']) }}">Samsung</a>
                                    </li>
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Oppo']) }}">Oppo</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="col-md-4 nav-item-c text-light"><b>Chọn theo giá sản phẩm</b>
                                <ul class="nav-cc">
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'price', 'Nhỏ hơn 10 triệu']) }}">Nhỏ
                                            hơn 10 triệu</a></li>
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'price', 'Từ 10 đến 20 triệu']) }}">Từ
                                            10 triệu đến 20 triệu</a></li>
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'price', 'Từ 20 đến 30 triệu']) }}">Từ
                                            20 triệu đến 30 triệu</a></li>
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'price', 'Lớn hơn 30 triệu']) }}">Lớn
                                            hơn 30 triệu</a></li>
                                </ul>
                            </li>
                            <li class="col-md-4 nav-item-c text-light"><b>Loại điện thoại</b>
                                <ul class="nav-cc">
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Android']) }}">Android</a>
                                    </li>
                                    <li><a
                                            href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Apple']) }}">IOS</a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Laptop']) }}">Laptop <i
                                class="fa-solid fa-caret-down"></i></a>
                        <ul class="row nav-c n-nav-cc">
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_key', ['Laptop', 'name', 'Macbook']) }}">Markbook</a>
                            </li>
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_cat', ['Laptop', 'Sinh viên']) }}">Sinh viên</a>
                            </li>
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_cat', ['Laptop', 'Gaming']) }}">Gaming</a></li>
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_cat', ['Laptop', 'Văn phòng']) }}">Văn phòng</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Loa']) }}">Loa</a></li>
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Đồng hồ']) }}">Đồng hồ</a></li>
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Phụ kiện']) }}">Phụ kiện <i
                                class="fa-solid fa-caret-down"></i></a>
                        <ul class="row nav-c n-nav-cc">
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_cat', ['Phụ kiện', 'Phụ kiện di động']) }}">Phụ kiện
                                    di
                                    động</a>
                            </li>
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_cat', ['Phụ kiện', 'Phụ kiện laptop']) }}">Phụ kiện
                                    laptop</a>
                            </li>
                            <li class="col-md-12 py-2"><a
                                    href="{{ route('client.search_cat', ['Phụ kiện', 'Phụ kiện văn phòng']) }}">Phụ
                                    kiện gaming</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Máy PC']) }}">Máy Pc</a></li>
                    <li class="nav-item-p"><a href="{{ route('client.search_type', ['Camera']) }}">Camera, webcam</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="" id="wr-content">
            @if (Auth::guard('customers')->check())
                <div class="chat_icon">
                    @include('client.chat')
                    <span class="chat-click"><i class="fa-solid fa-headset"></i></span>
                </div>
            @endif
            @yield('content')
        </div>
        <div id="footer">
            <div class="row" id="top-footer">
                <div class="col-md-9 col-lg-6 col-sm-12 col-12 row" id="shop-contact">
                    <div class="col-md-12 shop-logo">
                        <a href="#"><img src="{{ asset('client/img/logo-sapo-02.png') }}" alt=""></a>
                    </div>
                    <div class="col-md-12 contact-detail">
                        <b>Trụ sở chính:</b> <span class="text-secondary"> Ladeco Building, 266 Doi Can Street, Ba Dinh
                            District, Hanoi </span><br>
                        <b>Email:</b> <a class="text-secondary" href="">support@sapo.vn</a><br>
                        <b>Hotline:</b> <a class="text-secondary" href="">1900 6750</a> <br>
                        <span class="text-secondary">Giấy chứng nhận Đăng ký Kinh doanh số 0309532xxx do Sở Kế hoạch và
                            Đầu tư Thành phố Hà Nội cấp ngày
                            01/04/2002</span>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6 col-6" id="policy">
                    <h4>Chính sách</h4>
                    <ul>
                        <li><a href="">Chính sách mua hàng</a></li>
                        <li><a href="">Chính sách đổi trả</a></li>
                        <li><a href="">Chính sách bảo hành</a></li>
                        <li><a href="">Gửi góp ý, khiếu nại</a></li>
                    </ul>
                </div>
                <div class="col-md-12 col-lg-3 col-sm-6 col-6" id="connect-with">
                    <h4>Kết nối với chúng tôi</h4>
                    <div class="d-flex" id="con-icon">
                        <div class="icon-item center"><a
                                href="https://www.facebook.com/profile.php?id=100072532142749"><img
                                    src="{{ asset('client/img/50-Best-Facebook-Logo-Icons-GIF-Transparent-PNG-Images-28.png') }}"
                                    alt=""></a>
                        </div>
                        <div class="icon-item center"><a href=""><img
                                    src="{{ asset('client/img/Instagram-Logo-1024x982.png') }}" alt=""></a>
                        </div>
                        <div class="icon-item center"><a href=""><img
                                    src="{{ asset('client/img/cricle-twitter-emblem-png-clipart-8.png') }}"
                                    alt=""></a></div>
                        <div class="icon-item center"><a href="https://www.youtube.com/@Sapo-VietNam"><img
                                    src="{{ asset('client/img/official-youtube-icon-28.png') }}" alt=""></a>
                        </div>
                        <div class="icon-item center"><a href=""><img
                                    src="{{ asset('client/img/shopee-circle-logo-design-shopping-bag-13.png') }}"
                                    alt=""></a></div>
                        {{-- <div class="icon-item center"><a href=""><img
                                    src="{{ asset('client/img/Instagram-Logo-1024x982.png') }}" alt=""></a>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="row" id="bot-footer">
                <div class="col-md-2 col-sm-4 col-4">
                    <ul>
                        <li><a href="{{ route('client.search_type', ['Điện thoại']) }}">Điện thoại</a></li>
                        <li><a href="{{ route('client.search_type', ['Tai nghe']) }}">Tai nghe</a></li>
                        <li><a href="{{ route('client.search_type', ['Chuột']) }}">Chuột</a></li>
                        <li><a href="{{ route('client.search_type', ['Loa']) }}">Loa</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col-sm-4 col-4">
                    <ul>
                        <li><a href="{{ route('client.search_type', ['Đồng hồ']) }}">Smart watch</a></li>
                        <li><a href="{{ route('client.search_type', ['bàn Phím']) }}">Bàn phím</a></li>
                        <li><a href="{{ route('client.search_type', ['Pin']) }}">Pin dự phòng</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col-sm-4 col-4">
                    <ul>
                        <li><a href="{{ route('client.search_type', ['Laptop']) }}">Laptop</a></li>
                        <li><a href="{{ route('client.search_type', ['Tai nghe']) }}">Tai nghe</a></li>
                        <li><a href="{{ route('client.search_type', ['Sạc']) }}">Cáp, củ sạc</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col-sm-4 col-4">
                    <ul>
                        <li><a href="{{ route('client.search_type', ['Máy tính bảng']) }}">Máy tính bảng</a></li>
                        <li><a href="{{ route('client.search_type', ['Ốp']) }}">Ốp lưng, bao da</a></li>
                        <li><a href="{{ route('client.search_type', ['Màn hình']) }}">Màn hình</a></li>
                        <li><a href="{{ route('client.search_type', ['Camera']) }}">Camera, webcam</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col-sm-4 col-4">
                    <ul>
                        <li><a href="{{ route('client.search_cat', ['Phụ kiện', 'Phụ kiện gamming']) }}">Phụ kiện
                                gamming</a></li>
                        <li><a href="{{ route('client.search_type', ['Tivi']) }}">Tivi</a></li>
                        <li><a href="{{ route('client.search_type', ['Camera']) }}">Camera, webcam</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col-sm-4  col-4">
                    <ul>
                        <li><a href="{{ route('client.search_type', ['Màn hình']) }}">Màn hình</a></li>
                        <li><a href="{{ route('client.search_type', ['Máy quét']) }}">Máy quét mã vạch</a></li>
                        <li><a href="{{ route('client.search_type', ['Thiết bị mạng']) }}">Thiết bị mạng</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="modalfeedback" tabindex="-1" role="dialog" aria-labelledby="modalTitleId"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="{{ route('client.feedback') }}" method="POST">
                    @csrf
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-danger" id="exampleModalLabel">Gửi góp ý</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label style="font-size: 16px" class="text-secondary" for="s-feedback">Chọn mục
                                góp ý<b class="text-danger">*</b></label>
                            <select class="form-control" name="section" id="s-feedback">
                                <option value="Báo lỗi-Chỉnh sửa giao diện web">Báo lỗi-Chỉnh sửa giao diện web
                                </option>
                                <option value="Góp ý phản ánh dịch vụ">Góp ý phản ánh dịch vụ</option>
                                <option value="Tư vấn thiết kế website">Tư vấn thiết kế website</option>
                                <option value="Hỗ trợ vấn đề khác">Hỗ trợ vấn đề khác</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label style="font-size: 16px" class="text-secondary" for="title">Tiêu
                                đề<b class="text-danger">*</b></label>
                            <input type="text" name="title" class="form-control">
                        </div>
                        <div class="form-group">
                            <label style="font-size: 16px" class="text-secondary" for="content-feedback">Nội dung<b
                                    class="text-danger">*</b></label>
                            <textarea class="form-control" name="content" id="content-feedback" cols="" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button name="btn_send" class="btn btn-primary">Gửi yêu cầu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        var modalId = document.getElementById('modalfeedback');

        modalId.addEventListener('show.bs.modal', function(event) {
            // Button that triggered the modal
            let button = event.relatedTarget;
            // Extract info from data-bs-* attributes
            let recipient = button.getAttribute('data-bs-whatever');

            // Use above variables to manipulate the DOM
        });
    </script>
</body>
<link rel="stylesheet" href="{{ asset('client/css/index-respon.css') }}">

<script>
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    })
    var popover = new bootstrap.Popover(document.querySelector('.example-popover'), {
        container: 'body'
    })
</script>

<script src="{{ asset('chat.js') }}"></script>
<script>
    $("#search input").keyup(function() {
        var query = $(this).val();
        if (query != "") {
            // console.log(query);
            $.ajax({
                type: 'GET',
                url: "{{ route('client.search_ajax') }}",
                data: {
                    query: query,
                },
                success: function(data) {
                    $('#list-result').fadeIn();
                    $('#list-result').html(data);
                },
                // error: function(xhr) {
                //     console.log(xhr.responseText);
                // }
            });
        } else {
            // console.log(query);
            $('#list-result').fadeOut();
        }
    })
    $(document).ready(function() {
        $("#nri-cat").click(function() {
            $(".nr-child").stop().toggle(500);
        });
    })
</script>


</html>
