@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('admin_user.show') }}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách người dùng</span></a></div>
        <br>
        <h3>Thông tin người dùng</h3>
        <form action="{{ route('admin_user.update', $user->id) }}" method="POST" class="col-md-12 row">
            @csrf
            <div class="col-md-7 basic-info row bg-F">
                <span><b>Thông tin cơ bản</b></span>
                <div class="mb-3 col-md-6">
                    <label for="full-name" class="form-label">Họ và tên</label>
                    <input value="{{ $user->fullname }}" type="text" name="fullname" disabled id="full-name"
                        class="form-control" aria-describedby="helpId">

                </div>
                <div class="mb-3 col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" id="email" class="form-control" disabled
                        value="{{ $user->email }}" placeholder="abc@gmail.com" aria-describedby="helpId">

                </div>
                <div class="mb-3 col-md-6">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="text" name="phone" id="phone" class="form-control"
                        placeholder="Nhập số điện thoại" value="{{ $user->phone }}" aria-describedby="helpId">
                    @error('phone')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-6">
                    <label for="birth" class="form-label">Ngày sinh</label>
                    <input type="date" name="birth" id="birth" disabled value="{{ $user->birth }}"
                        class="form-control" placeholder="" aria-describedby="helpId">
                </div>
                <div class="mb-3 col-md-6">
                    <label for="gender" class="form-label">Giới tính</label>
                    <select disabled class="form-select form-select" name="gender" id="gender">
                        <option @php
if($user->gender == 'male')echo "checked"; @endphp value="male">Nam</option>
                        <option @php
if($user->gender == 'female')echo "checked"; @endphp value="female">Nữ</option>
                    </select>
                </div>
                <div class="mb-3 col-md-6">
                    <label for="role" class="form-label"><b>Quyền hệ thống</b></label>
                    <select multiple class="form-select form-select" name="roles[]" id="role">
                        @foreach ($roles as $role)
                            <option value="{{ $role->id }}"
                                @php
                                    if(in_array($role->id, $user->roles->pluck('id')->toArray())) echo "selected";
                                @endphp
                                >{{ ucfirst($role->name) }}</option>
                        @endforeach
                    </select>
                    @error('role')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3 col-md-12">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <textarea class="form-control" name="address" id="address" rows="3">{{ $user->address }}</textarea>
                    @error('address')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary" name="btn_update">Cập nhật</button>
                </div>
            </div>
            <div class="ms-5 col-md-3 mb3 bg-F">
                <label for="note" class="form-label">Ghi chú</label>
                <textarea class="form-control" placeholder="Nhập ghi chú về người dùng" name="note" id="note" rows="3">{{ $user->note }}</textarea>
                @error('note')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>
        </form>
    </div>
@endsection
