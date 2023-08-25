@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{route('cat.show')}}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách danh mục</span></a></div>
        <br>
        <h3>Thêm danh mục</h3><br><br>
        <div class="col-md-12 content-detail">
            <form class="" action="{{ route('cat.store') }}" method="POST">
                @csrf
                <div class="col-md-7 row">
                    <div class="description-detail">
                        <div class="mb-3">
                            <label for="product-cat-name" class="form-label">Tên danh mục</label>
                            <input type="text" name="name" id="product-cat-name" class="form-control"
                                placeholder="Nhập tên danh mục" value="" aria-describedby="helpId">
                            @error('name')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Miêu tả</label>
                            <textarea class="form-control" name="description" id="description" rows="3" placeholder="Nhập mô tả"></textarea>
                            @error('name')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-primary" name="btn_add">Thêm danh mục</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
@endsection
