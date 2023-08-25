@extends('admin.layout')
@section('content')
    <div class="row">
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="title col-md-12">
            <h3>Danh sách sản phẩm</h3>
        </div>
        <div class="main-content row col-md-12 p-3">
            <ul class="status col-md-12 d-flex">
                <li class="status-item all"><a href="{{route('product.show')}}" class="filter-products list-active">Tất cả sản phẩm</a></li>
            </ul>
            <form action="{{ route('product.filter') }}" method="POST">
                @csrf
                <div class="custom col-md-12 d-flex">
                    <div class="custom-item first">Lọc
                    </div>
                    <div class="custom-item"><span>Danh mục<i class="fa-sharp fa-solid fa-caret-down"></i></span></i>
                        <div class="custom-detail">
                            @foreach ($cats as $cat)
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="cats[]" id="{{ $cat->id }}"
                                        value="{{ $cat->id }}">
                                    <label class="form-check-label" for="{{ $cat->id }}">
                                        {{ $cat->name }}
                                    </label>
                                </div>
                            @endforeach
                            <button class="btn btn-secondary" name="btn_filter" value="cat">Lọc</button>
                        </div>
                    </div>
                    <div class="custom-item"><span>Nhà CC <i class="fa-sharp fa-solid fa-caret-down"></i></span> </i>
                        <div class="custom-detail">
                            @foreach ($suppliers as $supplier)
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="supplier" id="{{ $supplier }}"
                                        value="{{ $supplier }}">
                                    <label class="form-check-label" for="{{ $supplier }}">
                                        {{ $supplier }}
                                    </label>
                                </div>
                            @endforeach
                            <button class="btn btn-secondary" name="btn_filter" value="supplier">Lọc</button>
                        </div>
                    </div>
                    <div class="custom-item"><span>Loại<i class="fa-sharp fa-solid fa-caret-down"></i></span>
                        <div class="custom-detail">
                            @foreach ($types as $type)
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="types[]" id="{{ $type }}"
                                        value="{{ $type }}">
                                    <label class="form-check-label" for="{{ $type }}">
                                        {{ $type }}
                                    </label>
                                </div>
                            @endforeach
                            <button class="btn btn-secondary" name="btn_filter" value="type">Lọc</button>
                        </div>
                    </div>
                    <div class="search custom-item">
                        <button name="btn_filter" value="search"><i class="fa-solid fa-magnifying-glass"></i></button>
                        <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm">
                        <div id="countryList" class="col-md-12"><br>
                        </div>
                    </div>
                    <div class="custom-item arrange"><span><i class="fa-solid fa-arrow-down-wide-short"></i></span>
                        <div class="custom-detail">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="name"
                                    value="name,asc">
                                <label class="form-check-label" for="name">
                                    Tên sản phẩm(A-Z)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="day-reduce"
                                    value="created_at,desc">
                                <label class="form-check-label" for="day-reduce">
                                    Ngày tạo (Giảm dần)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="day-inc"
                                    value="created_at,asc">
                                <label class="form-check-label" for="day-inc">
                                    Ngày tạo (Tăng dần)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="price-reduce"
                                    value="price,desc">
                                <label class="form-check-label" for="price-reduce">
                                    Giá (Giảm dần)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="price-inc"
                                    value="price,asc">
                                <label class="form-check-label" for="price-inc">
                                    Giá (Tăng dần)
                                </label>
                            </div>
                            <button class="btn btn-secondary" name="btn_filter" value="arrange">Lọc</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mt-5">
                    <!--<div class="manipulation d-flex">-->
                    <!--    <select class="form-select form-select-sm" name="action[]" id="">-->
                    <!--        <option selected>Chọn thao tác</option>-->
                    <!--        <option value="delete">Xóa sản phẩm</option>-->
                    <!--    </select>-->
                    <!--    <button class="btn btn-secondary">Thực hiện</button>-->
                    <!--</div>-->
                    <div class="table-responsive">
                        <table class="table table-secondary">
                            <thead>
                                <tr>
                                    <!--<th scope="col"><input type="checkbox" name="checkall"-->
                                    <!--        class="check-all form-check-input">-->
                                    <!--</th>-->
                                    <th scope="col">Id</th>
                                    <th scope="col">Sản phẩm</th>
                                    <th scope="">Giá sản phẩm</th>
                                    <th scope="col">Kho</th>
                                    <th scope="col">Loại</th>
                                    <th scope="col">Nhà cung cấp</th>
                                    <th scope="col">Ngày tạo</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                    <tr class="">
                                        <!--<td scope="row">-->
                                        <!--    <div><input type="checkbox" class="form-check-input check">-->
                                        <!--    </div>-->
                                        </td>
                                        <td>
                                            <div><span>{{ $product->id }}</span></div>
                                        </td>
                                        <td>
                                            <div class="pe-3"><a class="info-intro"
                                                    href="{{ route('product.detail', $product->id) }}"><span
                                                        class="product-name">{{ $product->name }}</span></a></div>
                                        </td>
                                        <td>
                                            <div><span>{{number_format($product->price, 0, ".", ",") . " VND"}}</span></div>
                                        </td>
                                        <td>
                                            <div><span>{{ $product->count }}</span></div>
                                        </td>
                                        <td>
                                            <div><span>{{ $product->type }}</span></div>
                                        </td>
                                        <td>
                                            <div><span class="badge bg-success">{{ $product->supplier }}</span></div>
                                        </td>
                                        <td>
                                            <div><span>{{ $product->created_at }}</span></div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{-- {{ $products->links('pagination::bootstrap-5') }} --}}
                    </div>

                </div>
            </form>

        </div>
    </div>
    <script>
            $(".search input").keyup(function() {
                var query = $(this).val();
                if (query != null) {
                    $.ajax({
                        type: 'GET',
                        url: "{{ route('product.search_ajax') }}",
                        data: {
                            query: query,
                        },
                        success: function(data) {
                            $('#countryList').fadeIn();
                            $('#countryList').html(data);
                        },
                        // error: function(xhr) {
                        //     console.log(xhr.responseText);
                        // }
                    });
                } else {
                    $('#countryList').fadeOut();
                }
            })


    </script>
   
@endsection
