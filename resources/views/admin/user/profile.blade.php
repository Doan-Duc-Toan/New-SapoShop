@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('admin_user.show') }}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách người dùng</span></a></div>
        <br>
        <h3>#{{ $user->id }}</h3><br><br>
        <div class="col-md-12 content-detail row">
            <div class="col-md-7 row  user-info">
                <div class="col-md-12 bg-F row user-desc">
                    <div class="img-user col-md-2">
                        <img src="{{ asset('img/user-icon-2048x2048-ihoxz4vq.png') }}" alt="">
                    </div>
                    <div class="user-name col-md-10">
                        <span class="text-secondary">{{ $user->fullname }}
                            @if ($status == 'trash')
                                <b class="text-danger">(Đã hủy người dùng)</b>
                            @endif
                        </span><br>
                        <span>{{ $user->address }}</span><br>
                        <span><b>
                            @foreach ($user->roles as $role)
                              <a href="{{route('role.edit',$role->id)}}" class="badge text-secondary bg-warning">{{ucfirst($role->name)}}</a> <br>
                        @endforeach</b></span>
                    </div>
                    <div class="mb-3 col-md-12 note">
                        <label for="description" class="form-label">Ghi chú</label>
                        <textarea class="form-control" name="" id="description" disabled
                            placeholder="Nhập thông tin ghi chú về người dùng" rows="3">{{ $user->note }}</textarea>
                    </div>
                    @if ($status == 'active')
                        <div class="col-md-3">
                            <a href="{{ route('admin_user.edit', $user->id) }}" class="btn btn-primary">Cập nhật</a>
                        </div>
                    @endif
                </div>

            </div>
            <div class="col-md-3 contact row bg-F">
                <div class="col-md-12">
                    <span><b>Liên hệ</b></span><br><br>
                    <span class="email text-secondary"><b>Email:</b> {{ $user->email }}</span><br>
                    <span class="phone text-secondary"><b>SĐT:</b> {{ $user->phone }}</span><br>
                    <span class="gender text-secondary"><b>Giới tính:</b> @php
                        if ($user->gender == 'male') {
                            echo 'Nam';
                        } else {
                            echo 'Nữ';
                        }
                    @endphp</span><br>
                    <span class="birth text-secondary"><b>Ngày sinh:</b> {{ $user->birth }}</span><br>
                    <span class="address text-secondary"><b>Địa chỉ:</b> {{ $user->address }}</span>
                </div>
            </div>
            @if ($status == 'active')
                <div class="col-md-12 complete">
                    <a href="{{ route('admin_user.softdelete', $user->id) }}"
                        onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')" class="btn btn-danger">Xóa
                        người
                        dùng</a>
                </div>
            @else
                <div class="col-md-12 complete">
                    <a href="{{ route('admin_user.softdelete', $user->id) }}"
                        onclick="return confirm('Bạn có chắc chắn muốn khôi phục người dùng này?')"
                        class="btn btn-danger">Khôi phục</a>
                </div>
            @endif
        </div>
    </div>
@endsection
