@extends('admin.layout')
@section('content')
<style>
    #modal_message .diary-content{
        height: 30px !important;
        width: 100% !important;
    }
    .time-send{
        font-size: 13px;
    }
</style>
    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
    <div id="business" class="row">
        <div id="day-business" class="col-md-9 row">
            <div class="col-md-12 title-business">
                <h4>Kết quả kinh doanh trong ngày</h4>
            </div>
            <a href="" class="head report-day col-md-3">
                <img class="bg-red-200 d-block" src="{{ asset('img/unnamed.jpg') }}" alt="">
                <div class="rp-name">
                    <span class="name-report">Doanh thu</span><br>
                    <span class="count text-danger "><b>{{ number_format($total, 0, '.', ',') . ' VND' }}</b></span>
                </div>
            </a>
            <a href="" class="report-day col-md-3">
                <img src="{{ asset('img/phan-mem-tao-don-hang.png') }}" alt="">
                <div class="rp-name">
                    <span class="name-report">Đơn hàng</span><br>
                    <span style="color:#82A3A1;" class="count"><b>{{ $orders_of_day->count() }}</b></span>
                </div>
            </a>
            <a href="" class="report-day col-md-3">
                <img src="{{ asset('img/icon-line-11.png') }}" alt="">
                <div class="rp-name">
                    <span class="name-report">Khách hàng</span><br>
                    <span style="color:#1BBC9C" class="count"><b>{{ $customer->count() }}</b></span>
                </div>
            </a>
            <a href="" class="report-day col-md-3">
                <img src="{{ asset('img/thay-doi-von-dieu-le.png') }}" alt="">
                <div class="rp-name">
                    <span class="name-report">Chuyển đổi</span><br>
                    <span style="color:#1F2021" class="count"><b>0%</b></span>
                </div>
            </a>
            <div class="col-md-12" id="revenue-char">
                <h6>DOANH THU BÁN HÀNG</h6>
                <canvas id="myChart"></canvas>
            </div>
            <div id="product-selling" class="col-md-4 popular">
                <div class="pp-head">
                    <i style="color:#59A6FE" class="fa-solid fa-box"></i> Sản phẩm bán chạy
                </div>
                <div class="pp-data">
                    <img src="{{ asset('img/4076503.png') }}" alt="">
                </div>
            </div>
            <div id="product-popular" class="col-md-4 popular">
                <div class="pp-head">
                    <i style="color:#1BBC9C" class="fa-solid fa-eye"></i> Sản phẩm xu hướng
                </div>
                <div class="pp-data">
                    <img src="{{ asset('img/4076503.png') }}" alt="">
                </div>
            </div>
            <div id="top-conversion-rate" class="col-md-4 popular">
                <div class="pp-head">
                    <i class="fa-solid fa-percent text-warning"></i> Top tỉ lệ chuyển đổi
                </div>
                <div class="pp-data">
                    <img src="{{ asset('img/img(2).png') }}" alt="">
                </div>
            </div>
        </div>
        <div class="col-md-3" id="diary-activity">
            <div class="diary-item" id="diary-title"><b>NHẬT KÝ HOẠT ĐỘNG</b></div>
            @foreach ($messages as $message)
                <div class="diary-item">
                    <div class="img-diary">
                        <img src="{{ asset('img/images.jpg') }}" alt="">
                    </div>
                    <div class="diary-detail">
                        <span class="name">{{ $message->title }}</span>
                        <span class="diary-content">{{ $message->message }}</span>
                        <span class="time-send">{{ $message->created_at }}</span>
                    </div>
                </div>
            @endforeach

            <div class="diary-item see-more"><a data-bs-toggle="modal" data-bs-target="#message" href="#">Xem thêm</a>
            </div>
            <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="modalTitleId"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitleId">Danh sách thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                @foreach ($messages as $message)
                                    <div class="diary-item">
                                        <div class="img-diary">
                                            <img src="{{ asset('img/images.jpg') }}" alt="">
                                        </div>
                                        <div class="diary-detail" id="modal_message">
                                            <span class="name">{{ $message->title }}</span>
                                            <span class="diary-content">{{ $message->message }}</span>
                                            <span class="time-send">{{ $message->created_at }}</span>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('myChart');
        var today = new Date();
        var day = today.getDate();
        var month = today.getMonth() + 1;
        var year = today.getFullYear();
        var formattedDate = day + '/' + month + '/' + year;
        var pastDates = [];
        for (var i = 0; i < 5; i++) {
            var pastDate = new Date();
            pastDate.setDate(today.getDate() - i - 1);

            var pastDay = pastDate.getDate();
            var pastMonth = pastDate.getMonth() + 1;
            var pastYear = pastDate.getFullYear();

            var formattedPastDate = pastDay + '/' + pastMonth + '/' + pastYear;
            pastDates.push(formattedPastDate);
        }
        var data = @json($amounts);
        // Sử dụng biến "data" trong JavaScript
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [pastDates[4], pastDates[3], pastDates[2], pastDates[1], pastDates[0], formattedDate],
                datasets: [{
                    label: 'Doanh thu(Triệu VNĐ)',
                    data: [data[0], data[1], data[2], data[3], data[4], data[5]],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }

        });
    </script>
@endsection
