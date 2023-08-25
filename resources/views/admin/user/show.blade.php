@extends('admin.layout')
@section('content')

    <div class="row">
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="title col-md-12">
            <h3>Danh sách người dùng hệ thống</h3>
        </div>
        <div class="main-content row col-md-12">

            <ul class="status col-md-12 d-flex">
                 <li class="status-item all"><a href="{{ request()->fullurlWithQuery(['status' => 'active']) }}"
                        class="text-secondary @php
if($status == 'active') echo "list-active"; @endphp">Tất cả người dùng</a>
                </li>
                <li class="status-item all  @php
if($status == 'trash') echo "list-active"; @endphp"><a
                        href="{{ request()->fullurlWithQuery(['status' => 'trash']) }}" class="text-secondary">Người dùng đã
                        xóa</a></li>
            </ul>
            <div id="status" data-name="{{ $status }}"></div>

            @if ($users->count() > 0)
                <div class="custom col-md-12 row p-3">
                    <div class="custom-item first col-md-2">Tìm kiếm
                    </div>
                    <div class="search custom-item col-md-6 row">
                        <button class="col-md-1"><i class="fa-solid fa-magnifying-glass"></i></button>
                        <input class="col-md-11" type="text" name="search" placeholder="Tìm kiếm người dùng">
                        <div id="countryList" class="col-md-12"><br>
                        </div>
                    </div>
                    <!--<form action="{{ route('admin_user.arrange', ["&status=$status"]) }}" class="col-md-2 row" method="POST">-->
                    <!--    @csrf-->
                        <!--<div class="custom-item arrange col-md-12"><span><i-->
                        <!--            class="fa-solid fa-arrow-down-wide-short"></i></span>-->
                        <!--    <div class="custom-detail">-->
                        <!--        <div class="form-check">-->
                        <!--            <input class="form-check-input" type="radio" name="arrange" value="name"-->
                        <!--                id="day-reduce" checked>-->
                        <!--            <label class="form-check-label" for="day-reduce">-->
                        <!--                Tên (A-Z)-->
                        <!--            </label>-->
                        <!--        </div>-->
                        <!--        <div class="form-check">-->
                        <!--            <input class="form-check-input" type="radio" name="arrange" value="role"-->
                        <!--                id="day-inc">-->
                        <!--            <label class="form-check-label" for="day-inc">-->
                        <!--                Quyền-->
                        <!--            </label>-->
                        <!--        </div>-->
                        <!--        <button class="btn btn-secondary" class="btn_arrange">Lọc</button>-->
                        <!--    </div>-->
                        <!--</div>-->
                    <!--</form>-->

                </div>
                <div class="col-md-12 mb-3">
                    <form action="{{ route('admin_user.action') }}" method="POST">
                        @csrf
                        <div class="manipulation d-flex">
                            <select class="form-select form-select-sm" name="act" id="">
                                <option value="">Chọn thao tác</option>
                                @foreach ($acts as $key => $act)
                                    <option value="{{ $key }}">{{ $act }}</option>
                                @endforeach
                            </select>
                            <button class="btn btn-secondary" name="btn_act">Thực hiện</button>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-secondary">
                                <thead>
                                    <tr>
                                        <th scope="col"><input type="checkbox" name="checkall"
                                                class="check-all form-check-input">
                                        </th>
                                        <th scope="col">Id</th>
                                        <th scope="col">Họ và tên</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Điện thoại</th>
                                        <th scope="col">Giới tính</th>
                                        <th scope="col">Tác vụ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($users as $user)
                                        <tr class="">
                                            <td scope="row">
                                                <div><input type="checkbox" name="list_check[]" value="{{ $user->id }}"
                                                        class="form-check-input check">
                                                </div>
                                            </td>
                                            <td>
                                                <div><span>{{ $user->id }}</span></div>
                                            </td>
                                            <td><a class="info-intro"
                                                    href="{{ route('admin_user.profile', [$user->id, "&status=$status"]) }}"><span
                                                        class="">{{ $user->fullname }}</span></a></td>
                                            <td>
                                                <div><span>{{ $user->email }}</span></div>
                                            </td>
                                            <td>
                                                <div><span>{{ $user->phone }}</span></div>
                                            </td>
                                            <td>
                                                <div>
                                                    <span>@php
                                                        if($user->gender =='male')echo "Nam";
                                                        else echo "Nữ";
                                                      @endphp</span>
                                                    </div>
                                            </td>
                
                                            <td class="">
                                                <div class="action">
                                                    @if ($status == 'trash')
                                                        <a href="{{ route('admin_user.restore', $user->id) }}"
                                                            class="edit bg-danger"
                                                            onclick="return confirm('Bạn có chắc chắn muốn khôi phục người dùng này?')"><i
                                                                class="fa-solid fa-pen-to-square"></i></a>
                                                        <a href="{{ route('admin_user.force_delete', $user->id) }}"
                                                            onclick="return confirm('Bạn có chắc chắn muốn xóa vĩnh viễn người dùng này?')"
                                                            class="delete bg-success"><i class="fa-solid fa-trash"></i></a>
                                                    @else
                                                        <a href="{{ route('admin_user.edit', $user->id) }}"
                                                            class="edit bg-danger"><i
                                                                class="fa-solid fa-pen-to-square"></i></a>
                                                        <a href="{{ route('admin_user.softdelete', $user->id) }}"
                                                            onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')"
                                                            class="delete bg-success"><i class="fa-solid fa-trash"></i></a>
                                                    @endif
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach

                                </tbody>
                            </table>

                            {{ $users->links('pagination::bootstrap-5') }}
                        </div>
                    @else
                        <h3 class="text-danger">Không có người dùng nào</h3>
            @endif

        </div>
        </form>

    </div>
    </div>
    <script>
        $(document).ready(function() {
            $(".search input").keyup(function() {
                var query = $(this).val();
                var status = $('#status').data('name');
                if (query != '') {
                    $.ajax({
                        type: 'GET',
                        url: "{{ route('admin_user.search_ajax') }}",
                        data: {
                            query: query,
                            status: status
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
