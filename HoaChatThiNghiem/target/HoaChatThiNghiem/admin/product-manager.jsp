<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm | Quản trị Admin</title>

    <!-- ===== STYLESHEET ===== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<body class="app sidebar-mini rtl">
<%--    Header--%>
<jsp:include page="../common/admin-header.jsp"/>

<!-- Sidebar Menu -->
<jsp:include page="../common/admin-sidebar-menu.jsp"/>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row element-button">
                            <div class="col-sm-2">
                                <a class="btn btn-add btn-sm" href="form-add-product.jsp" title="Thêm"><i class="fas fa-plus"></i> Tạo mới sản phẩm</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i class="fas fa-print"></i> In dữ liệu</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)"><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                            </div>
                            <div class="col-sm-2">
                                <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i> Xóa tất cả </a>
                            </div>
                        </div>
                        <!-- Search -->
                        <div class="search-bar d-flex justify-content-between my-3">
                            <div class="d-flex align-items-center">
                                <span class="status">Hiện <span class="quantity">10</span> danh mục</span>
                            </div>
                            <div class="search-wrap">
                                <label class="font-weight-bold m-0" for="search">Tìm kiếm: </label>
                                <input type="text" placeholder="" id="search">
                                <label for="by" class="font-weight-bold m-0 ml-3">Theo: </label>
                                <select id="by">
                                    <option>ID</option>
                                    <option>Tên</option>
                                </select>
                            </div>
                        </div>
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th width="10"><input type="checkbox" id="all"></th>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Số lượng</th>
                                    <th>Tình trạng</th>
                                    <th>Giá tiền</th>
                                    <th>Danh mục</th>
                                    <th>Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>71309005</td>
                                    <td>Bàn ăn gỗ Theresa</td>
                                    <td><img src="https://images.pexels.com/photos/2280571/pexels-photo-2280571.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>40</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>5.600.000đ</td>
                                    <td>Bàn ăn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>61304005</td>
                                    <td>Bàn ăn Reno mặt đá</td>
                                    <td><img src="https://images.pexels.com/photos/1366942/pexels-photo-1366942.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>70</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>24.200.000đ</td>
                                    <td>Bàn ăn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>62304003</td>
                                    <td>Bàn ăn Vitali mặt đá</td>
                                    <td><img src="https://images.pexels.com/photos/2280549/pexels-photo-2280549.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>40</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>33.235.000đ</td>
                                    <td>Bàn ăn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>72638003</td>
                                    <td>Ghế ăn gỗ Theresa</td>
                                    <td><img src="https://images.pexels.com/photos/248152/pexels-photo-248152.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>50</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>950.000đ</td>
                                    <td>Ghế gỗ</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>72109004</td>
                                    <td>Ghế làm việc Zuno</td>
                                    <td><img src="https://images.pexels.com/photos/954585/pexels-photo-954585.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>50</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>3.800.000đ</td>
                                    <td>Ghế gỗ</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>82716001</td>
                                    <td>Ghế ăn Vitali</td>
                                    <td><img src="https://images.pexels.com/photos/1366944/pexels-photo-1366944.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>55</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>4.600.000đ</td>
                                    <td>Ghế gỗ</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>72109001</td>
                                    <td>Ghế ăn gỗ Lucy màu trắng</td>
                                    <td><img src="https://images.pexels.com/photos/3082451/pexels-photo-3082451.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>38</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>1.100.000đ</td>
                                    <td>Ghế gỗ</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>71304041</td>
                                    <td>Bàn ăn mở rộng Vegas</td>
                                    <td><img src="https://images.pexels.com/photos/954583/pexels-photo-954583.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>80</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>21.550.000đ</td>
                                    <td>Bàn thông minh</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>71304037</td>
                                    <td>Bàn ăn mở rộng Gepa</td>
                                    <td><img src="https://images.pexels.com/photos/3938022/pexels-photo-3938022.jpeg?auto=compress&cs=tinysrgb&w=600" alt="" width="100px;"></td>
                                    <td>80</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>16.770.000đ</td>
                                    <td>Bàn thông minh</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>71304032</td>
                                    <td>Bàn ăn mặt gốm vân đá Cera</td>
                                    <td><img src="https://images.pexels.com/photos/9243254/pexels-photo-9243254.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>46</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>20.790.000đ</td>
                                    <td>Bàn thông minh</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>71338008</td>
                                    <td>Bàn ăn mở rộng cao cấp Dolas</td>
                                    <td><img src="https://images.pexels.com/photos/8325759/pexels-photo-8325759.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>66</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>22.650.000đ</td>
                                    <td>Bàn thông minh</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>83826226</td>
                                    <td>Tủ ly - tủ bát</td>
                                    <td><img src="https://images.pexels.com/photos/3985166/pexels-photo-3985166.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>0</td>
                                    <td><span class="badge bg-danger">Hét hàng</span></td>
                                    <td>2.450.000đ</td>
                                    <td>Tủ</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>83252001</td>
                                    <td>Giường ngủ Thomas</td>
                                    <td><img src="https://images.pexels.com/photos/8325758/pexels-photo-8325758.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>73</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>12.950.000đ</td>
                                    <td>Giường người lớn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>83252002</td>
                                    <td>Giường ngủ Jimmy</td>
                                    <td><img src="https://images.pexels.com/photos/3735712/pexels-photo-3735712.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>60</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>16.320.000đ</td>
                                    <td>Giường người lớn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>83216008</td>
                                    <td>Giường ngủ Tara chân gỗ</td>
                                    <td><img src="https://images.pexels.com/photos/3082451/pexels-photo-3082451.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>65</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>19.600.000đ</td>
                                    <td>Giường người lớn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>83216006</td>
                                    <td>Giường ngủ Kara 1.6x2m</td>
                                    <td><img src="https://images.pexels.com/photos/8325755/pexels-photo-8325755.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="" width="100px;"></td>
                                    <td>60</td>
                                    <td><span class="badge bg-success">Còn hàng</span></td>
                                    <td>14.500.000đ</td>
                                    <td>Giường người lớn</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" onclick="myFunction(this)"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal" data-target="#modal-up"><i
                                                class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div class="modal fade" id="modal-up" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                            </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label">Mã sản phẩm </label>
                            <input class="form-control" type="number" value="71309005">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" required value="Bàn ăn gỗ Theresa">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number" required value="20">
                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="exampleSelect1" class="control-label">Tình trạng sản phẩm</label>
                            <select class="form-control" id="exampleSelect1">
                                <option>Còn hàng</option>
                                <option>Hết hàng</option>
                                <option>Đang nhập hàng</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label">Giá bán</label>
                            <input class="form-control" type="text" value="5.600.000">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleSelect1" class="control-label">Danh mục</label>
                            <select class="form-control" id="exampleSelect1">
                                <option>Hóa chất</option>
                                <option>Dụng cụ</option>
                                <option>Thiết bị</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end mt-3">
                        <button class="btn btn-save mr-3">Lưu lại</button>
                        <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                    </div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

    <!-- ===== JAVASCRIPT ===== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendor/bootstrap/js/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>