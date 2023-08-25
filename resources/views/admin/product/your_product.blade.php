@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="title col-md-12">
            <h3>Danh sách sản phẩm của bạn</h3>
        </div>
        <div class="main-content row col-md-12 p-3">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-secondary">
                        <thead>
                            <tr>
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
                                    <td>
                                        <div><span>{{ $product->id }}</span></div>
                                    </td>
                                    <td>
                                        <div class="pe-3"><a class="info-intro"
                                                href="{{ route('product.detail', $product->id) }}"><span
                                                    class="product-name">{{ $product->name }}</span></a></div>
                                    </td>
                                    <td>
                                        <div><span>{{ number_format($product->price, 0, '.', ',') . ' VND' }}</span></div>
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
