@extends('admin.layout')
@section('content')
    <link rel="stylesheet" href="{{ asset('css/order-detail.css') }}">
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('order.show') }}"><span><i class="fa-solid fa-backward"></i>
                    Danh sách đơn
                    hàng</span></a></div>
        <div class="col-md-12 order-title"><span id="id-order">#{{ $order->id }}</span><span
                class="text-secondary time-created">{{ $order->created_at }}</span></div>
        <div class="col-md-7 row order-detail">
            <div class="order-detail-top col-md-12">
                <span class=""><b>Chi tiết đơn hàng</b></span>
                <span class="order-status badge bg-warning text-dark">{{ $order->delivery_status }}</span>
            </div>
            @foreach ($order_details as $order_detail)
                <div class="col-md-12 row order-detail-content mt-3">
                    <div class="col-md-7 row  product">
                        @php
                            $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color->id)->first();
                        @endphp
                        <div class="col-md-3 img-product">
                            @if (!empty($thumb))
                                <img src="{{ asset($thumb->link) }}" alt="">
                            @endif
                        </div>
                        <div class="col-md-9 d-flex product-info">
                            <a href="{{ route('product.detail', $order_detail->product->id) }}"><span
                                    class="name-product">{{ $order_detail->product->name }}</span></a>
                            <span class="product-type text-secondary">Màu:
                                <b>{{ $order_detail->color->name }}</b></span>
                            <span class="product-id text-secondary">#{{ $order_detail->product->id }}</span>
                            <span>Kho còn: <b>@php
                                $color = $order_detail->color;
                                $product = $order_detail->product;
                                $product_colors = $product->colors;
                                foreach ($product_colors as $product_color) {
                                    if ($color->name == $product_color->name) {
                                        if ($product_color->pivot->count < $order_detail->count) {
                                            echo $product_color->pivot->count . "<span class='text-danger'> (Không đủ)</span>";
                                        } else {
                                            echo $product_color->pivot->count;
                                        }
                                        break;
                                    }
                                }
                            @endphp</b></span>
                            <br>
                        </div>
                    </div>
                    <div class="col-md-2 center"><span
                            class="price">{{ number_format($order_detail->product->price * 0.91, 0, '.', ',') . ' VND' }}</span>
                    </div>
                    <div class="col-md-1 center">X <span class="count">{{ $order_detail->count }}</span></div>
                    <div class="col-md-2 center"><span
                            class="total">{{ number_format($order_detail->product->price * $order_detail->count * 0.91, 0, '.', ',') . ' VND' }}</span>
                    </div>
                </div>
            @endforeach

            <div class="col-md-12 row total-all">
                <div class="col-md-6"><span class="">Tổng cộng</span></div>
                <div class="col-md-6"><span
                        class="total-all-price">{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</span>
                </div>
            </div>
            <div class="col-md-12 row payable">
                <div class="col-md-7"><span class="text-secondary">Khách hàng phải thanh
                        toán</span></div>
                <div class="col-md-5 payable-price">
                    <span>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</span>
                </div>
            </div>
            <div class="col-md-12 row confirm-or-return">
                @if ($order->payment_status == 'Đã thanh toán')
                    @if ($order->delivery_status == 'Hoàn thành')
                        <div class="col-md-10 confirm">
                            <span class="text-success text-uppercase"><i class="fa-solid fa-check "></i>Đơn
                                hàng đã xác nhận thanh
                                toán <span
                                    class="total-all-price d-inline p-0 text-secondary"><b>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</b></span></span>
                        </div>
                    @else
                        <div class="col-md-10 confirm">
                            <span class="text-success text-uppercase"><i class="fa-solid fa-check "></i>Đơn
                                hàng đã xác nhận thanh
                                toán <span
                                    class="total-all-price d-inline p-0 text-secondary"><b>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</b></span></span>
                        </div>
                        <div class="col-md-2 to-return">
                            <span class="button" data-bs-toggle="modal" data-bs-target="#modal-to-return">Hoàn
                                trả</span>
                            <div class="modal fade" id="modal-to-return" tabindex="-1" role="dialog"
                                aria-labelledby="modalTitleId" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <form action="{{ route('order.to_return', $order->id) }}" method="POST">
                                        @csrf
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalTitleId">Hoàn trả</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        @foreach ($order_details as $order_detail)
                                                            <div class="col-md-12 row order-detail-content mt-3">
                                                                <div class="col-md-7 row  product">
                                                                    @php
                                                                        $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color->id)->first();
                                                                    @endphp
                                                                    <div class="col-md-3 img-product">
                                                                        @if (!empty($thumb))
                                                                            <img src="{{ asset($thumb->link) }}"
                                                                                alt="">
                                                                        @endif
                                                                    </div>
                                                                    <div class="col-md-9 d-flex product-info">
                                                                        <a
                                                                            href="{{ route('product.detail', $order_detail->product->id) }}"><span
                                                                                class="name-product">{{ $order_detail->product->name }}</span></a>
                                                                        <span class="product-type text-secondary">Màu:
                                                                            <b>{{ $order_detail->color->name }}</b></span>
                                                                        <span
                                                                            class="product-id text-secondary">#{{ $order_detail->product->id }}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2 center"><span
                                                                        class="price">{{ number_format($order_detail->product->price * 0.91, 0, '.', ',') . ' VND' }}</span>
                                                                </div>
                                                                <div class="col-md-1 center">X <span
                                                                        class="count">{{ $order_detail->count }}</span>
                                                                </div>
                                                                <div class="col-md-2 center"><span
                                                                        class="total">{{ number_format($order_detail->product->price * 0.91 * $order_detail->count, 0, '.', ',') . ' VND' }}</span>
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                        <div class="col-md-12 row money-to-return">
                                                            <div class="col-md-7"><span class="text-secondary">Tiền có thể
                                                                    hoàn
                                                                    trả</span></div>
                                                            <div class="col-md-5 money-to-return-price">
                                                                <span
                                                                    class="text-danger"><b>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</b></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 form-check d-flex">
                                                            <label for="send-email" class="form-check-label">Gửi email cho
                                                                khách
                                                                hàng</label>
                                                            <input id="send-email" type="checkbox" checked
                                                                class="form-check-input">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Hủy</button>
                                                <button name="btn_to_return" class="btn btn-primary">Hoàn
                                                    trả</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endif
                @elseif($order->payment_status == 'Chưa thanh toán')
                    <div class="col-md-8 confirm">
                        <span class="text-danger text-uppercase">Đơn
                            hàng chưa được thanh
                            toán <span
                                class="total-all-price d-inline p-0 text-secondary"><b>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</b></span></span>
                    </div>
                    @if ($order->delivery_status != 'Đơn hàng nháp')
                        <a href="{{ route('order.payment_complete', $order->id) }}" class="button col-md-4"
                            onclick="return confirm('Bạn có chắc chắn rằng đơn hàng này đã được thanh toán?')">Xác nhận đã
                            thanh toán</a>
                    @endif
                @else
                    <div class="col-md-8 confirm">
                        <span class="text-danger text-uppercase">Đơn
                            hàng đã được hoàn trả <span
                                class="total-all-price d-inline p-0 text-secondary"><b>{{ number_format($order->payment_amount, 0, '.', ',') . ' VND' }}</b></span></span>
                    </div>
                @endif


            </div>
            <div class="col-md-12 row manipulation-order">
                <div class="col-md-6 cancel-order">
                    @if (
                        $order->delivery_status != 'Đã hủy' &&
                            $order->delivery_status != 'Hoàn thành' &&
                            $order->delivery_status != 'Đơn hàng nháp')
                        <form action="{{ route('order.cancel', $order->id) }}" method="POST">
                            @csrf
                            <span class="button bg-danger text-warning" data-bs-toggle="modal"
                                data-bs-target="#modal-cancel-order">Hủy đơn hàng</span>
                            <div class="modal fade" id="modal-cancel-order" tabindex="-1" role="dialog"
                                aria-labelledby="modalTitleId" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-danger" id="modalTitleId">Hủy đơn
                                                hàng</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <span class="warning">Bạn nên hủy đơn hàng khi thấy đơn hàng
                                                    có vấn đề, khi khách hàng thay đổi quyết định hoặc khi
                                                    kho hàng hết sản phẩm. Thao tác này không thể khôi
                                                    phục.</span><br><br>
                                                <label for="" class="form-label"><b>Lý do hủy đơn
                                                        hàng <span class="text-danger">*</span></b></label>
                                                <select class="form-select form-select-sm" name="cancel_reason"
                                                    id="">
                                                    <option selected>Khách hàng thay đổi/Hủy đơn hàng
                                                    </option>
                                                    <option value="">Đơn hàng có vấn đề</option>
                                                    <option value="">Sản phẩm không sẵn có</option>
                                                    <option value="">Khác</option>
                                                </select>
                                                <br>
                                                <div class="mb-3">
                                                    <label for="description" class="form-label">Mô
                                                        tả <span class="text-danger">*</span></label>
                                                    <textarea class="form-control" name="cancel_description" id="description" cols="20" rows="0"></textarea>
                                                    @error('cancel_description')
                                                        <small class="text-danger">{{ $message }}</small>
                                                    @enderror
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 form-check d-flex">
                                                        <label for="to-return-warehouse" class="form-check-label">Hoàn trả
                                                            lại
                                                            kho sản
                                                            phẩm</label>
                                                        <input id="to-return-warehouse" disabled type="checkbox" checked
                                                            class="form-check-input">
                                                    </div>
                                                    @foreach ($order_details as $order_detail)
                                                        <div class="col-md-12 row order-detail-content mt-3">
                                                            <div class="col-md-7 row  product">
                                                                @php
                                                                    $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color->id)->first();
                                                                @endphp
                                                                <div class="col-md-3 img-product">
                                                                    @if (!empty($thumb))
                                                                        <img src="{{ asset($thumb->link) }}"
                                                                            alt="">
                                                                    @endif
                                                                </div>
                                                                <div class="col-md-9 d-flex product-info">
                                                                    <a
                                                                        href="{{ route('product.detail', $order_detail->product->id) }}"><span
                                                                            class="name-product">{{ $order_detail->product->name }}</span></a>
                                                                    <span class="product-type text-secondary">Màu:
                                                                        <b>{{ $order_detail->color->name }}</b></span>
                                                                    <span
                                                                        class="product-id text-secondary">#{{ $order_detail->product->id }}</span>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 center"><span
                                                                    class="price">{{ number_format($order_detail->product->price * 0.91, 0, '.', ',') . ' VND' }}</span>
                                                            </div>
                                                            <div class="col-md-1 center">X <span
                                                                    class="count">{{ $order_detail->count }}</span></div>
                                                            <div class="col-md-2 center"><span
                                                                    class="total">{{ number_format($order_detail->product->price * 0.91 * $order_detail->count, 0, '.', ',') . ' VND' }}</span>
                                                            </div>
                                                        </div>
                                                    @endforeach

                                                    <div class="col-md-12 form-check d-flex">
                                                        <label for="send-emailto" class="form-check-label">Gửi email cho
                                                            khách
                                                            hàng</label>
                                                        <input id="send-email" type="checkbox" checked
                                                            class="form-check-input">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Không
                                                hủy</button>
                                            <button
                                                onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này không')"
                                                class="btn btn-danger" name="btn_cancel" value="cancel">Hủy đơn</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    @endif
                </div>

                <div class="ship-order col-md-6 ">
                    @if ($order->delivery_status == 'Chờ xử lý')
                        @if ($check == 'true')
                            <span class="button bg-primary text-light" data-bs-toggle="modal"
                                data-bs-target="#modal-ship-order">Giao hàng</span>
                            <div class="modal fade" id="modal-ship-order" tabindex="-1" role="dialog"
                                aria-labelledby="modalTitleId" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-danger" id="modalTitleId">Giao hàng
                                            </h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <div class="mb-3">
                                                    <label for="receiver" class="form-label">Người
                                                        nhận</label>
                                                    <input type="text" name="" readonly id="receiver"
                                                        class="form-control" value="{{ $order->customer->fullname }}"
                                                        placeholder="" aria-describedby="helpId">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="description" class="form-label">Địa chỉ nhận
                                                        đơn</label>
                                                    <textarea class="form-control" readonly name="" id="description" cols="20" rows="0">{{ $order->delivery_address }}</textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Liên hệ</label>
                                                    <input type="text" readonly name=""
                                                        value="{{ $order->customer->phone }}" class="form-control"
                                                        placeholder="" aria-describedby="helpId">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="description" class="form-label">Ghi
                                                        chú</label>
                                                    <textarea class="form-control" name="" id="description" cols="20" readonly rows="0">{{ $order->note }}</textarea>
                                                </div>
                                                <div class="row">
                                                    @foreach ($order_details as $order_detail)
                                                        <div class="col-md-12 row order-detail-content mt-3">
                                                            <div class="col-md-7 row  product">
                                                                @php
                                                                    $thumb = $order_detail->product->thumbs->where('color_id', $order_detail->color->id)->first();
                                                                @endphp
                                                                <div class="col-md-3 img-product">
                                                                    @if (!empty($thumb))
                                                                        <img src="{{ asset($thumb->link) }}"
                                                                            alt="">
                                                                    @endif
                                                                </div>
                                                                <div class="col-md-9 d-flex product-info">
                                                                    <a
                                                                        href="{{ route('product.detail', $order_detail->product->id) }}"><span
                                                                            class="name-product">{{ $order_detail->product->name }}</span></a>
                                                                    <span class="product-type text-secondary">Màu:
                                                                        <b>{{ $order_detail->color->name }}</b></span>
                                                                    <span
                                                                        class="product-id text-secondary">#{{ $order_detail->product->id }}</span>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 center"><span
                                                                    class="price">{{ number_format($order_detail->product->price * 0.91, 0, '.', ',') . ' VND' }}</span>
                                                            </div>
                                                            <div class="col-md-1 center">X <span
                                                                    class="count">{{ $order_detail->count }}</span>
                                                            </div>
                                                            <div class="col-md-2 center"><span
                                                                    class="total">{{ number_format($order_detail->product->price * 0.91 * $order_detail->count, 0, '.', ',') . ' VND' }}</span>
                                                            </div>
                                                        </div>
                                                    @endforeach

                                                    <div class="col-md-12 form-check d-flex">
                                                        <label for="send-email" class="form-check-label">Gửi
                                                            email cho khách hàng</label>
                                                        <input id="send-email" type="checkbox" checked
                                                            class="form-check-input">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Hủy</button>
                                            <a href="{{ route('order.ship', $order->id) }}" class="btn btn-success">Giao
                                                hàng</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        @else
                            <span class="n-button bg-secondary text-light"><span class="text-warning">Không thể giao
                                    hàng</span></span>
                        @endif
                    @elseif ($order->delivery_status == 'Chờ lấy hàng')
                        <a href="{{ route('order.status', ['picked', $order->id]) }}"
                            class="button bg-primary text-light">Đã lấy hàng</a>
                    @elseif($order->delivery_status == 'Đang giao')
                        <a href="{{ route('order.status', ['completed', $order->id]) }}"
                            class="button bg-primary text-light">Hoàn thành</a>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-4 row customer-info">
            <div class="customer col-md-12 form-group">
                <label for="customer"><b>Khách hàng</b></label>
                <input type="text" id="customer" value="{{ $order->customer->fullname }}" disabled
                    class="form-control">
                <br><label for="customer-contact"><b>Liên hệ</b></label>
                <input type="email" id="customer-contact" value="{{ $order->customer->email }}" class="form-control"
                    disabled>
                <br><label for="address"><b>Địa chỉ nhận hàng</b></label>
                <textarea name="" class="form-control" id="" disabled cols="30" rows="5">{{ $order->delivery_address }}
                 </textarea>
            </div>
        </div>
    </div>
@endsection
