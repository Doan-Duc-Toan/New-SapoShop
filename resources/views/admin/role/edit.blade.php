@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="title col-md-12">
            <h3>Thêm mới vai trò</h3>
        </div>
        <div class="main-content bg-F row col-md-7">
            <form action="{{ route('role.update',$role->id) }}" method="POST">
                @csrf
                <div class="mb-3">
                    <label for="name-role" class="form-label">Tên vai trò</label>
                    <input type="text" name="name" id="name-role" class="form-control" placeholder="Nhập tên vai trò"
                        aria-describedby="helpId" value="{{ $role->name }}">
                    @error('name')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả</label>
                    <textarea class="form-control" name="description" id="description" rows="3"
                        placeholder="Nhập mô tả chi tiết về vai trò">{{ $role->description }}</textarea>
                    @error('description')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <span><b>Vai trò này có quyền gì?</b></span><br>
                <small class="text-secondary">Check vào module hoắc các hành động bên dưới để chọn
                    quyền</small><br><br>

                @foreach ($permissions as $module => $permissions_in_module)
                    <div class="module col-md-12 mb-4 bg-F row">
                        <div class="form-check mb-3 col-md-12">
                            <input class="form-check-input check-all" type="checkbox" value=""
                                id="module-{{ $module }}" name="checkall">
                            <label class="form-check-label" for="module-{{ $module }}"
                                style="text-transform: uppercase">
                                <b>Module {{ $module }}</b>
                            </label>
                        </div>
                        <div class="module-item col-md-12 row">
                            @foreach ($permissions_in_module as $permission)
                                <div class="form-check col-md-4">
                                    <input class="form-check-input permission" type="checkbox" name="permissions[]"
                                        value="{{ $permission->id }}" id="{{ $permission->id }}"
                                        @php
if (in_array($permission->id, $role->permissions->pluck('id')->toArray())) echo "checked"; @endphp>
                                    <label class="form-check-label"
                                        for="{{ $permission->id }}">{{ $permission->name }}</label>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endforeach


                <button class="btn btn-primary" name="btn_update">Cập nhật</button>

            </form>

        </div>
    </div>
@endsection
