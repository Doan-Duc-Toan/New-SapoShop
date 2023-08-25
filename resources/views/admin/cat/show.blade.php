@extends('admin.layout')
@section('content')
    <div class="row">
        @if (session('status'))
            <div class="alert alert-success col-md-12">
                {{ session('status') }}
            </div>
        @endif
        <div class="title col-md-12">
            <h3>Danh sách danh mục</h3>
        </div>
        <div class="main-content row col-md-12">
            <ul class="status col-md-12 d-flex">
                <li class="status-item all"><a href="" class="text-primary">Tất cả danh mục</a></li>
                <li class="status-item all"><a href="{{route('cat.add')}}" class="text-primary">Thêm danh mục</a></li>
            </ul>
            <div class="col-md-12" id="table-order">
                <div class="table-responsive">
                    <table class="table table-secondary">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Danh mục</th>
                                <th scope="col">Điều kiện</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($cats as $cat)
                                <tr class="">
                                    <td scope="row">
                                        <div>{{ $cat->id }}</div>
                                    </td>
                                    <td>
                                        <div><a href="{{ route('cat.detail', $cat->id) }}">{{ $cat->name }}</a></div>
                                    </td>
                                    <td>
                                        <textarea disabled class="form-control" name="" id="" cols="30" rows="0">{{ $cat->description }}</textarea>
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
