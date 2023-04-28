<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pu" uri="https://com.labchemicals.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đơn hàng</title>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/admin-css.jsp"/>
</head>

<body class="app sidebar-mini rtl">
<%--    Header--%>
<%--<jsp:include page="../common/admin-header.jsp"/>--%>

<!-- Sidebar Menu -->
<jsp:include page="../common/admin-sidebar-menu.jsp"/>

<main class="app-content" id="bill-page">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Quản lý đơn hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"
                               onclick="myApp.printTable()"><i class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"
                               onclick="myApp.printTable()"><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered bill-table" id="sampleTable">
                        <thead>
                        <tr>
                            <%--<th class="text-center">ID đơn hàng</th>--%>
                            <th class="text-center">Khách hàng</th>
                            <th class="text-center">SĐT</th>
                            <th class="text-center">Tình trạng</th>
                            <th class="text-center">Địa chỉ giao hàng</th>
                            <th class="text-center">Tiền ship</th>
                            <th class="text-center">Trị giá đơn hàng</th>
                            <th class="text-center">Thời gian đặt hàng</th>
                            <th class="text-center">Cập nhật</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="b" items="${requestScope.bills}">
                            <c:choose>
                                <c:when test="${b.getNameStatus() == 'Đã giao'}"><c:set var="bg"
                                                                                        value="bg-success"/></c:when>
                                <c:when test="${b.getNameStatus() == 'Đang giao hàng'}"><c:set var="bg"
                                                                                               value="bg-warning"/></c:when>
                                <c:when test="${b.getNameStatus() == 'Hủy đơn hàng'}"><c:set var="bg"
                                                                                             value="bg-danger"/></c:when>
                                <c:when test="${b.getNameStatus() == 'Chờ xác nhận'}"><c:set var="bg" value="bg-info"/></c:when>
                                <c:when test="${b.getNameStatus() == ''}"><c:set var="bg" value="bg-info"/></c:when>
                            </c:choose>
                            <tr>
                                <td>${b.nameCustomer}</td>
                                <td>${b.phoneCustomer}</td>
                                <td data-ss="${bg}" class="text-center"><span
                                        class="badge ${bg}">${b.getNameStatus()}</span></td>
                                <td>${b.address}, ${b.to_ward_name}, ${b.to_district_name}, ${b.to_province_name}</td>
                                <td>${pu:format(b.ship_price)} đ</td>
                                <td>${pu:format(b.bill_price_before)} đ</td>
                                <td>${b.time_order}</td>
                                <td class="text-center">
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i
                                            class="fas fa-edit"></i></button>
                                </td>
                                    <%--cột số 8 trong DataTable,được ẩn đi--%>
                                <td>${b.id_status_bill}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<div class="modal fade modal-bill" id="modal-up" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content mt-5">
            <div class="modal-body p-4">
                <div class="row">
                    <div class="form-group col-md-12 ">
                        <label for="select-status" class="control-label">Tình trạng đơn hàng</label>
                        <select class="form-control" id="select-status" name="bill-status">
                            <option value="1">Chờ xác nhận</option>
                            <option value="2">Đang giao hàng</option>
                            <option value="3">Đã giao</option>
                            <option value="4">Hủy đơn hàng</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <button class="btn btn-save mr-3" type="submit">Lưu lại</button>
                    <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/admin-js.jsp"/>
<!-- ================================================================================================== -->
<script>

    const myApp = new function () {
        this.printTable = function () {
            const tab = document.getElementById('sampleTable');
            const win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }

    $('#sampleTable').dataTable({
        // order: false,
        order: [[0, 'asc']],
        "columnDefs": [
            {
                "targets": [8], // áp dụng cho cột số 8
                "visible": false, // ẩn cột
                "searchable": false
            }
        ]
    });

    $('.btn-excel').on('click', function () {
        TableToExcel.convert(document.getElementById('sampleTable'), {
            name: `bill_management.xlsx`
        });
        return false
    })

    $('.pdf-file').on('click', function () {
        const pdf = new jsPDF('p', 'pt', 'letter');
        const source = $('#sampleTable');

        const margins = {
            top: 80,
            bottom: 60,
            left: 40,
            width: 522
        };

        pdf.fromHTML(
            source,
            margins.left,
            margins.top, {
                'width': margins.width
            },

            function () {
                pdf.save('Test.pdf');
            }, margins);
    })

</script>

<script>

    let select_status = document.getElementById('select-status')
    const modal = $('#modal-up') // cửa sổ cập nhật trạng thái đơn hàng
    let value_status_bill; // giá trị trạng thái của đơn hàng
    let table = $('#sampleTable').DataTable();
    let columnIdx;// cột chứa giá trị trong DataTable
    let selectedRow;// dòng được chọn
    let cellValue;// giá trị ô tương ứng theo dòng và cột


    // Khi click vào icon edit
    $('.edit').on('click', function () {

        modal.modal('show')// => show ra cửa sổ model

        columnIdx = table.column(8).index(); // cột chứa giá trị id_status_bill đã được ẩn đi bởi DataTable
        selectedRow = $(this).closest('tr'); // Lấy ra phần tử tr đang được chọn
        cellValue = table.cell(selectedRow, columnIdx).data(); // Lấy giá trị ô tương ứng với vị trí hàng và cột đã chọn

        value_status_bill = cellValue
        select_status.value = value_status_bill // thay đổi thẻ select theo giá trị tương ứng

        console.log("value status bill: " + value_status_bill);

        select_status.onchange = function () {
            value_status_bill = this.value
            console.log("value status bill: " + value_status_bill)

        }// => khi thay đổi trạng thái của đơn hàng

        // Khi click vào button Lưu lại
        $('.btn-save').on('click', function () {

            if (cellValue == value_status_bill) {

                alert('khong the cap nhat')

            } else {
                switch (value_status_bill) {
                    // Đơn hàng đang ở trạng thái "Chờ xác nhận"
                    case '1':
                        alert(value_status_bill)
                        break;
                    //... trạng thái "Đang giao hàng"
                    case '2':
                        alert(value_status_bill)
                        break;
                    //... trạng thái "Đã giao"
                    case '3':
                        alert(value_status_bill)
                        break;
                    //... trạng thái "Hủy đơn hàng"
                    case '4':
                        alert(value_status_bill)
                        break;
                    default:
                        "Welcome to bug";
                }
            }
        })
    })

</script>
</body>

</html>