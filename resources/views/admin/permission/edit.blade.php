@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{route('permission.show')}}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách quyền</span></a></div>
        <br><br>
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="col-md-12 row content-detail">
            <form class="col-md-4 bg-F" style="padding: 15px !important" action="{{ route('permission.update',$permission->id) }}" method="POST">
                @csrf
                <h4>Chỉnh sửa quyền</h4><br>
                <div class="form-group">
                    <label for="permission-name"><b>Tên quyền</b></label>
                    <input type="text" id="permission-name" class="form-control" placeholder="Nhập tên quyền" value="{{$permission->name}}"
                        name="name" aria-describedby="helpId">
                    @error('name')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div><br>

                <div class="form-group">
                    <label for="permission-slug"><b>Slug</b></label>
                    <input type="text" id="permission-slug" name="slug" class="form-control"
                        placeholder="Nhập slug cho quyền" value="{{$permission->slug}}" aria-describedby="helpId">
                    @error('slug')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div><br>
                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả</label>
                    <textarea class="form-control" placeholder="Nhập mô tả cho quyền" name="description" id="description" rows="3">{{$permission->description}}</textarea>
                    @error('description')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <button class="btn btn-primary" name="btn btn_update" value="update">Cập nhật</button>
            </form>
        </div>
    </div>
@endsection
