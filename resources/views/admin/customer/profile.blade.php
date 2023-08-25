@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('customer.show') }}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách Khách hàng</span></a></div>
        <br>
        <h3>#{{ $customer->id }}</h3><br><br>
        <div class="col-md-12 content-detail">
            <form class="row" action="{{route('customer.update',$customer->id)}}" method = "POST">
                @csrf
                <div class="col-md-7 row  user-info">
                    <div class="col-md-12 bg-F row user-desc">
                        <div class="img-user col-md-2">
                            @if ($customer->gender == 'male')
                                <img src="{{ asset('client/img/account.webp') }}" alt="">
                            @else
                                <img src="{{ asset('client/img/female.webp') }}" alt="">
                            @endif
                        </div>
                        <div class="user-name col-md-10">
                            <span>{{ $customer->fullname }}</span><br>
                            <span>{{ $customer->address }}</span>
                        </div>
                        <div class="mb-3 col-md-12 note">
                            <label for="description" class="form-label">Ghi chú</label>
                            <textarea class="form-control" name="note" id="description" placeholder="Nhập thông tin ghi chú về khách hàng"
                                rows="3">{{ $customer->note }}</textarea>
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-primary">Cập nhật</button>
                        </div>
                    </div>
                    <div class="col-md-12 recent-order row bg-F">
                        <span>Đơn hàng gần đây</span>
                        <div class="table-responsive">
                            <table
                                class="table table-striped
                        table-hover	
                        table-borderless
                        table-primary
                        align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Trạng thái</th>
                                        <th>Giá tiền</th>
                                        <th>Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody class="table-group-divider">
                                    @foreach ($customer->orders as $order)
                                        <tr class="table-primary">
                                            <td scope="row"><a
                                                    href="{{ route('order.detail', $order->id) }}">#{{ $order->id }}</a>
                                            </td>
                                            <td class="">{{ $order->delivery_status }}</td>
                                            <td>{{ number_format($order->payment_amount, 0, '.', ',') . ' đ' }}</td>
                                            <td>{{ $order->updated_at }}</td>
                                        </tr>
                                    @endforeach


                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>

                    </div>

                </div>
                <div class="col-md-3 contact row bg-F">
                    <div class="col-md-12">
                        <span><b>Liên hệ</b></span><br><br>
                        <span class="email text-secondary"><b>Email:</b> {{ $customer->email }}</span><br>
                        <span class="phone text-secondary"><b>SĐT:</b> {{ $customer->phone }}</span><br>
                        <span class="gender text-secondary"><b>Giới tính:</b> @php
                            if ($customer->gender == 'male') {
                                echo 'Nam';
                            } else {
                                echo 'Nữ';
                            }
                        @endphp</span><br>
                        <span class="address text-secondary"><b>Địa chỉ:</b> {{ $customer->address }}</span>
                    </div>
                </div>
                <div class="col-md-12 complete">
                  <a href="{{route('customer.delete',$customer->id)}}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này?')">Xóa khách hàng</a>

                </div>
            </form>
        </div>
    </div>
@endsection
