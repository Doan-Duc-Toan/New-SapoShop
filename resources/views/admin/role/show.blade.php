@extends('admin.layout')
@section('content')
    <div class="row">
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="title col-md-12">
            <h3>Danh sách vai trò</h3>
        </div>
        <div class="main-content row col-md-12">
            <ul class="status col-md-12 d-flex">
                <li class="status-item all"><a href="" class="text-secondary list-active">Tất cả vai trò</a></li>
            </ul>
                <div class="col-md-12" id="table-order">
                    <div class="table-responsive">
                        <table class="table table-secondary">
                            <thead>
                                <tr>                             
                                    <th scope="col">#</th>
                                    <th scope="col">Vai trò</th>
                                    <th scope="col">Mô tả</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Tác vụ</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($roles as $role)
                                    <tr class="">
                                        <td scope="row">
                                            <div>{{$role->id}}</div>
                                        </td>
                                        <td><div><a class="info-intro" href="{{route('role.edit',$role->id)}}"><span>{{ucfirst($role->name)}}</span></a></div></td>
                                        <td>
                                            <div><span>{{$role->description}}</span></div>
                                        </td>
                                        <td>
                                            <div><span>{{$role->created_at}}<span></div>
                                        </td>
                                        <td class="">
                                            <div class="action">
                                                <a href="{{route('role.edit',$role->id)}}" class="edit bg-danger"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>
                                                <a href="{{route('role.delete',$role->id)}}" onclick="return confirm('Bạn có chắc chắn muốn xóa vai trò này?')" class="delete bg-success"><i
                                                        class="fa-solid fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        
                    </div>

                </div>

        </div>
    </div>
@endsection
