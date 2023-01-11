<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đơn hàng | Quản trị Admin</title>

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
                <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row element-button">
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
                                    <th>ID đơn hàng</th>
                                    <th>Khách hàng</th>
                                    <th>Đơn hàng</th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    <th>Tình trạng</th>
                                    <th>Tính năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>MD0837</td>
                                    <td>Triệu Thanh Phú</td>
                                    <td>Ghế làm việc Zuno, Bàn ăn gỗ Theresa</td>
                                    <td>2</td>
                                    <td>9,400,000 đ</td>
                                    <td><span class="badge bg-success">Hoàn thành</span></td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>MĐ8265</td>
                                    <td>Nguyễn Thị Ngọc Cẩm</td>
                                    <td>Ghế ăn gỗ Lucy màu trắng</td>
                                    <td>1</td>
                                    <td>3,800,000 đ</td>
                                    <td><span class="badge bg-success">Hoàn thành</span></td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>MT9835</td>
                                    <td>Đặng Hoàng Phúc</td>
                                    <td>Giường ngủ Jimmy, Bàn ăn mở rộng cao cấp Dolas, Ghế làm việc Zuno</td>
                                    <td>3</td>
                                    <td>40,650,000 đ</td>
                                    <td><span class="badge bg-success">Hoàn thành</span></td>
                                    <td><button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>ER3835</td>
                                    <td>Nguyễn Thị Mỹ Yến</td>
                                    <td>Bàn ăn mở rộng Gepa</td>
                                    <td>1</td>
                                    <td>16,770,000 đ</td>
                                    <td><span class="badge bg-info">Chờ thanh toán</span></td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>AL3947</td>
                                    <td>Phạm Thị Ngọc</td>
                                    <td>Bàn ăn Vitali mặt đá, Ghế ăn gỗ Lucy màu trắng</td>
                                    <td>2</td>
                                    <td>19,770,000 đ</td>
                                    <td><span class="badge bg-warning">Đang giao hàng</span></td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                    <td>QY8723</td>
                                    <td>Ngô Thái An</td>
                                    <td>Giường ngủ Kara 1.6x2m</td>
                                    <td>1</td>
                                    <td>14,500,000 đ</td>
                                    <td><span class="badge bg-danger">Đã hủy</span></td>
                                    <td>
                                        <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fa fa-edit"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- ===== JAVASCRIPT ===== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendor/bootstrap/js/popper.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
    <!-- ================================================================================================== -->
    <script>
        // Excel
        // $(document).ready(function () {
        //     $('#').DataTable({
        //         dom: 'Bfrtip',
        //         "buttons": [
        //             'excel'
        //         ]
        //     });
        // });

        // In dữ liệu
        var myApp = new function () {
            this.printTable = function () {
                var tab = document.getElementById('sampleTable');
                var win = window.open('', '', 'height=700,width=700');
                win.document.write(tab.outerHTML);
                win.document.close();
                win.print();
            }
        }

        // Sao chép dữ liệu
        // var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

        // copyTextareaBtn.addEventListener('click', function (event) {
        //     var copyTextarea = document.querySelector('.js-copytextarea');
        //     copyTextarea.focus();
        //     copyTextarea.select();

        //     try {
        //         var successful = document.execCommand('copy');
        //         var msg = successful ? 'successful' : 'unsuccessful';
        //         console.log('Copying text command was ' + msg);
        //     } catch (err) {
        //         console.log('Oops, unable to copy');
        //     }
        // });
    </script>
</body>

</html>