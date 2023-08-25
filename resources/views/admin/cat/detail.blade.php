@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{route('cat.show')}}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách danh mục</span></a></div>
        <br>
        <h3>Chi tiết danh mục</h3><br><br>
        <div class="col-md-12 content-detail">
            <form class="" action="{{route('cat.action',$cat->id)}}" method="POST">
                @csrf
                <div class="col-md-7 row">
                    <div class="description-detail">
                        <div class="mb-3">
                            <label for="product-cat-name" class="form-label">Tên danh mục</label>
                            <input type="text" name="name" id="product-cat-name" class="form-control" placeholder=""
                                value="{{$cat->name}}" aria-describedby="helpId">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Miêu tả</label>
                            <textarea class="form-control" name="description" id="description" rows="3">{{$cat->description}}</textarea>
                        </div>
                        <div class="col-md-12 complete">
                            <button class="btn btn-danger" name="btn_act" value="delete" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?')">Xóa danh mục</button>
                            <button class="btn btn-primary" name="btn_act" value="update" >Cập nhật</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
    @endsection
