@extends('client.layout')
@section('content')
    <link rel="stylesheet" href="{{ asset('client/css/index.css') }}">
    <link rel="stylesheet" href="{{ asset('client/js/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css') }}">
    <link rel="stylesheet" href="{{ asset('client/js/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.css') }}">
    <script src="{{ asset('client/js/OwlCarousel2-2.3.4/dist/owl.carousel.js') }}"></script>
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
    <div id="cover">
        <div class="img-cover">
            <img src="{{ asset('client/img/big_bn_slide.webp') }}" alt="">
        </div>
        <div class="slide center">
            <div class="slide-img-cover">
                <div class="owl-carousel owl-theme">
                    <div class="slide-item"> <a href="#"><img src="{{ asset('client/img/slide-img1.webp') }}"
                                alt=""></a> </div>
                    <div class="slide-item"> <a href="#"><img src="{{ asset('client/img/slide-img2.webp') }}"
                                alt=""></a></div>
                    <div class="slide-item"> <a href="#"><img src="{{ asset('client/img/slide-img1.webp') }}"
                                alt=""></a> </div>
                    <div class="slide-item"> <a href="#"><img src="{{ asset('client/img/slide-img2.webp') }}"
                                alt=""></a> </div>
                </div>
            </div>
        </div>

    </div>
    <div id="content">
        <div class="row" id="strong-point">
            <div class="col-md-3 col-lg-3 col-sm-6 col-6 mt-3">
                <div>
                    <span class="sp-icon"><img src="{{ asset('client/img/icon2-01-600x577.png') }}" alt=""></span>
                    <span class="sp-title center">Sản phẩm an toàn</span>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-6 col-6 mt-3">
                <div>
                    <span class="sp-icon"><img src="{{ asset('client/img/icon-chat-luong.png') }}" alt=""></span>
                    <span class="sp-title center">Chất lượng cam kết</span>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-6 col-6 mt-3">
                <div>
                    <span class="sp-icon"><img src="{{ asset('client/img/icon3-5fc5a756a1348.png') }}"
                            alt=""></span>
                    <span class="sp-title center">Dịch vụ vượt trội</span>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 col-sm-6 col-6 mt-3">
                <div>
                    <span class="sp-icon"><img
                            src="{{ asset('client/img/icon-giao-hang-2b770097b24073e6975d78c45719c53c.png') }}"
                            alt=""></span>
                    <span class="sp-title center">Giao hàng nhanh chóng</span>
                </div>
            </div>
        </div>
        <div id="cat-ost">
            <h3>Danh mục nổi bật</h3>
            <ul class="list-cat">
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Điện thoại']) }}">
                        <img src="{{ asset('client/img/iphone-x-64gb-1.png') }}" alt="">
                        <span>Điện thoại</span>
                    </a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Đồng hồ']) }}"><img
                            src="{{ asset('client/img/th (2).jpg') }}" alt="">
                        <span>Smart watch</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Laptop']) }}"> <img
                            src="{{ asset('client/img/th (3).jpg') }}" alt="">
                        <span>Laptop</span>
                    </a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Máy tính bảng']) }}"><img
                            src="{{ asset('client/img/th (4).jpg') }}" alt="">
                        <span>Máy tính bảng</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Thiết bị mạng']) }}"> <img
                            src="{{ asset('client/img/th (5).jpg') }}" alt="">
                        <span>Thiết bị mạng</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Tivi']) }}"> <img src="{{ asset('client/img/th (6).jpg') }}"
                            alt="">
                        <span>Ti vi</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Tai nghe']) }}"> <img
                            src="{{ asset('client/img/th (7).jpg') }}" alt="">
                        <span>Tai nghe</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Ốp']) }}"> <img src="{{ asset('client/img/th (8).jpg') }}"
                            alt="">
                        <span>Ốp lưng, bao da</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Loa']) }}"> <img src="{{ asset('client/img/th (9).jpg') }}"
                            alt="">
                        <span>Loa</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Sạc dự phòng']) }}"> <img
                            src="{{ asset('client/img/th (10).jpg') }}" alt="">
                        <span>Pin dự phòng</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Cáp sạc']) }}"> <img
                            src="{{ asset('client/img/th (11).jpg') }}" alt="">
                        <span>Cáp, củ sạc</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Màn hình']) }}"> <img
                            src="{{ asset('client/img/th (12).png') }}" alt="">
                        <span>màn hình</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Chuột']) }}"> <img
                            src="{{ asset('client/img/th (13).png') }}" alt="">
                        <span>Chuột</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Bàn phím']) }}"> <img
                            src="{{ asset('client/img/th (14).png') }}" alt="">
                        <span>Bàn phím</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Phụ kiện gaming']) }}"> <img
                            src="{{ asset('client/img/th (15).webp') }}" alt="">
                        <span>Phụ kiện gaming</span></a>
                </li>
                <li class="cat-item">
                    <a href="{{ route('client.search_type', ['Camera']) }}"> <img
                            src="{{ asset('client/img/th (16).webp') }}" alt="">
                        <span>Camera, webcam</span></a>
                </li>
            </ul>
        </div>
        <div id="flash-sale">
            <div class="fs-title">
                <img src="{{asset('client/img/flash-sale-1784897-1521723.png')}}" alt="">
                <h4 class="center">FLASH SALE</h4>
            </div>
            <ul class="list-product">
                @php
                    $count = 0;
                @endphp
                @foreach ($products as $product)
                    @php
                        $count++;
                    @endphp
                    <li class="product-item">
                        <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                            class="detail product-if">
                            <div class="center product-thumb">
                                @foreach ($product->thumbs as $thumb)
                                    <img src="{{ asset($thumb->link) }}" alt="">
                                @break
                            @endforeach
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="1"
                                style="width: {{ $product->sold * 100 / $product->count }}%"></div>
                        </div>
                        <span class="pr-name">{{ $product->name }}</span>
                    </a>
                    <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                        class="center setting pt-icon"><i class="fa-solid fa-gear fa-spin"></i></a>
                    {{-- <a href="" class="basket center pt-icon"><i
                            class="fa-solid fa-basket-shopping fa-shake"></i></a> --}}
                    <div class="sale-label">
                        <span>Giảm 9%</span>
                    </div>
                    <div class="price">
                        <span class="new-p">{{ number_format($product->price * 0.91, 0, '.', ',') . ' đ' }}</span>
                        <span
                            class="old-p text-secondary">{{ number_format($product->price, 0, '.', ',') . ' đ' }}</span>
                    </div>
                </li>
                @if ($count == 10)
                @break
            @endif
        @endforeach

    </ul>
</div>
<div id="product-for-u">
    <div class="tablink">
        <a class="center acvite" href="">
            <img src="{{ asset('client/img/goiy-1.webp') }}" alt="">
            <span>Gợi ý cho bạn</span>
        </a>
        <a class="center" href="">
            <img src="{{ asset('client/img/icon-xa-hang-50-50x50-2.webp') }}" alt="">
            <span>Xả hàng giảm sốc</span>
        </a>
        <a class="center" href="">
            <img src="{{ asset('client/img/chigiamonlinedesk-50x54-1.webp') }}" alt="">
            <span>Sale mùa hè</span>
        </a>
        <a class="center" href="">
            <img src="{{ asset('client/img/icon-desk-51x50-2.webp') }}" alt="">
            <span>Deal ngon bổ rẻ</span>
        </a>
    </div>
    <ul class="list-product">
        @foreach ($randomProducts as $product)
            <li class="product-item">
                <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                    class="detail product-if">
                    <div class="center product-thumb">
                        @foreach ($product->thumbs as $thumb)
                            <img src="{{ asset($thumb->link) }}" alt="">
                        @break
                    @endforeach
                </div>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                        role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="1"
                        style="width: {{ $product->sold * 100 / $product->count }}%"></div>
                </div>
                <span class="pr-name">{{ $product->name }}</span>
            </a>
            <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                class="center setting pt-icon"><i class="fa-solid fa-gear fa-spin"></i></a>
            {{-- <a href="" class="basket center pt-icon"><i
                    class="fa-solid fa-basket-shopping fa-shake"></i></a> --}}
            <div class="sale-label">
                <span>Giảm 9%</span>
            </div>
            <div class="price">
                <span class="new-p">{{ number_format($product->price * 0.91, 0, '.', ',') . ' đ' }}</span>
                <span
                    class="old-p text-secondary">{{ number_format($product->price, 0, '.', ',') . ' đ' }}</span>
            </div>
        </li>
    @endforeach
</ul>
<div class="more-product center">
    <a class="center" href="">Xem tất cả</a>
</div>
</div>
<div id="list-smart-phone">
<div class="top-list">
    <a href="" class="list-title">ĐIỆN THOẠI NỔI BẬT</a>
    <ul class="list-cat-in-product">
        <li class="center"><a class=""
                href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Galaxy Ford']) }}">Galaxy
                Ford</a></li>
        <li class="center"><a
                href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Samsung']) }}">Samsung</a>
        </li>
        <li class="center"><a
                href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Apple']) }}">Apple</a></li>
        <li class="center"><a
                href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Xiaomi']) }}">Xiaomi</a></li>
        <li class="center"><a
                href="{{ route('client.search_key', ['Điện thoại', 'supplier', 'Oppo']) }}">Oppo</a></li>
        <li class="center"><a href="{{ route('client.search_type', ['Điện thoại']) }}">Xem tất cả</a></li>
    </ul>
</div>
<div class="list-content">
    <div class="list-sidebar">
        <a href="" class="sb-product sb-top"><img src="{{ asset('client/img/bn_pr_3_1.webp') }}"
                alt=""></a>
        <a href="" class="sb-product sb-bot"><img src="{{ asset('client/img/bn_pr_3_2.webp') }}"
                alt=""></a>
    </div>
    <ul class="list-product  p-list">
        @foreach ($randomSPhones as $product)
            <li class="product-item">
                <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                    class="detail product-if">
                    <div class="center product-thumb">
                        @foreach ($product->thumbs as $thumb)
                            <img src="{{ asset($thumb->link) }}" alt="">
                        @break
                    @endforeach
                </div>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                        role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="1"
                        style="width: {{ $product->sold * 100 / $product->count }}%"></div>
                </div>
                <span class="pr-name">{{ $product->name }}</span>
            </a>
            <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                class="center setting pt-icon"><i class="fa-solid fa-gear fa-spin"></i></a>
            {{-- <a href="" class="basket center pt-icon"><i
                    class="fa-solid fa-basket-shopping fa-shake"></i></a> --}}
            <div class="sale-label">
                <span>Giảm 9%</span>
            </div>
            <div class="price">
                <span
                    class="new-p">{{ number_format($product->price * 0.91, 0, '.', ',') . ' đ' }}</span>
                <span
                    class="old-p text-secondary">{{ number_format($product->price, 0, '.', ',') . ' đ' }}</span>
            </div>
        </li>
    @endforeach

</ul>
</div>
</div>
<div id="list-laptop">
<div class="top-list">
<a href="" class="list-title">LAPTOP HOT</a>
<ul class="list-cat-in-product">
    <li class="center"><a class=""
            href="{{ route('client.search_key', ['Laptop', 'name', 'Macbook']) }}">Markbook</a></li>
    <li class="center"><a href="{{ route('client.search_cat', ['Laptop', 'Văn phòng']) }}">Văn phòng</a>
    </li>
    <li class="center"><a href="{{ route('client.search_cat', ['Laptop', 'Sinh viên']) }}">Sinh viên</a>
    </li>
    <li class="center"><a href="{{ route('client.search_cat', ['Laptop', 'Gaming']) }}">Gamming</a></li>
    <li class="center"><a href="{{ route('client.search_type', ['Laptop']) }}">Xem tất cả</a></li>
</ul>
</div>
<div class="list-content">
<ul class="list-product p-list">
    @foreach ($randomLaptops as $product)
        <li class="product-item">
            <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
                class="detail product-if">
                <div class="center product-thumb">
                    @foreach ($product->thumbs as $thumb)
                        <img src="{{ asset($thumb->link) }}" alt="">
                    @break
                @endforeach
            </div>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                    role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="1"
                    style="width: {{ $product->sold * 100 / $product->count }}%"></div>
            </div>
            <span class="pr-name">{{ $product->name }}</span>
        </a>
        <a href="{{ route('c_product.detail', [$product->name, $product->id]) }}"
            class="center setting pt-icon"><i class="fa-solid fa-gear fa-spin"></i></a>
        {{-- <a href="" class="basket center pt-icon"><i
                class="fa-solid fa-basket-shopping fa-shake"></i></a> --}}
        <div class="sale-label">
            <span>Giảm 9%</span>
        </div>
        <div class="price">
            <span
                class="new-p">{{ number_format($product->price * 0.91, 0, '.', ',') . ' đ' }}</span>
            <span
                class="old-p text-secondary">{{ number_format($product->price, 0, '.', ',') . ' đ' }}</span>
        </div>
    </li>
@endforeach
</ul>
<div class="list-sidebar">
<a href="" class="sb-product sb-top"><img src="{{ asset('client/img/16.webp') }}"
        alt=""></a>
<a href="" class="sb-product sb-bot"><img src="{{ asset('client/img/17.webp') }}"
        alt=""></a>
</div>
</div>
<div class="banner">
<a href=""><img src="{{ asset('client/img/bn_pr_5.webp') }}" alt=""></a>
</div>
</div>
</div>
<script>
    $(document).ready(function() {
        $(".owl-carousel").owlCarousel({
            //Basic Speeds
            items: 2,
            loop: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true
        });
    })
</script>
@endsection
