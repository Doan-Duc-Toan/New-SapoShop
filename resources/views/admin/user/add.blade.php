@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href=""><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách người dùng</span></a></div>
        <br>
        <h3>Thêm mới người dùng</h3>
        <form class="row col-md-12" action="{{ route('admin_user.store') }}" method="POST">
            @csrf
            <div class="col-md-7 basic-info row bg-F">
                <span><b>Thông tin cơ bản</b></span>
                <div class="mb-3 col-md-12">
                    <label for="full-name" class="form-label">Họ và tên <b class="text-danger">*</b></label>
                    <input type="text" name="fullname" id="full-name" class="form-control"
                        placeholder="Họ và tên người dùng" aria-describedby="helpId" value="{{old('fullname')}}">
                    @error('fullname')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="email" class="form-label">Email <b class="text-danger">*</b></label>
                    <input type="email" name="email" id="email" class="form-control" value="{{old('email')}}" placeholder="abc@gmail.com"
                        aria-describedby="helpId">
                    @error('email')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="password" class="form-label">Password <b class="text-danger">*</b></label>
                    <input type="password" name="password" id="password" class="form-control"  placeholder="password"
                        aria-describedby="helpId">
                    @error('password')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="phone" class="form-label">Số điện thoại  <b class="text-danger">*</b></label>
                    <input type="text" name="phone" id="phone" class="form-control"
                        placeholder="Nhập số điện thoại" aria-describedby="helpId" value="{{old('phone')}}">
                    @error('phone')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="birth" class="form-label">Ngày sinh <b class="text-danger">*</b></label>
                    <input type="date" name="birth" id="birth" class="form-control" placeholder=""
                        aria-describedby="helpId" value="{{old('birth')}}">
                    @error('birth')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="gender" class="form-label">Giới tính <b class="text-danger">*</b></label>
                    <select class="form-select form-select" name="gender" id="gender">
                        <option selected value="male">Nam</option>
                        <option value="female">Nữ</option>
                    </select>
                    @error('gender')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="role" class="form-label"><b>Quyền hệ thống</b></label>
                    <select multiple class="form-select form-select" name="roles[]" id="role">
                        @foreach ($roles as $role)
                            <option value="{{$role->id}}">{{ucfirst($role->name)}}</option>
                        @endforeach
                    </select>
                    @error('role')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-12">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <textarea class="form-control" name="address" id="address" rows="3">{{old('address')}}</textarea>
                    @error('address')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <button class="mt-3 col-md-2 btn btn-primary" name="btn_add" value="add">Thêm mới</button>
            </div>
            <div class="ms-5 col-md-3 mb3 bg-F">
                <label for="note" class="form-label">Ghi chú</label>
                <textarea class="form-control" placeholder="Nhập ghi chú về người dùng" name="note" id="note"
                    rows="3">{{old('note')}}</textarea>
                @error('note')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>
        </form>
    </div>
@endsection
