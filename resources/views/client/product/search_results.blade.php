@extends('client.layout')
@section('content')
    <link rel="stylesheet" href="{{ asset('client/css/list-product.css') }}">
    <style>
        #arrange_option {
            display: flex;
            flex-basis: 100%;
            max-width: 100%;
        }
    </style>
    <nav id="breadcrumb-nav" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('client.index')}}"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
            <li class="breadcrumb-item" aria-current="page" style="font-weight: 700;">Kết quả tìm kiếm cho "{{$key}}" <span style="color:#D60019;">({{$count}} kết quả)</span></li>
        </ol>
    </nav>
    <div id="content">       
        @if (!empty($products->first()))
        <div id="arrange">
            <div id="list-product-main">
                <div class="list-content">
                    <ul class="list-product  p-list">
                        @foreach ($products as $product)
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
                                        style="width: {{ $product->sold * 100 / $product->count }}%">
                                    </div>
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
        <div class="center paginate">
           <span class="see-more btn-adjust">Xem tất cả</span>
            <span class="btn-collapse btn-adjust">Thu gọn</span>
        </div>
    </div>
    @else
     <h3 style="color: red">Không có sản phẩm nào!</h3><br>
    @endif
</div>
<link rel="stylesheet" href="{{asset('client/css/list-product-respon.css')}}">
<script>
    $(document).ready(function(){
        $(".see-more").click(function() {
            $("ul.list-product").css('height', 'auto');
            $(this).css('display', 'none');
            $('.btn-collapse').css('display', 'inline');
        })
        $(".btn-collapse").click(function() {
            $("ul.list-product").css('height', '720px');
            $(this).css('display', 'none');
            $('.see-more').css('display', 'inline');
        })
    })
</script>
@endsection
