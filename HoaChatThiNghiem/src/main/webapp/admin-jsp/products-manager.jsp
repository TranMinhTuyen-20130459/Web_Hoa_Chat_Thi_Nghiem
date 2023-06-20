<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pu" uri="https://com.labchemicals.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm</title>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/admin-css.jsp"></jsp:include>
</head>

<body class="app sidebar-mini rtl">
<%--    Header--%>
<%--<jsp:include page="../common/admin-header.jsp"/>--%>

<!-- Sidebar Menu -->
<jsp:include page="../common/admin-sidebar-menu.jsp"/>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Quản lý sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="${context}/admin/them-san-pham"
                               title="Thêm"><i class="fas fa-plus"></i> Tạo mới sản phẩm</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"
                               onclick=""><i class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"
                               onclick=""><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Trạng thái</th>
                            <th>Giá niêm yết</th>
                            <th>Giá bán thực tế</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${requestScope.products}">
                            <c:choose>
                                <c:when test="${p.statusP.name_status=='Mới'}"><c:set var="bg"
                                                                                      value="bg-success"></c:set></c:when>
                                <c:when test="${p.statusP.name_status=='Hot'}"><c:set var="bg"
                                                                                      value="bg-warning"></c:set></c:when>
                                <c:when test="${p.statusP.name_status=='Cấm bán'}"><c:set var="bg"
                                                                                          value="bg-danger"></c:set></c:when>
                            </c:choose>
                            <tr class="rowProduct">
                                <td class="idProduct">${p.idProduct}</td>
                                <td class="nameProduct">${p.name}</td>
                                <td><img class="imageProduct" src="${context}/${p.imgPath}" alt="" width="100px;"></td>
                                <td class="quantityProduct">${p.quantity}</td>
                                <td><span class="badge ${bg}">${p.statusP.name_status}</span></td>
                                <td class="listedPriceProduct">${pu:format(p.listed_price)}</td>
                                <td class="currentPriceProduct">${pu:format(p.current_price)}</td>
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
                                <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                            </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">Tên sản phẩm</label>
                        <input id="inNameProduct" class="form-control" type="text" required value="">
                        <div id="error-inNameProduct" class="text-danger"></div>
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Số lượng</label>
                        <input id="inQuantityProduct" class="form-control" type="number" value="">
                        <div id="error-inQuantityProduct" class="text-danger"></div>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Giá niêm yết</label>
                        <input id="inListedPrice" class="form-control" type="number" value="">
                        <div id="error-inListedPrice" class="text-danger"></div>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Giá bán thực tế</label>
                        <input id="inCurrentPrice" class="form-control" type="number" value="">
                        <div id="error-inCurrentPrice" class="text-danger"></div>
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="SelectStatusProd" class="control-label">Trạng thái sản phẩm</label>
                        <select class="form-control" id="SelectStatusProd">
                            <option value="0">-- Chọn trạng thái --</option>
                            <c:forEach var="statusProd" items="${requestScope.statusProducts}">
                                <option value="${statusProd.id_status}">${statusProd.name_status}</option>
                            </c:forEach>
                        </select>
                        <div id="error-SelectStatusProd" class="text-danger"></div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="SelectStatusProd" class="control-label">Loại sản phẩm</label>
                        <select class="form-control" id="SelectTypeProd">
                            <option value="0">-- Chọn loại sản phẩm --</option>
                            <c:forEach var="st" items="${requestScope.subtypeProducts}">
                                <option value="${st.id_subtype}">${st.name_type}</option>
                            </c:forEach>
                        </select>
                        <div id="error-SelectTypeProd" class="text-danger"></div>
                    </div>
                    <div class="form-group col-md-12">
                        <div id="boxchoice">
                            <a href="javascript:" class="Choicefile" onClick="ChooseImage('UrlImage')">
                                <i class="fas fa-cloud-upload-alt"></i>
                                Chọn ảnh
                            </a>
                            <a id="myfileupload">
                                <input id="" readonly type="text" name="UrlImage" style="min-width:450px"/>
                            </a>
                            <p style="clear:both"></p>
                        </div>


                        <div id="boxchoice2">
                            <a href="javascript:" class="Choicefile" onClick="ChooseImage('UrlImage_second')">
                                <i class="fas fa-cloud-upload-alt"></i>
                                Chọn ảnh
                            </a>
                            <a id="myfileupload2">
                                <input readonly type="text" name="UrlImage_second" style="min-width:450px"/>
                            </a>
                            <p style="clear:both"></p>
                        </div>
                        <div id="boxchoice3">
                            <a href="javascript:" class="Choicefile" onClick="ChooseImage('UrlImage_third')">
                                <i class="fas fa-cloud-upload-alt"></i>
                                Chọn ảnh
                            </a>
                            <a id="myfileupload3">
                                <input readonly type="text" name="UrlImage_third" style="min-width:450px"/>
                            </a>
                            <p style="clear:both"></p>
                        </div>
                        <div id="boxchoice4">
                            <a href="javascript:" class="Choicefile" onClick="ChooseImage('UrlImage_fourth')">
                                <i class="fas fa-cloud-upload-alt"></i>
                                Chọn ảnh
                            </a>
                            <a id="myfileupload4">
                                <input readonly type="text" name="UrlImage_fourth" style="min-width:450px"/>
                            </a>
                            <p style="clear:both"></p>
                        </div>
                        <div id="boxchoice5">
                            <a href="javascript:" class="Choicefile" onClick="ChooseImage('UrlImage_fifth')">
                                <i class="fas fa-cloud-upload-alt"></i>
                                Chọn ảnh
                            </a>
                            <a id="myfileupload5">
                                <input readonly type="text" name="UrlImage_fifth" style="min-width:450px"/>
                            </a>
                            <p style="clear:both"></p>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <button id="btUpdateProduct" class="btn btn-save mr-3" type="submit">Lưu lại</button>
                    <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"></jsp:include>
<script>
    <%--  Hiển thị danh sách sản phẩm sử dụng DataTable  --%>
    $(document).ready(function () {
        $('#sampleTable').DataTable();
    });

    <%--Xóa sản phẩm sử dụng Ajax --%>
    $('#sampleTable .trash').on('click', function () {
        swal({
            title: 'Cảnh báo',
            text: 'Bạn có chắc chắn là muốn xóa sản phẩm này?',
            buttons: ['Hủy bỏ', 'Đồng ý']
        }).then((agree) => {
                if (agree) {
                    var rowDelete = $(this).closest('tr')                       // row can be deleted
                    var id = $(this).closest('tr').find('.idProduct').text()    // get data id of row after click in table
                    $.ajax({    // call Ajax for action delete product
                        url: '${context}/AjaxDeleteProductServlet',     //-- địa chỉ server
                        type: 'POST',                                   //-- phương thức truyền : GET,POST,PUT,DELETE,...
                        data: {IdProduct: id},                          //-- tham số truyền đến server
                        data_type: 'text',                              //-- kiểu dữ liệu nhận về từ server text,xml,json,...
                        success: (function (resultData) {
                            // alert(resultData)
                            if (resultData.toString() == "success") {
                                rowDelete.remove();
                                swal({
                                    text: 'Đã xóa thành công.',
                                    icon: 'success',
                                    timer: 1000,
                                    buttons: false
                                });
                            } else {
                                swal({
                                    text: 'Xóa không thành công.',
                                    icon: 'error',
                                    timer: 1000,
                                    buttons: false
                                });
                            }
                        }),         //-- xử lí phản hồi từ server
                        error: (function () {
                            // error no call ajax
                        })
                    })
                }
            }
        )
    });

    var idProduct; // -- biến này có thể thay đổi mỗi khi click vào icon chỉnh sửa sản phẩm
    var nameProduct;
    var quantityProduct;
    var listedPriceProduct;
    var currentPriceProduct;
    var inputElement = $('input[name="UrlImage"]');
    var inputElement_second = $('input[name="UrlImage_second"]');
    var inputElement_third = $('input[name="UrlImage_third"]');
    var inputElement_fourth = $('input[name="UrlImage_fourth"]');
    var inputElement_fifth = $('input[name="UrlImage_fifth"]');

    <%-- Kiểm lỗi khi người dùng nhập vào các input trong form cập nhật sản phẩm --%>
    $('#sampleTable .edit').on('click', function () {
        /*
        --  Blur là sự kiện xảy ra khi con trỏ chuột đi ra ngoài đối tượng.
        --  Ví dụ bạn có một ô input, khi người dùng nhập dữ liệu xong và nhấn tab để di chuyển con trỏ sang ô input khác
        --  thì sẽ xảy ra sự kiện blur.
        */
        idProduct = $(this).closest('tr').find('.idProduct').text()
        nameProduct= $(this).closest('tr').find('.nameProduct').text()
        quantityProduct =$(this).closest('tr').find('.quantityProduct').text()
        listedPriceProduct = parseInt($(this).closest('tr').find('.listedPriceProduct').text().replace(',',''))
        currentPriceProduct = parseInt($(this).closest('tr').find('.currentPriceProduct').text().replace(',',''))

        inputElement.val('');
        inputElement_second.val('');
        inputElement_third.val('');
        inputElement_fourth.val('');
        inputElement_fifth.val('');
        var listInput = [
            inputElement,
        inputElement_second,
        inputElement_third,
        inputElement_fourth,
        inputElement_fifth,
        ];
        $.ajax({
            url: '${context}/LoadAllUrlImageOfProduct',
            method: 'GET',
            data: {id: idProduct},
            success: function (response){
                var imageUrls = response.split('\n');
                for(var i = 0; i< imageUrls.length; i++){
                    listInput[i].val(imageUrls[i]);
                }
            },
            error: function (xhr, status, error){
                console.error('Lỗi khi truy xuất danh sách hình ảnh:', error);
            }
        });

        $('#inNameProduct').val(nameProduct)
        $('#inQuantityProduct').val(quantityProduct)
        $('#inListedPrice').val(listedPriceProduct)
        $('#inCurrentPrice').val(currentPriceProduct)

        $('#inNameProduct').blur(function () {
            var nameProd = $('#inNameProduct').val()
            if (nameProd.length < 5) {
                $('#error-inNameProduct').text('Tên sản phẩm không được để trống và phải lớn hơn 5 kí tự !!!')
            } else $('#error-inNameProduct').text('')
        })
        $('#inQuantityProduct').blur(function () {
            var quantProd = $('#inQuantityProduct').val()

            if (quantProd.length == 0) {
                $('#error-inQuantityProduct').text('Số lượng sản phẩm không được để trống !!!')
            } else if (quantProd < 0 || quantProd > 10000) {
                $('#error-inQuantityProduct').text('Số lượng sản phẩm không được âm và không được vượt quá 10000 sản phẩm')
            } else $('#error-inQuantityProduct').text('')
        })
        $('#inListedPrice').blur(function () {
            var listedPriceProd = $('#inListedPrice').val()

            if (listedPriceProd.length == 0) {
                $('#error-inListedPrice').text('Giá sản phẩm không được để trống !!!')
            } else if (listedPriceProd < 0 || listedPriceProd > Math.pow(10, 6) * 500) {
                $('#error-inListedPrice').text('Giá sản phẩm không được âm và không được vượt quá 500 triệu đồng !!!')
            } else $('#error-inListedPrice').text('')
        })
        $('#inCurrentPrice').blur(function () {
            var currentPriceProd = $('#inCurrentPrice').val()

            if (currentPriceProd.length == 0) {
                $('#error-inCurrentPrice').text('Giá sản phẩm không được để trống !!!')
            } else if (currentPriceProd < 0 || currentPriceProd > Math.pow(10, 6) * 500) {
                $('#error-inCurrentPrice').text('Giá sản phẩm không được âm và không được vượt quá 500 triệu đồng !!!')
            } else $('#error-inCurrentPrice').text('')
        })
        $('#SelectStatusProd').blur(function () {
            var idSelect = $('#SelectStatusProd').val()
            if (idSelect == '0') {
                $('#error-SelectStatusProd').text('Hãy chọn trạng thái sản phẩm !!!')
            } else $('#error-SelectStatusProd').text('')
        })
        $('#SelectTypeProd').blur(function () {
            var idSelect = $('#SelectTypeProd').val()
            if (idSelect == '0') {
                $('#error-SelectTypeProd').text('Hãy chọn loại sản phẩm !!!')
            } else $('#error-SelectTypeProd').text('')
        })
    });

    <%-- Reset lại form cập nhật thông tin sản phẩm --%>
    $('#modal-up .btn-cancel').on('click', function () {
        $('#inNameProduct').val('')
        $('#inQuantityProduct').val('')
        $('#inListedPrice').val('')
        $('#inCurrentPrice').val('')
        $('#SelectStatusProd').val('0')
        $('#SelectTypeProd').val('0')
        inputElement.val('');
        inputElement_second.val('');
        inputElement_third.val('');
        inputElement_fourth.val('');
        inputElement_fifth.val('');
    });

    <%--Cập nhật thông tin sản phẩm sử dụng Ajax --%>
    $('#btUpdateProduct').on('click', function () {
        // alert('Đây là chức năng cập nhật thông tin sản phẩm')
        var nameProd = $('#inNameProduct').val()
        var quantProd = $('#inQuantityProduct').val()
        var listedPriceProd = $('#inListedPrice').val()
        var currentPriceProd = $('#inCurrentPrice').val()
        var statusProd = $('#SelectStatusProd').val()
        var subtypeProd = $('#SelectTypeProd').val()
        var inputElement = $('input[name="UrlImage"]').val();
        var inputElement_second = $('input[name="UrlImage_second"]').val();
        var inputElement_third = $('input[name="UrlImage_third"]').val();
        var inputElement_fourth = $('input[name="UrlImage_fourth"]').val();
        var inputElement_fifth = $('input[name="UrlImage_fifth"]').val();


        if (nameProd.length == 0 || quantProd.length == 0 || listedPriceProd.length == 0 || currentPriceProd.length == 0
            || statusProd.length == 0 || subtypeProd.length == 0 || statusProd == '0' || subtypeProd == '0'
            || inputElement.length == 0 || inputElement_second.length == 0 || inputElement_third.length == 0
            || inputElement_fourth.length == 0 || inputElement_fifth.length == 0) {
            swal({
                title: 'Cảnh báo !!!',
                text: 'Bạn hãy nhập đầy đủ thông tin cho sản phẩm này',
                icon: 'error',
                timer: 3000,
                buttons: false
            })
        } else {
            // alert('call ajax')
            $.ajax({ // call ajax for action update product
                url: '${context}/AjaxUpdateProductServlet',
                type: 'POST',
                data: {
                    IdSP: idProduct,
                    TenSP: nameProd,
                    SoLuongSP: quantProd,
                    GiaNiemYetSP: listedPriceProd,
                    GiaHienTaiSP: currentPriceProd,
                    IdTrangThaiSP: statusProd,
                    IdLoaiSP: subtypeProd,
                    UrlImage: inputElement,
                    UrlImage_second: inputElement_second,
                    UrlImage_third: inputElement_third,
                    UrlImage_fourth: inputElement_fourth,
                    UrlImage_fifth: inputElement_fifth,
                },
                data_type: 'text',
                success: function (resultData) {
                    if (resultData.toString() == 'success') {
                        swal({
                            text: 'Đã cập nhật sản phẩm thành công.',
                            icon: 'success',
                            timer: 1000,
                            buttons: false
                        });
                    } else {
                        swal({
                            text: 'Cập nhật sản phẩm không thành công. ' +
                                'Có thể còn một trường nào hoặc các hình ảnh chọn đã bị giống nhau',
                            icon: 'error',
                            timer: 3000,
                            buttons: false
                        });
                    }
                },
                error: function () {
                    // error no call ajax
                }
            })
        }
    });

    <%-- Xuất danh sách sản phẩm ra file excel --%>
    $('.btn-excel').on('click', function () {
        TableToExcel.convert(document.getElementById('sampleTable'), {
            name: `danh-sach-san-pham.xlsx`
        });
        return false
    });
</script>
<jsp:include page="../common/admin-js.jsp"></jsp:include>
<script src="../libraries/ckfinder/ckfinder.js"></script>
<script>
    function DienUrlVaoInput(fieldName, fileUrl) {
        $('input[name=' + fieldName + ']').val(fileUrl);
    }

    function ChooseImage(fieldName) {
        var finder = new CKFinder();
        finder.selectActionFunction = function(fileUrl) {
            DienUrlVaoInput(fieldName, fileUrl);
        };
        finder.popup();
    }

</script>
</body>
</html>