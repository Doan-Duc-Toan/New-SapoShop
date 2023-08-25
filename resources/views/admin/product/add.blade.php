@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-md-12"><a class="back" href="{{ route('product.show') }}"><span class="text-secondary"><i
                        class="fa-solid fa-backward"></i>Danh sách sản
                    phẩm</span></a></div>
        <br>
        <h3>Thêm sản phẩm</h3><br><br>
        <div class="col-md-12 content-detail">
            <form class="row" action="{{ route('product.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="col-md-7 row">
                    <div class="description-detail">
                        <div class="mb-3">
                            <label for="product-name" class="form-label">Tên sản phẩm</label>
                            <input type="text" name="name" id="product-name" class="form-control"
                                placeholder="Nhập tên sản phẩm" value="{{ old('name') }}" aria-describedby="helpId">
                            @error('name')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Miêu tả</label>
                            <textarea class="form-control" name="description" placeholder="Nhập mô tả về sản phẩm" id="description" rows="20">{{ old('description') }}</textarea>
                            @error('description')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-12 img-product">
                        <span>Ảnh sản phẩm</span>
                        <div class="mb-3">
                            <input multiple type="file" class="form-control" name="files[]" id="img-thumb"
                                placeholder="">
                            @error('files')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-12 version row">
                        <span><b>Phiên bản</b></span><br>
                        {{-- <div class="col-md-6 form-group">
                            <label for="count" class="">Số lượng</label>
                            <input type="number" id="count" class="form-control" value="{{ old('count') }}"
                                name="count" min="0">
                            @error('count')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div> --}}
                        <div class="col-md-6 form-group">
                            <label for="price" class="">Giá một sản phẩm (đ)</label>
                            <input type="text" id="price" class="form-control" value="{{ old('price') }}"
                                name="price" value="">
                            @error('price')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>


                        <div class="mt-3 col-md-12 form-group">
                            <label for="color" class="form-label">Màu sắc</label>
                            <select class="form-select form-select" multiple name="colors[]" id="color">
                                @foreach ($colors as $color)
                                    <option value="{{ $color->id }}">{{ $color->name }}</option>
                                @endforeach
                            </select>
                            @error('colors')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <small><a href="" data-bs-toggle="modal" data-bs-target="#add_color">Thêm màu sắc
                                mới</a></small>
                        <div class="row col-md-12 btn-update-version-now">
                            <div class="col-md-3">
                                <button class="btn btn-primary" name="btn_add">Thêm mới</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-3 classify">
                    <span><b>Phân loại</b></span>
                    <div class="mb-3">
                        <label for="type" class="form-label">Loại</label>
                        <input type="text" name="type" id="type" class="form-control"
                            value="{{ old('type') }}" placeholder="Nhập loại cho sản phẩm" aria-describedby="helpId">
                        @error('type')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label for="supplier" class="form-label">Nhà cung cấp</label>
                        <input type="text" name="supplier" id="supplier" class="form-control"
                            value="{{ old('supplier') }}" placeholder="Nhập tên nhà cung cấp" aria-describedby="helpId">
                        @error('supplier')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label for="cat-product" class="form-label">Danh mục</label>
                        <select class="form-select form-select" multiple name="cats[]" id="">
                            @foreach ($cats as $cat)
                                <option value="{{ $cat->id }}">{{ ucfirst($cat->name) }}</option>
                            @endforeach
                        </select>
                        @error('cats')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label for="specifications" class="form-label">Thông số kỹ thuật</label>
                        <textarea name="specifications" class="form-control" placeholder="Nhập thông số kỹ thuật cho sản phẩm"
                            id="specifications" cols="" rows="30"></textarea>
                        @error('specifications')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    {{-- <div class="mb-3">
                        <label for="salient_features" class="form-label">Đặc điểm nổi bật</label>
                        <textarea name="salient_features" id="salient_features" placeholder="Nhập đặc điểm nổi bật của sản phẩm" class="form-control" cols="" rows="10"></textarea>
                        @error('type')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div> --}}
                </div>
            </form>
        </div>
        <div class="modal fade" id="add_color" tabindex="-1" role="dialog" aria-labelledby="modalTitleId"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitleId">Thêm màu sắc mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="{{ route('product.store') }}" method="POST">
                        @csrf
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="mb-3">
                                    <input type="text" name="color" id="color" class="form-control"
                                        placeholder="Nhập màu sắc cần thêm" aria-describedby="helpId">
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <span class="btn btn-secondary" data-bs-dismiss="modal">Hủy</span>
                            <button class="btn btn-primary" name="btn_add_color" value="add_color">Thêm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--<script src="https://<hostname.tld>/tinymce.min.js" referrerpolicy="origin"></script>-->
    <script src="https://cdn.tiny.cloud/1/zv8smycynpxe65kgxso06aogcisyy9so3bx4r99svhe4vrqm/tinymce/5/tinymce.min.js"
        referrerpolicy="origin"></script>
    <script>
        var modalId = document.getElementById('modalId');

        modalId.addEventListener('show.bs.modal', function(event) {
            // Button that triggered the modal
            let button = event.relatedTarget;
            // Extract info from data-bs-* attributes
            let recipient = button.getAttribute('data-bs-whatever');

            // Use above variables to manipulate the DOM
        });
    </script>
    <script>
        var editor_config = {
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
        tinymce.init(editor_config);
    </script>
    <script>
        var editor_configs = {
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
        tinymce.init(editor_configs);
    </script>
@endsection
