@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="title col-md-12">
            <h3>Đơn hàng</h3>
        </div>
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="main-content row col-md-12 p-3">
            <ul class="status col-md-12 d-flex">
                <li class="status-item all"><a href="{{ route('order.show', ['status' => 'all']) }}"  class="text-secondary @php
                    if($current_status == 'all') echo "list-active"
                @endphp">Tất cả
                        đơn hàng</a></li>
                <li class="status-item"><a href="{{ route('order.show', ['status' => 'own']) }}" class="text-secondary @php
                    if($current_status == 'own') echo "list-active"
                @endphp" >Đơn hàng
                        của bạn</a></li>
                <li class ="status-item"><span class="text-primary">Doanh thu: <b>{{ number_format($revenue, 0, '.', ',') . ' VND' }}</b> </span></li>
            </ul>
            <form action="{{ route('order.filter', ['status' => $current_status]) }}" method="POST">
                @csrf
                <div class="custom col-md-12 d-flex">
                    <div class="custom-item first">Lọc đơn hàng
                    </div>
                    <div class="custom-item"><span>Loại <i class="fa-sharp fa-solid fa-caret-down"></i></span></i>
                        <div class="custom-detail">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" id="open" value="open"
                                    checked>
                                <label class="form-check-label" for="open">
                                    Mở
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" id="store" value="store">
                                <label class="form-check-label" for="store">
                                    Lưu trữ
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="type" id="cancel" value="cancel">
                                <label class="form-check-label" for="cancel">
                                    Hủy
                                </label>
                            </div>
                            <button name="btn_filter" value="type" class="btn btn-secondary">Lọc</button>
                        </div>
                    </div>
                    <div class="custom-item"><span>Thanh toán <i class="fa-sharp fa-solid fa-caret-down"></i></span> </i>
                        <div class="custom-detail">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment" id="unpaid"
                                    value="Chưa thanh toán" checked>
                                <label class="form-check-label" for="unpaid">
                                    Chưa thanh toán
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment" id="paid"
                                    value="Đã thanh toán">
                                <label class="form-check-label" for="paid">
                                    Đã thanh toán
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="payment" id="to_return"
                                    value="Hoàn trả">
                                <label class="form-check-label" for="to_return">
                                    Hoàn trả
                                </label>
                            </div>
                            <button name="btn_filter" value="payment" class="btn btn-secondary">Lọc</button>
                        </div>
                    </div>
                    <div class="custom-item"><span>Trạng thái <i class="fa-sharp fa-solid fa-caret-down"></i></span>
                        <div class="custom-detail">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="ship[]" value="Đơn hàng nháp"
                                    checked>
                                <label class="form-check-label" for="">
                                    Đơn hàng nháp
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="ship[]" value="Chờ xử lý">
                                <label class="form-check-label" for="">
                                    Chờ xử lý
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="ship[]" value="Chờ lấy hàng">
                                <label class="form-check-label" for="">
                                    Chờ lấy hàng
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="ship[]" value="Đang giao">
                                <label class="form-check-label" for="">
                                    Đang giao
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="ship[]" value="Hoàn thành">
                                <label class="form-check-label" for="">
                                    Hoàn thành
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="ship[]" value="Đã hủy">
                                <label class="form-check-label" for="">
                                    Đã hủy
                                </label>
                            </div>
                            <button name="btn_filter" value="delivery" class="btn btn-secondary">Lọc</button>
                        </div>
                    </div>
                    <div class="search custom-item">
                        <button><i class="fa-solid fa-magnifying-glass"></i></button>
                        <input type="text" placeholder="Tìm kiếm đơn hàng">
                        <div id="countryList" class="col-md-12"><br>
                        </div>
                    </div>
                    <div class="custom-item arrange"><span><i class="fa-solid fa-arrow-down-wide-short"></i></span>
                        <div class="custom-detail">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="day-reduce"
                                    value="created_at,desc" checked>
                                <label class="form-check-label" for="day-reduce">
                                    Ngày (Giảm dần)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="day-inc"
                                    value="created_at,asc">
                                <label class="form-check-label" for="day-inc">
                                    Ngày (Tăng dần)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="price-reduce"
                                    value="payment_amount,desc">
                                <label class="form-check-label" for="price-reduce">
                                    Giá (Giảm dần)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="arrange" id="price-inc"
                                    value="payment_amount,asc">
                                <label class="form-check-label" for="price-inc">
                                    Giá (Tăng dần)
                                </label>
                            </div>
                            <button class="btn btn-secondary" name="btn_filter" value="arrange">Lọc</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" id="table-order">
                    <!--<div class="manipulation d-flex">-->
                    <!--    <select class="form-select form-select-sm" name="" id="">-->
                    <!--        <option selected>Chọn thao tác</option>-->
                    <!--        <option value="">Xóa đơn hàng</option>-->
                    <!--        <option value="">Khôi phục đơn hàng</option>-->
                    <!--    </select>-->
                    <!--    <button class="btn btn-secondary">Thực hiện</button>-->
                    <!--</div>-->
                    <div class="table-responsive mt-5">
                        <table class="table table-secondary">
                            <thead>
                                <tr>
                                    <!--<th scope="col"><input type="checkbox" name="checkall"-->
                                    <!--        class="check-all form-check-input">-->
                                    <!--</th>-->
                                    <th scope="col">Mã đơn hàng</th>
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Thanh toán</th>
                                    <th scope="col">Giao hàng</th>
                                    <th scope="col">Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orders as $order)
                                    <tr class="">
                                        <!--<td scope="row"><input type="checkbox" class="form-check-input check">-->
                                        <!--</td>-->
                                        <td><a href="{{ route('order.detail', $order->id) }}">#{{ $order->id }}</a></td>
                                        <td>{{ $order->created_at }}</td>
                                        <td>{{ $order->customer->fullname }}</td>
                                        <td class=""><span
                                                class="badge  @php
if($order->payment_status == 'Đã thanh toán') echo 'bg-success';
                                             else echo 'bg-secondary'; @endphp">{{ $order->payment_status }}</span>
                                        </td>
                                        <td><span
                                                class="badge @php
if($order->delivery_status == 'Đã giao')echo 'bg-success';
                                             else echo 'bg-danger'; @endphp">{{ $order->delivery_status }}</span>
                                        </td>
                                        <td>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{-- {{ $orders->links('pagination::bootstrap-5') }} --}}
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
                        url: "{{ route('order.search_ajax') }}",
                        data: {
                            query: query,
                        },
                        success: function(data) {
                            $('#countryList').fadeIn();
                            $('#countryList').html(data);
                        },
                    });
                } else {
                    $('#countryList').fadeOut();
                }
            })
            $('.search input').keydown(function(event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    return false;
                }
            });
        })
    </script>
@endsection
