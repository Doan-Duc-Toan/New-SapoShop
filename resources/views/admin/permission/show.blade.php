@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{route('role.show')}}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách vai trò</span></a></div>
        <br><br>
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="col-md-12 row content-detail">
            <form class="col-md-3 bg-F p-3" action="{{ route('permission.store') }}" method="POST">
                @csrf
                <h4>Thêm quyền</h4><br>
                <div class="form-group">
                    <label for="permission-name"><b>Tên quyền</b></label>
                    <input type="text" id="permission-name" class="form-control" value="{{ old('name') }}"
                        placeholder="Nhập tên quyền" name="name" aria-describedby="helpId">
                    @error('name')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div><br>

                <div class="form-group">
                    <label for="permission-slug"><b>Slug</b></label>
                    <input type="text" id="permission-slug" name="slug" class="form-control"
                        placeholder="Nhập slug cho quyền" value="{{old('slug')}}" aria-describedby="helpId">
                    @error('slug')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div><br>
                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả</label>
                    <textarea class="form-control" placeholder="Nhập mô tả cho quyền" name="description" id="description" rows="3">{{old('description')}}</textarea>
                    @error('description')
                        <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
                <button class="btn btn-primary" name="btn btn_add">Thêm mới</button>
            </form>
            <div class="ms-5 bg-F col-md-8 list-permission">
                <h4>Danh sách các quyền trong hệ thống</h4><br>
                <div class="table-responsive" style ="overflow:scroll; max-height:100vh;">
                    <table
                        class="table table-striped
                table-hover	
                table-borderless
                table-primary
                align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Tên quyền</th>
                                <th>Slug</th>
                                <th>Tác vụ</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            @foreach ($permissions as $module => $permissions_in_module)
                                <tr class="table-primary">
                                    <td colspan="4"><b>Module {{ $module }}</b></td>
                                </tr>
                                @foreach ($permissions_in_module as $permission)
                                    <tr class="">
                                        <td scope="row">{{ $permission->id }}</td>
                                        <td>{{ $permission->name }}</td>
                                        <td>{{ $permission->slug }}</td>
                                        <td>
                                            <div class="action">
                                                <a href="{{ route('permission.edit', $permission->id) }}"
                                                    class="edit bg-danger"><i class="fa-solid fa-pen-to-square"></i></a>
                                                <a href="{{route('permission.delete', $permission->id)}}" class="delete bg-success"
                                                    onclick="return confirm('Bạn có chắc chắn muốn xóa quyền này?')"><i
                                                        class="fa-solid fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            @endforeach

                        </tbody>
                        <tfoot>

                        </tfoot>
                    </table>
                </div>

            </div>

        </div>
    </div>
@endsection
