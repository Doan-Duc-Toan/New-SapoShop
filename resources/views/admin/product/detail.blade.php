@extends('admin.layout')
@section('content')
    @if (session('status'))
        <div class="alert alert-success col-md-12">
            {{ session('status') }}
        </div>
    @endif
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('product.show') }}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách sản
                    phẩm</span></a></div>
        <br>
        <h3>Chi tiết sản phẩm #{{ $product->id }}</h3><br><br>
        <div class="col-md-12 content-detail">
            <form class="row" action="{{ route('product.action', $product->id) }}" method="POST"
                enctype="multipart/form-data">
                @csrf
                <div class="col-md-7 row">
                    <div class="description-detail">
                        <div class="mb-3">
                            <label for="product-name" class="form-label">Tên sản phẩm</label>
                            <input type="text" name="name" id="product-name" class="form-control" placeholder=""
                                value="{{ $product->name }}">
                            @error('name')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Miêu tả</label>
                            <textarea class="form-control" name="description" id="description" rows="20">{{ $product->description }}</textarea>
                            @error('description')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-12 img-product">
                        <span>Ảnh sản phẩm</span>
                        <div class="mb-3">
                            <input type="file" multiple class="form-control" name="files[]" id="img-thumb" placeholder=""
                                aria-describedby="fileHelpId">
                        </div>
                        <div class="list-img-product row">
                            @foreach ($product->thumbs as $thumb)
                                <div class="col-md-4 row">
                                    <div class="col-md-12 img-thumb mt-3">
                                        <a href="{{ route('thumb.delete', $thumb->id) }}" class="xthumb">X</a>
                                        <img src="{{ asset($thumb->link) }}" alt="">
                                    </div>
                                    <div class="col-md-12 mt-3">
                                        <select class="form-select form-select" name="thumb_colors[]" id="">
                                            <option value="">Chọn màu sắc</option>
                                            @foreach ($product->colors as $color)
                                                <option value="{{ $thumb->id }},{{ $color->id }}"
                                                    @php
if(!empty($thumb->color->id))
                                                    if($color->id == $thumb->color->id) echo 'selected'; @endphp>
                                                    {{ $color->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="col-md-12 version row">
                        <span><b>Phiên bản</b></span><br>
                        {{-- <div class="col-md-6 form-group">
                            <label for="count" class="">Số lượng</label>
                            <input type="text" id="count" name="count" class="form-control"
                                value="{{ $product->count }}" min="0">
                            @error('count')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div> --}}
                        <div class="col-md-6 form-group">
                            <label for="price" class="">Giá một sản phẩm (đ)</label>
                            <input type="text" id="price" class="form-control" name="price"
                                value="{{ $product->price }}">
                            @error('price')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="mb-3 mt-3 col-md-12">
                            <label for="cat-product" class="form-label">Màu sắc</label>
                            <select class="form-select form-select" multiple name="colors[]" id="">
                                @foreach ($colors as $color)
                                    <option value="{{ $color->id }}"
                                        @php
if(in_array($color->id, $product->colors->pluck('id')->toArray())) echo "selected"; @endphp>
                                        {{ $color->name }}</option>
                                @endforeach
                            </select>
                            @error('colors')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class=" col-md-12 table-version">
                            <div class="table-responsive">
                                <table
                                    class="table table-striped
                            table-hover	
                            table-borderless
                            table-primary
                            align-middle">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Màu sắc</th>
                                            <th>Số lượng</th>
                                            <th>Giá sản phẩm</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        @foreach ($product->colors as $color)
                                            <tr class="table-primary">
                                                <td><input type="" class="form-control" disabled
                                                        name="product_color[{{ $color->id }}][color]"
                                                        value="{{ $color->name }}">
                                                </td>
                                                <td><input type="number" min="0" class="form-control"
                                                        name="product_color[{{ $color->id }}][count]"
                                                        value="{{ $color->pivot->count }}">
                                                </td>
                                                <td><input type="text" disabled class="form-control"
                                                        value="{{ $product->price }}đ"></td>
                                            </tr>
                                        @endforeach

                                    </tbody>
                                    <tfoot>

                                    </tfoot>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 classify">
                    <span><b>Phân loại</b></span>
                    <div class="mb-3">
                        <label for="type" class="form-label">Loại</label>
                        <input type="text" name="type" id="type" class="form-control"
                            value="{{ $product->type }}" placeholder="" aria-describedby="helpId">
                        @error('type')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label for="supplier" class="form-label">Nhà cung cấp</label>
                        <input type="text" name="supplier" id="supplier" class="form-control"
                            value="{{ $product->supplier }}" placeholder="" aria-describedby="helpId">
                        @error('supplier')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label for="cat-product" class="form-label">Danh mục</label>
                        <select class="form-select form-select" multiple name="cats[]" id="">
                            @foreach ($cats as $cat)
                                <option value="{{ $cat->id }}"
                                    @php
if(in_array($cat->id, $product->cats->pluck('id')->toArray())) echo "selected"; @endphp>
                                    {{ $cat->name }}</option>
                            @endforeach
                        </select>
                        @error('cats')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label for="specifications" class="form-label">Thông số kỹ thuật</label>
                        <textarea name="specifications" class="form-control" placeholder="Nhập thông số kỹ thuật cho sản phẩm"
                            id="specifications" cols="" rows="30">{{ $product->specifications }}</textarea>
                        @error('specifications')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    {{-- <div class="mb-3">
                        <label for="salient_features" class="form-label">Đặc điểm nổi bật</label>
                        <textarea name="salient_features" id="salient_features" placeholder="Nhập đặc điểm nổi bật của sản phẩm"
                            class="form-control" cols="" rows="10">{{ $product->salient_features }}</textarea>
                        @error('type')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div> --}}
                </div>
                <div class="col-md-12 complete">
                    <button class="btn btn-danger" name="btn_act" value="delete"
                        onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa sản phẩm</button>
                    <button class="btn btn-primary" name="btn_act" value="update">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
    <script src="https://<hostname.tld>/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="https://cdn.tiny.cloud/1/zv8smycynpxe65kgxso06aogcisyy9so3bx4r99svhe4vrqm/tinymce/5/tinymce.min.js"
        referrerpolicy="origin"></script>
    <script>
        var editor_config = {
            path_absolute: "https://ductoan.unitopcv.com/",
            selector: 'textarea#description',
            relative_urls: false,
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table directionality",
                "emoticons template paste textpattern"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
            file_picker_callback: function(callback, value, meta) {
                var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName(
                    'body')[0].clientWidth;
                var y = window.innerHeight || document.documentElement.clientHeight || document
                    .getElementsByTagName('body')[0].clientHeight;

                var cmsURL = editor_config.path_absolute + 'laravel-filemanager?editor=' + meta.fieldname;
                if (meta.filetype == 'image') {
                    cmsURL = cmsURL + "&type=Images";
                } else {
                    cmsURL = cmsURL + "&type=Files";
                }

                tinyMCE.activeEditor.windowManager.openUrl({
                    url: cmsURL,
                    title: 'Filemanager',
                    width: x * 0.8,
                    height: y * 0.8,
                    resizable: "yes",
                    close_previous: "no",
                    onMessage: (api, message) => {
                        callback(message.content);
                    }
                });
            }
        };
        tinymce.init(editor_config);

        var editor_configs = {
            path_absolute: "https://ductoan.unitopcv.com/",
            selector: 'textarea#specifications',
            relative_urls: false,
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table directionality",
                "emoticons template paste textpattern"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
            file_picker_callback: function(callback, value, meta) {
                var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName(
                    'body')[0].clientWidth;
                var y = window.innerHeight || document.documentElement.clientHeight || document
                    .getElementsByTagName('body')[0].clientHeight;

                var cmsURL = editor_config.path_absolute + 'laravel-filemanager?editor=' + meta.fieldname;
                if (meta.filetype == 'image') {
                    cmsURL = cmsURL + "&type=Images";
                } else {
                    cmsURL = cmsURL + "&type=Files";
                }

                tinyMCE.activeEditor.windowManager.openUrl({
                    url: cmsURL,
                    title: 'Filemanager',
                    width: x * 0.8,
                    height: y * 0.8,
                    resizable: "yes",
                    close_previous: "no",
                    onMessage: (api, message) => {
                        callback(message.content);
                    }
                });
            }
        };
        tinymce.init(editor_configs);
    </script>
@endsection
