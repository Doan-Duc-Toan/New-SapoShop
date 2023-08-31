<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/index.css') }}">
    <link rel="stylesheet" href="{{ asset('css/list.css') }}">
    <link rel="stylesheet" href="{{ asset('css/customer-detail.css') }}">
    <link rel="stylesheet" href="{{ asset('css/product_detail.css') }}">
    <link rel="icon" href="{{ asset('client/img/Icon-Sapo.webp') }}" type="image/x-icon">
    <script src="{{ asset('js/jquery.js') }}"></script>
    <title>SapoShop</title>
</head>

<body>
    <style>
        #list-feedback .feedback_item {
            border-bottom: 1px solid #DEE2E6;
            margin-bottom: 10px;
        }

        .model-content {
            max-height: 75vh;
            overflow: scroll;
        }

        .list-active {
            color: #0388FD !important;
            font-weight: 700;
        }
        #search_result{
            max-height: 75vh;
        }
        ul.dropdown-menu{
            max-height: 75vh !important;
            overflow: scroll;
        }
    </style>
    
    <div id="wrapper" class="container">
        <div class="row">
            <div class="col-md-2" id="sidebar">
                <div class="">
                    <ul class="row" id="navbar">
                        <li class="col-md-12 nav-item" id="logo"><a href=""><img
                                    src="{{ asset('img/Sapo-logo (1).svg') }}" alt=""></a>
                        </li>
                        <li class="col-md-12 nav-item">
                            <a class="item-link" href="{{ route('dashboard') }}"><i
                                    class="fa-solid fa-house"></i><span>Tổng
                                    quan</span></a>
                        </li>
                        <li class="col-md-12 nav-item" id="order">
                            <a href="{{ route('order.show') }}" class="item-link"><i
                                    class="fa-solid fa-check-to-slot"></i><span>Đơn
                                    hàng</span></a>
                            <!--<i class="fa-solid fa-greater-than"></i>-->
                            <!--<ul class="container sub-menu">-->
                            <!--    <div class="row">-->
                            <!--        <li class="col-md-12"><a href="{{ route('order.show') }}">Danh sách đơn hàng</a>-->
                            <!--        </li>-->
                            <!--        <li class="col-md-12"><a href="">Đơn hàng chưa hoàn tất</a></li>-->
                            <!--    </div>-->
                            <!--</ul>-->
                        </li>

                        <li class="col-md-12 nav-item" id="product">
                            <a href="{{ route('product.show') }}" class="item-link"><i
                                    class="fa-solid fa-box"></i><span>Sản phẩm</span>
                            </a>
                            <i class="fa-solid fa-greater-than"></i>
                            <ul class="container sub-menu">
                                <div class="row">
                                    <li class="col-md-12"><a href="{{ route('product.show') }}">Danh sách sản phẩm</a>
                                    </li>
                                    <li class="col-md-12"><a href="{{ route('your_products') }}">Sản phẩm của bạn<nav>
                                            </nav></a>
                                    </li>
                                    <li class="col-md-12"><a href="{{ route('cat.show') }}">Danh mục sản phẩm</a></li>
                                    <li class="col-md-12"><a href="{{ route('product.add') }}">Thêm sản phẩm</a></li>
                                </div>
                            </ul>
                        </li>
                        {{-- <li class="col-md-12 nav-item" id="product">
                            <a href="" class="item-link"><i class="fa-solid fa-chart-simple"></i><span>Báo
                                    cáo</span>
                            </a>
                            <i class="fa-solid fa-greater-than"></i>
                            <ul class="container sub-menu">
                                <div class="row">
                                    <li class="col-md-12"><a href="">Danh sách sản phẩm</a></li>
                                    <li class="col-md-12"><a href="">Danh mục sản phẩm</a></li>
                                    <li class="col-md-12"><a href="">Quản lý kho cá nhân</a></li>
                                </div>
                            </ul>
                        </li> --}}
                        <li class="col-md-12 nav-item" id="customer">
                            <a href="{{ route('customer.show') }}" class="item-link"><i
                                    class="fa-solid fa-users"></i><span>Danh sách khách
                                    hàng</span></a>
                        </li>
                        @canany(['permission.add', 'permission.show', 'permission.delete', 'permission.edit',
                            'role.add', 'role.edit', 'role.delete', 'role.show'])
                            <li class="col-md-12 nav-item" id="role">
                                @canany(['permission.show', 'permission.edit', 'permission.delete', 'permission.add'])
                                    <a href="{{ route('permission.show') }}" class="item-link"><i
                                            class="fa-solid fa-newspaper"></i><span>Phân quyền</span> </a>
                                    <i class="fa-solid fa-greater-than"></i>
                                @endcanany

                                <ul class="container sub-menu">
                                    <div class="row">
                                        @canany(['permission.show', 'permission.edit', 'permission.delete',
                                            'permission.add'])
                                            <li class="col-md-12"><a href="{{ route('permission.show') }}">Danh sách quyền</a>
                                            </li>
                                        @endcanany
                                        @canany(['role.add', 'role.show', 'role.delete', 'role.edit'])
                                            <li class="col-md-12"><a href="{{ route('role.show') }}">Danh sách vai trò</a></li>
                                            <li class="col-md-12"><a href="{{ route('role.add') }}">Thêm vai trò</a></li>
                                        @endcanany
                                    </div>
                                </ul>
                            </li>
                        @endcanany

                        <li class="col-md-12 nav-item" id="user">
                            <a href="{{ route('admin_user.show') }}" class="item-link"><i
                                    class="fa-solid fa-user"></i><span>Người dùng</span> </a>
                            <i class="fa-solid fa-greater-than"></i>
                            <ul class="container sub-menu">
                                <div class="row">
                                    <li class="col-md-12"><a href="{{ route('admin_user.show') }}">Danh sách người
                                            dùng</a></li>
                                    <li class="col-md-12"><a href="{{ route('admin_user.add') }}">Thêm người dùng</a>
                                    </li>
                                </div>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- -------------------------End sidebar----------------------------- -->
            <div class="col-md-10" id="wr-content">
                <div id="header" class="container">
                    <div class="row">
                        <div class="search_all col-md-4">
                            <form action="">
                                <button> <i class="fa-solid fa-magnifying-glass"></i></button>
                                <input name="search_admin" type="text" placeholder="Nhập từ khóa tìm kiếm">
                            </form>
                            <div id="search_result" class="col-md-12"><br>
                            </div>
                        </div>
                        <div class="col-md-3" id="request">
                            <div id="helper" class="option" data-bs-container="body" data-bs-toggle="popover"
                                data-bs-placement="bottom"
                                data-bs-content="<div class='popover-help'>
                                    <div class='row' id='popover-menu'>                                                                   
                                        <ul class='col-md-12' id='list-suggest'>
                                            <li><a href='#'>Tổng quan về SapoShop</a></li>                                           
                                            <li><a href='#'>Giới thiệu giao diện chung SapoShop</a></li>
                                            <li><a href='#'>Hướng dẫn trải nghiệm SapoShop</a></li>                                           
                                        </ul>
                                        <div class='col-md-12 row' id='menu-suggest'>
                                            <a href='#' class='col-md-4'>
                                                <div class='icon'><img src='{{ asset('img/q-and-a-icon-23.png') }}' alt=''></div>
                                                <span>Câu hỏi <br> thường gặp</span>
                                            </a>
                                            <a href='#' class='col-md-4'>
                                                <div class='icon'><img src='{{ asset('img/video-camera-simple-icon-movie-260nw-1012284634.webp') }}' alt=''></div>
                                                <span>Video<br> hướng dẫn</span>
                                            </a>
                                            <a href='#' class='col-md-4 last'>
                                                <div class='icon'><img src='{{ asset('img/img(1).png') }}' alt=''></div>
                                                <span>Tài liệu<br> hướng dẫn</span>
                                            </a>
                                            
                                        </div>
                                        <div class='col-md-12' id='contact'>
                                            <a class='phone'>
                                                <i class='fa-solid fa-phone'></i>
                                                <span>0911577985</span>
                                            </a>
                                            <a href='#' class='send-help'>
                                                <i class='fa-solid fa-headphones'></i>
                                                <span>Gửi hỗ trợ</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            "
                                data-bs-html="true">
                                <span class="name-option"><i class="fa-solid fa-question"></i> Trợ giúp</span>
                            </div>
                            <div id="feebback" class="option" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                                <span class="name-option"><i class="fa-solid fa-heart"></i> Góp ý</span>
                            </div>
                        </div>
                        <div class="col-md-2" id="current-user">
                            <div id="top-profile" data-bs-container="body" data-bs-toggle="popover"
                                data-bs-placement="bottom" data-bs-html="true"
                                data-bs-content="
                             <ul id='bot-profile'>
                                 <li><a href='{{ route('current_user') }}'><i class='fa-regular fa-user'></i> Tài khoản của bạn</a></li>
                                 <li><a href='#'><i class='fa-solid fa-boxes-packing'></i> Gói dịch vụ</a></li>
                                 <li><a href='{{ route('admin.logout') }}'><i class='fa-solid fa-right-from-bracket'></i>Đăng xuất</a></li>
                                 <li><a href='#'>Điều khoản và dịch vụ</a></li>
                                 <li><a href='#'>Chính sách bảo mật</a></li>
                                 <li><a href='#'>Hỗ trợ</a></li>
                             </ul>
                            ">
                                <img src="{{ asset('img/user-icon-2048x2048-ihoxz4vq.png') }}" alt="">
                                <span class="name-user">{{ Auth::user()->fullname }}</span>
                                <span class="status">Online</span>
                            </div>
                        </div>
                        <div class="col-md-1" id="notify"><a href="http://localhost/backup-25-08-2023/Sapo/chatify"><i
                                    class="fa-regular fa-comments"></i></a></div>
                    </div>
                </div>
                <!-- --------------------Content---------------- -->
                <div id="content" class="container">
                    @yield('content')
                </div>
                <!-- -----------------------End-Content------------------- -->
            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Danh sách góp ý</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <ul id="list-feedback">
                                @foreach ($feedbacks as $feedback)
                                    <li class="feedback_item">
                                        <div class="top-fbitem">
                                            <a
                                                href="{{ route('customer.profile', $feedback->customer->id) }}">#{{ $feedback->customer->id }}-{{ $feedback->customer->fullname }}</a>
                                        </div>
                                        <div class="content-fbitem">
                                            <span><b>Mục góp ý: </b>{{ $feedback->section }}</span><br>
                                            <span><b>Tiêu đề: </b>{{ $feedback->title }}</span><br>
                                            <span><b>Nội dung: </b>{{ $feedback->content }}</span>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Xong</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <script src="{{ asset('js/index.js') }}"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
            integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous">
        </script>
        {{-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> --}}
        <script>
            const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
            const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
            popoverTriggerList.forEach(function(popoverTriggerEl) {
                popoverTriggerEl.addEventListener('click', function() {
                    // ẩn tất cả các popover khác
                    popoverList.forEach(function(popover) {
                        if (popover._element !== popoverTriggerEl) {
                            popover.hide()
                        }
                    })
                })
            })
        </script>
        <script>
            $(".search_all input").keyup(function() {
                var query = $(this).val();
                if (query != null) {
                    $.ajax({
                        type: 'GET',
                        url: "{{ route('search_admin_ajax') }}",
                        data: {
                            query: query,
                        },
                        success: function(data) {
                            $('#search_result').fadeIn();
                            $('#search_result').html(data);
                        },
                        // error: function(xhr) {
                        //     console.log(xhr.responseText);
                        // }
                    });
                } else {
                    $('#search_result').fadeOut();
                }
            })
        </script>
</body>

</html>
