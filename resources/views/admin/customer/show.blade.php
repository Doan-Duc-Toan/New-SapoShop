@extends('admin.layout')
@section('content')
    <div class="row">
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="title col-md-12">
            <h3>Danh sách khách hàng</h3>
        </div>
        <div class="main-content row col-md-12 p-3">
            <ul class="status col-md-12 d-flex">
                <li class="status-item all"><a href="" class="text-secondary list-active">Tất cả khách hàng</a></li>
            </ul>
            <form action="">
                <div class="custom col-md-12 d-flex">
                    <div class="custom-item first">Tìm kiếm
                    </div>
                    <div class="search custom-item">
                        <button><i class="fa-solid fa-magnifying-glass"></i></button>
                        <input type="text" placeholder="Tìm kiếm Khách hàng">
                        <div id="countryList" class="col-md-12"><br>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mt-5">
                    <!--<div class="manipulation d-flex">-->
                    <!--    <select class="form-select form-select-sm" name="" id="">-->
                    <!--        <option selected>Chọn thao tác</option>-->
                    <!--        <option value="">Xóa khách hàng</option>-->
                    <!--        <option value="">Khôi phục khách hàng</option>-->
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
                                    <th scope="col">Họ và tên</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Điện thoại</th>
                                    <th scope="col">Đơn hàng</th>
                                    <th scope="col">Đơn hàng gần nhất</th>
                                    <th scope="col">Tổng chi tiêu</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($customers as $customer)
                                    <tr class="">
                                        <!--<td scope="row">-->
                                        <!--    <div><input type="checkbox" class="form-check-input check">-->
                                        <!--    </div>-->
                                        <!--</td>-->
                                        <td>
                                            <div><a class="info-intro"
                                                    href="{{ route('customer.profile', $customer->id) }}">{{ $customer->fullname }}</span></a>
                                            </div>
                                        </td>
                                        <td>
                                            <div><span>{{ $customer->email }}</span></div>
                                        </td>
                                        <td>
                                            <div><span>{{ $customer->phone }}</span></div>
                                        </td>
                                        <td>
                                            <div><span>{{ $customer->orders->count() }}</span></div>
                                        </td>
                                        <td>
                                            @if (!empty($customer->orders->first()->id))
                                                <div><span><a href="{{route('order.detail', $customer->orders->last()->id)}}">{{$customer->orders->last()->id}}</a></span></div>
                                            @else
                                                <div><span>0</span></div>
                                            @endif
                                        </td>
                                        <td class="">
                                            <div><span class=""><b>{{number_format($customer->orders->where('delivery_status','Hoàn thành')->sum('payment_amount'), 0, '.', ',') . ' đ'}}</b></span></div>
                                        </td>

                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                        {{-- <nav class="col-md-12 paginate" aria-label="Page navigation">
                            <ul class="pagination    ">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav> --}}
                    </div>

                </div>
            </form>

        </div>
    </div>
    <script>
        $(document).ready(function() {
            $(".search input").keyup(function() {
                var query = $(this).val();
                if (query != '') {
                    $.ajax({
                        type: 'GET',
                        url: "{{ route('customer.search_ajax') }}",
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

            $(document).on('click', 'li', function() {
                $('#country_name').val($(this).text());
                $('#countryList').fadeOut();
            });
        })
    </script>
@endsection
