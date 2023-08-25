@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('dashboard') }}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Trang chủ</span></a></div>
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
                        </span><br>
                        <span>{{ $user->address }}</span><br>
                        <span><b>
                                @foreach ($user->roles as $role)
                                    <a href="{{ route('role.edit', $role->id) }}"
                                        class="badge text-secondary bg-warning">{{ ucfirst($role->name) }}</a> <br>
                                @endforeach
                            </b></span>
                    </div>
                </div>
                <form class="row col-md-12" action="{{ route('reset_password') }}" method="POST">
                    @csrf
                    <div class="col-md-12 basic-info row bg-F">
                        <span><b>Thông tin cơ bản</b></span>
                        <div class="mb-3 col-md-12">
                            <label for="full-name" class="form-label">Họ và tên <b class="text-danger">*</b></label>
                            <input type="text" name="fullname" id="full-name" class="form-control"
                                aria-describedby="helpId" value="{{ $user->fullname }}" disabled>
                        </div>
                        <div class="mb-3 col-md-6">
                            <label for="email" class="form-label">Email <b class="text-danger">*</b></label>
                            <input type="email" name="email" id="email" class="form-control"
                                value="{{ $user->email }}" disabled>

                        </div>
                        <div class="mb-3 col-md-6">
                            <label for="phone" class="form-label">Số điện thoại <b class="text-danger">*</b></label>
                            <input type="text" name="phone" id="phone" class="form-control"
                                placeholder="Nhập số điện thoại" aria-describedby="helpId" disabled
                                value="{{ $user->phone }}">
                        </div>
                        <div class="mb-3 col-md-6">
                            <label for="birth" class="form-label">Ngày sinh <b class="text-danger">*</b></label>
                            <input type="date" name="birth" id="birth" class="form-control" placeholder=""
                                aria-describedby="helpId" disabled value="{{ $user->birth }}">
                        </div>
                        <div class="mb-3 col-md-6">
                            <label for="gender" class="form-label">Giới tính <b class="text-danger">*</b></label>
                            <select class="form-select form-select" disabled name="gender" id="gender">
                                <option @php
if($user->gender == 'male') echo "selected"; @endphp value="male">Nam
                                </option>
                                <option @php
if($user->gender == 'female') echo "selected"; @endphp value="female">Nữ
                                </option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="note" class="form-label">Ghi chú</label>
                            <textarea disabled class="form-control" placeholder="Không có" name="note" id="note" rows="3">{{ old('note') }}</textarea>
                        </div>
                        <div class="mb-3 col-md-6">
                            <label for="address" class="form-label">Địa chỉ</label>
                            <textarea class="form-control" disabled name="address" id="address" rows="3">{{ $user->address }}</textarea>
                        </div>
                        <div class="col-md-12 row">
                            <h4>Đổi mật khẩu <b class="text-danger">*</b></h4>
                            <div class="mb-3 col-md-12">
                                <label for="" class="form-label">Mật khẩu cũ</label>
                                <input type="password" class="form-control" name="old_password" id="">
                            </div>
                            <div class="mb-3 col-md-12">
                                <label for="" class="form-label">Mật khẩu mới</label>
                                <input type="password" class="form-control" name="re_password" id="">
                            </div>
                            @error('re_password')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                            <div class="mb-3 col-md-12">
                                <label for="" class="form-label">Nhập lại mật khẩu mới</label>
                                <input type="password" class="form-control" name="password_confirmation" id="">
                            </div>
                            @error('password_confirmation')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <button class="mt-3 col-md-2 btn btn-primary" name="btn_update" value="add">Cập nhật</button>
                    </div>
                </form>

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
        </div>
    </div>
@endsection
