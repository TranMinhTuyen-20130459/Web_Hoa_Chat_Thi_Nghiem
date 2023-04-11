<%@ page import="model.admin.Admin" %>
<%@ page import="utils.CommonString" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý admin</title>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/admin-css.jsp"/>
</head>

<body class="app sidebar-mini rtl">

<%--<jsp:include page="../common/admin-header.jsp"/>--%>

<jsp:include page="../common/admin-sidebar-menu.jsp"/>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Quản lý admin</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <!-- Action Buttons -->
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="#"
                               title="Thêm" data-toggle="modal" data-target="#form-add-admin"><i
                                    class="fas fa-plus"></i> Thêm admin mới</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"><i
                                    class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"><i
                                    class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <!-- Table -->
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th>Tài khoản</th>
                            <th>Trạng thái</th>
                            <th>Quyền</th>
                            <th>Họ tên</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="a" items="${requestScope.adminList}">
                            <c:choose>
                                <c:when test="${a.name_status_acc=='Bình thường'}"><c:set var="bg"
                                                                                          value="bg-success"></c:set></c:when>
                                <c:when test="${a.name_status_acc=='Tạm khóa'}"><c:set var="bg"
                                                                                       value="bg-warning"></c:set></c:when>
                                <c:when test="${a.name_status_acc=='Khóa vĩnh viễn'}"><c:set var="bg"
                                                                                             value="bg-danger"></c:set></c:when>
                            </c:choose>
                            <tr>
                                <td class="userName">${a.username}</td>
                                <td class="statusAd"><span class="badge ${bg}">${a.name_status_acc}</span></td>
                                <td class="roleAd">${a.name_role_admin}</td>
                                <td class="fullnameAd">${a.fullname}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                            onclick=""><i class="fas fa-trash-alt"></i></button>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                            data-toggle="modal" data-target="#modal-up"><i
                                            class="fas fa-edit"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<div class="modal fade" id="modal-up" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa thông tin tài khoản của admin</h5>
                            </span>
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="UsernameUpdate" value="">
                    <div class="form-group col-md-6">
                        <label class="control-label">Mật khẩu hiện tại</label>
                        <input id="InputPassOld" class="form-control" type="text" placeholder="nhập mật khẩu hiện tại">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Mật khẩu mới</label>
                        <input id="InputPassNew" class="form-control" type="text" placeholder="nhập mật khẩu mới">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên admin</label>
                        <input id="InputFullName" class="form-control" type="text">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="SelectRole" class="control-label">Quyền</label>
                        <select class="form-control" id="SelectRole">
                            <option value="0">-- Chọn quyền tài khoản --</option>
                            <c:forEach var="r" items="${requestScope.allRoleAdmin}">
                                <option value="${r.id_role}">${r.name_role}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="SelectStatus" class="control-label">Trạng thái tài khoản</label>
                        <select class="form-control" id="SelectStatus">
                            <option value="0">-- Chọn trạng thái tài khoản --</option>
                            <c:forEach var="stt" items="${requestScope.allStatusAcc}">
                                <option value="${stt.id_status}">${stt.name_status}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <button id="btUpdateAdmin" class="btn btn-save mr-3">Cập nhật</button>
                    <button id="btCancel" class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" id="form-add-admin" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Thêm tài khoản Admin</h5>
                            </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên đăng nhập</label>
                        <input id="InputUsername" class="form-control" type="text" placeholder="Nhập tên đăng nhập">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Mật khẩu</label>
                        <input id="InputPassword" class="form-control" type="text" placeholder="Nhập mật khẩu">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="SelectRole" class="control-label">Quyền</label>
                        <select class="form-control" id="UserRole">
                            <option value="0">-- Chọn quyền tài khoản --</option>
                            <c:forEach var="r" items="${requestScope.allRoleAdmin}">
                                <option value="${r.id_role}">${r.name_role}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="SelectStatus" class="control-label">Trạng thái tài khoản</label>
                        <select class="form-control" id="UserStatus">
                            <option value="0">-- Chọn trạng thái tài khoản --</option>
                            <c:forEach var="stt" items="${requestScope.allStatusAcc}">
                                <option value="${stt.id_status}">${stt.name_status}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <button id="btnAdd" class="btn btn-save mr-3">Thêm</button>
                    <button id="btnCancel" class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"/>
<script>
    <%--  Hiển thị danh sách sản phẩm sử dụng DataTable  --%>
    $(document).ready(function () {
        $('#sampleTable').DataTable();
    });

    $('#sampleTable .trash').on('click', function () {
        swal({
            title: 'Cảnh báo !!!',
            text: 'Chức năng này đang được phát triển.',
            icon: 'warning',
            timer: 3000,
            buttons: false
        })
    })
    $('#btnCancel').on('click', function () {
        $('#InputUsername').val('')
        $('#InputPassword').val('')
        $('#UserStatus').val('0')
        $('#UserRole').val('0')
        $('#InputPassword').nextAll('.text-danger').remove()
    })
    $('.btn-add').on('click', function () {
        $('#InputPassword').blur(function () {
            let pass_admin = $('#InputPassword').val().trim()
            if (pass_admin.length < 9) {
                // nếu đã có cảnh báo rồi thì không cảnh báo nữa
                let existingErrorMessages = $('#InputPassword').nextAll('.text-danger');
                if (existingErrorMessages.length == 0) {
                    $('#InputPassword').after('<div class="text-danger">Mật khẩu tối thiểu 8 kí tự!</div>')
                }
            } else $('#InputPassword').nextAll('.text-danger').remove()
        })
    })
    // thêm tài khoản admin
    $('#btnAdd').on('click', function () {
        let user_name = $('#InputUsername').val().trim()
        let pass_admin = $('#InputPassword').val().trim()
        let id_role_admin = $('#UserRole').val()
        let id_status_acc = $('#UserStatus').val()
        if (user_name == '' && pass_admin == '' && id_role_admin == 0 && id_status_acc == 0) {
            swalAlert('', 'Chưa có gì để thêm', 'error', 2000)
        } else if (user_name == '' || pass_admin == '' || id_role_admin == 0 || id_status_acc == 0) {
            swalAlert('Cảnh báo !!!', 'Bạn hãy nhập đầy đủ thông tin cho tài khoản này', 'error', 3000)
        } else if (pass_admin.length < 9) {
            swalAlert('Cảnh báo !!!', 'Vui lòng nhập lại mật khẩu đúng yêu cầu!', 'error', 3000)
        } else {
            $.ajax({
                url: '${context}/AddAccountAdminServlet',
                type: 'POST',
                data: {
                    UserName: user_name,
                    PassAd: pass_admin,
                    IdRole: id_role_admin,
                    IdStatus: id_status_acc
                },
                data_type: 'text',
                success: function (resultData) {
                    if (resultData.toString() == 'success') {
                        $('#btnAdd').on('click', function () {
                            $('#InputUsername').val('')
                            $('#InputPassword').val('')

                            $('#UserStatus').val('0')
                            $('#UserRole').val('0')
                        })
                        swalAlert('', 'Thêm thành công', 'success', 2000)
                        $('btnCancel').click()
                        setTimeout(function () {
                            location.replace(location.href);
                        }, 2000);
                    } else if (resultData.toString() == 'exits') {
                        swalAlert('', 'Thêm thất bại! Tên tài khoản này đã tồn tại.', 'error', 2000)

                        $('#btnAdd').on('click', function () {
                            $('#InputUsername').val('')
                        })
                    } else if (resultData.toString() == 'fail') {
                        swalAlert('', 'Thêm thất bại', 'error', 2000)
                    }
                },
                error: function () {
                    // error no call ajax
                }
            })
        }
    })
    // hiện dialog update
    $('button.edit').on('click', function () {
        // Lấy dữ liệu từ các thẻ HTML trong hàng đang chọn
        let username = $(this).closest('tr').find('.userName').text();
        let fullname = $(this).closest('tr').find('.fullnameAd').text();
        let status = $(this).closest('tr').find('.statusAd').text();
        let role = $(this).closest('tr').find('.roleAd').text();

        // Hiển thị dữ liệu lên các ô input hoặc dialog
        $('#UsernameUpdate').val(username);
        $('#InputStatus').val('0');
        $('#InputRole').val('0');
        $('#InputFullName').val(fullname);
        $('#InputPassOld').blur(function () {
            let passOldAd = $('#InputPassOld').val()
            if (passOldAd.length < 8) {
                let existingErrorMessages = $('#InputPassOld').nextAll('.text-danger');
                if (existingErrorMessages.length == 0) {
                    $('#InputPassOld').after('<div class="text-danger">Mật khẩu tối thiểu 8 kí tự!</div>')
                }
            } else $('#InputPassOld').nextAll('.text-danger').remove()

        })
        $('#InputPassNew').blur(function () {
            let passNewAd = $('#InputPassNew').val().trim()
            if (passNewAd.length > 0 && passNewAd.length < 8) {
                let existingErrorMessages = $('#InputPassNew').nextAll('.text-danger');
                if (existingErrorMessages.length == 0) {
                    $('#InputPassNew').after('<div class="text-danger">Mật khẩu tối thiểu 8 kí tự!</div>');
                }
            } else $('#InputPassNew').nextAll('.text-danger').remove()
        })
        $('#SelectRole').blur(function () {
            let roleAd = $('#SelectRole').val()
            if (roleAd == 0) {
                let existingErrorMessages = $('#SelectRole').nextAll('.text-danger');
                if (existingErrorMessages.length == 0) {
                    $('#SelectRole').after('<div class="text-danger">Vui lòng chọn quyền!</div>')
                }
            } else $('#SelectRole').nextAll('.text-danger').remove()
        })
        $('#SelectStatus').blur(function () {
            let sttAd = $('#SelectStatus').val()
            if (sttAd == 0) {
                let existingErrorMessages = $('#SelectStatus').nextAll('.text-danger');
                if (existingErrorMessages.length == 0) {
                    $('#SelectStatus').after('<div class="text-danger">Vui lòng chọn trạng thái tài khoản!</div>')
                }
            } else $('#SelectStatus').nextAll('.text-danger').remove()
        })

    });
    $('#btUpdateAdmin').on('click', function () {
        let username = $('#UsernameUpdate').val().trim()
        let pass_admin = $('#InputPassOld').val().trim()
        let pass_admin_new = $('#InputPassNew').val().trim()
        let id_role_admin = $('#SelectRole').val()
        let id_status_acc = $('#SelectStatus').val()
        let fullname = $('#InputFullName').val()
        if (pass_admin == null || id_role_admin == 0 || id_status_acc == 0) {
            swalAlert('Cảnh báo !!!', 'Bạn hãy nhập đầy đủ thông tin cho tài khoản này!', 'error', 3000)
        } else if (pass_admin_new.length > 0 && pass_admin_new.length < 8) {
            swalAlert('Cảnh báo !!!', 'Vui lòng nhập lại mật khẩu mới đúng yêu cầu!', 'error', 3000)
        } else {
            console.log(pass_admin_new,pass_admin,username,id_role_admin)
            $.ajax({
                url: '${context}/UpdateAdminServlet',
                type: 'POST',
                data: {
                    UserName: username,
                    PassAd: pass_admin,
                    PassNew: pass_admin_new,
                    IdRole: id_role_admin,
                    IdStatus: id_status_acc,
                    Fullname: fullname
                },
                data_type: 'text',
                success: function (resultData) {
                    if (resultData.toString() == 'success') {
                        swalAlert('', 'Cập nhật thành công.', 'success', 2000)
                        $('btnCancel').click()
                        setTimeout(function () {
                            location.replace(location.href);
                        }, 2000);

                    } else if (resultData.toString() == 'passfail') {
                        swalAlert('', 'Mật khẩu của tài khoản này không chính xác!', 'error', 2000)
                    } else if (resultData.toString() == 'error') {
                        swalAlert('', 'Lỗi', 'error', 2000)
                    } else {
                        swalAlert('', 'Bạn không có quyền cập nhật!', 'error', 2000)
                    }
                },
                error: function () {
                    // error no call ajax
                }
            })
        }
    })
    $('#modal-up #btCancel').on('click', function () {
        $('#InputUsername').val('')
        $('#InputPassNew').val('')
        $('#InputPassOld').val('')
        $('#InputRole').val('0')
        $('#InputStatus').val('0')
        $('#SelectStatus').nextAll('.text-danger').remove()
        $('#SelectRole').nextAll('.text-danger').remove()
        $('#InputPassNew').nextAll('.text-danger').remove()
        $('#InputPassOld').nextAll('.text-danger').remove()
    });

    function swalAlert(title, text, icon, timer) {
        swal({
            title: title,
            text: text,
            icon: icon,
            timer: timer,
            buttons: false
        });
    }
</script>
</body>
</html>