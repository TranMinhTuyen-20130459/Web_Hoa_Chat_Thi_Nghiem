<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pu" uri="https://com.labchemicals.functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab Chemicals | Thanh Toán</title>
    <link rel="icon" type="image/png" href="images/labchemicals-logo-icon.png"/>

    <!-- ===== STYLESHEET ===== -->
    <jsp:include page="../common/shop-css.jsp"/>

</head>

<body>
<!-- ===== PRELOADER ===== -->
<div class="preloader">
    <div class="preloader-inner">
        <div class="preloader-icon">
            <span></span>
            <span></span>
        </div>
    </div>
</div>

<!-- ===== HEADER ===== -->
<jsp:include page="../common/shop-header.jsp"/>

<!-- ===== BREADCRUMBS ===== -->
<div class="breadcrumbs py-4">
    <div class="container text-left">
        <ul class="bread-list d-inline-block">
            <li class="d-inline-block text-capitalize"><a href="${context}/shop/home">Trang chủ<i
                    class="ti-arrow-right mx-2"></i></a></li>
            <li class="d-inline-block text-capitalize"><a href="${context}/shop/cart">Giỏ hàng<i
                    class="ti-arrow-right mx-2"></i></a></li>
            <li class="d-inline-block text-capitalize"><a href="">Thanh toán</a></li>
        </ul>
    </div>
</div>

<!-- ===== CHECKOUT ===== -->
<section class="checkout">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-12">
                <div class="checkout-form mt-4">
                    <div class="checkout-title">
                        <h3>Thông tin giao hàng</h3>
                        <p class="my-2">
                            Yêu cầu quý khách cần điền đầy đủ thông tin để việc giao hàng
                            được thuận lợi
                        </p>
                    </div>
                    <%--                    <form class="form" id="checkout_form" method="POST" action="${context}/shop/checkout">--%>
                    <form class="form" id="checkout_form">
                        <div class="row">
                            <div class="col-lg-12 col-12">
                                <div class="form-group mb-4">
                                    <label>Họ và tên</label>
                                    <input id="nameCustomer" name="name" type="text"
                                           value="${sessionScope.auth_customer.fullname}"/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group mb-4">
                                    <label>Số điện thoại<span>*</span></label>
                                    <input id="phoneCustomer" name="phone" type="text"
                                           value="${sessionScope.auth_customer.phone}"/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="form-group mb-4">
                                    <label>Email<span>*</span></label>
                                    <input id="emailCustomer" name="email" type="email"
                                           value="${sessionScope.auth_customer.email_customer}"/>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="form-group">
                                    <label>Tỉnh / Thành<span>*</span></label>
                                    <select size="10" class="form-select form-select-sm mb-3" id="city"
                                            aria-label=".form-select-sm" style="display:block">
                                        <option value="" selected>Chọn tỉnh thành</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="form-group">
                                    <label>Quận / Huyện<span>*</span></label>
                                    <select class="form-select form-select-sm mb-3" id="district"
                                            aria-label=".form-select-sm" style="display: block">
                                        <option value="" selected>Chọn quận huyện</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="form-group">
                                    <label>Phường / Xã<span>*</span></label>
                                    <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm"
                                            style="display: block">
                                        <option value="" selected>Chọn phường xã</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-12">
                                <div class="form-group">
                                    <label>Địa chỉ<span>*</span></label>
                                    <input id="address" name="address" type="text"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-12">
                <div class="order-details">
                    <!-- Order Widget -->
                    <div class="single-widget mb-4">
                        <h2>TỔNG CỘNG</h2>
                        <div class="content mt-3">
                            <ul>
                                <li>Hóa đơn<span>${pu:format(requestScope['bill_price'])}đ</span></li>
                                <li>(+) Vận chuyển<span>${pu:format(requestScope['transport_fee'])}đ</span></li>
                                <li>Tổng<span
                                        class="total">${pu:format(requestScope['bill_price'] + requestScope['transport_fee'])}đ</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Order Widget -->
                    <div class="single-widget mb-5">
                        <h2>PHƯƠNG THỨC THANH TOÁN</h2>
                        <div class="content mt-3">
                            <div class="radio">
                                <input type="radio" id="2" checked>
                                <label class="checkbox-inline" for="2">Thanh toán trực tiếp</label>
                            </div>
                        </div>
                    </div>
                    <!-- Button Widget -->
                    <div class="single-widget get-button">
                        <div class="content">
                            <div class="button">
                                <button class="btn" id="btn-checkout">Thanh toán</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== SHOP SERVICES ===== -->
<jsp:include page="../common/shop-services.jsp"/>

<!-- ===== FOOTER ===== -->
<jsp:include page="../common/shop-footer.jsp"/>

<!-- ===== JAVASCRIPT ===== -->
<jsp:include page="../common/shop-js.jsp"/>
<script src="../shop/js/sweetalert2.js"></script>

<%--Thư viện Axios là một thư viện HTTP Client dựa trên Promise--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>

<%--Lấy dữ liệu về tỉnh/thành , quận/huyện , phường/xã từ file Json --%>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "./data/vietnam.json", //Đường dẫn đến file chứa dữ liệu hoặc api do backend cung cấp
        method: "GET", //do backend cung cấp
        responseType: "application/json", //kiểu Dữ liệu trả về do backend cung cấp
    };

    //gọi ajax = axios => nó trả về cho chúng ta là một promise
    var promise = axios(Parameter);
    //Xử lý khi request thành công
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }

        // Cập nhật plugin nice-select
        $('#city').niceSelect('update');

        // xứ lý khi thay đổi tỉnh thành thì sẽ hiển thị ra quận huyện thuộc tỉnh thành đó
        citis.onchange = function () {
            districts.length = 1;
            wards.length = 1;
            if (this.value != "") {
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Id);
                }
            }
            // Cập nhật plugin nice-select
            $('#district').niceSelect('update');
            $('#ward').niceSelect('update');
        };

        // xứ lý khi thay đổi quận huyện thì sẽ hiển thị ra phường xã thuộc quận huyện đó
        districts.onchange = function () {
            wards.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
            // Cập nhật plugin nice-select
            $('#ward').niceSelect('update');
        };

    }
</script>

<%--Gọi Ajax cho phương thức đặt hàng --%>
<script>
    $('#btn-checkout').on('click', function () {

        let nameCustomer = $('#nameCustomer').val()
        let phoneCustomer = $('#phoneCustomer').val()
        let emailCustomer = $('#emailCustomer').val()
        let city = $('#city').val()
        let district = $('#district').val()
        let ward = $('#ward').val()
        let address = $('#address').val()
        let bill_price_before = ${requestScope['bill_price']};

        $.ajax({
            url: '${context}/AjaxCheckoutServlet', // -- địa chỉ của server
            type: 'POST', // -- phương thức truyền : GET, POST, PUT, DELETE
            data: {

                NameCustomer: nameCustomer,
                PhoneCustomer: phoneCustomer,
                EmailCustomer: emailCustomer,
                City: city,
                District: district,
                Ward: ward,
                Address: address,
                BillPriceBefore: bill_price_before

            }, // -- tham số truyền đến server
            data_type: 'text', // -- kiểu dữ liệu nhận về từ server
            success: function (resultData) {

                if (resultData.toString() == "true") {
                    Swal.fire({
                        title: 'Thông báo',
                        text: 'Bạn hãy đặt hàng thành công ^.^',
                        icon: 'success',
                        timer: 3000,
                        buttons: false
                    })
                } else {
                    Swal.fire({
                        title: 'Thông báo',
                        text: 'Đơn hàng của bạn không được đặt !!!',
                        icon: 'error',
                        timer: 3000,
                        buttons: false
                    })
                }


            },
            error: function () {
                // error no call ajax
            }
        })
    })
</script>

<%--<script>--%>
<%--    $('#company').on('change', function () {--%>
<%--        window.location.href = '${context}/shop/update-checkout?city=' + $(this).val()--%>
<%--    })--%>

<%--    $('#btn-checkout').on('click', function () {--%>
<%--        Swal.fire({--%>
<%--            icon: 'success',--%>
<%--            title: 'Thanh toán thành công',--%>
<%--            html: '<span class="d-block mt-2">Đơn hàng của bạn đã thanh toán thành công.</span>' +--%>
<%--                '<span class="d-block mt-3 mb-2">' +--%>
<%--                'Bạn có thể xem chi tiết trong <span id="s-marker">lịch sử mua hàng</span>.</span>',--%>
<%--            didOpen: () => {--%>
<%--                const marker = Swal.getHtmlContainer().querySelector('#s-marker')--%>
<%--                $(marker).css('color', '#2880e7').css('cursor', 'pointer').on('click', function () {--%>
<%--                    $('#checkout_form').append($('<input>').attr('type', 'hidden').attr('name', 'nav'))--%>
<%--                        .submit()--%>
<%--                })--%>
<%--            },--%>
<%--            confirmButtonColor: '#166bcc',--%>
<%--            confirmButtonText: 'TIẾP TỤC MUA HÀNG',--%>
<%--            allowOutsideClick: () =>  $('#checkout_form').submit()--%>
<%--        }).then(result => {--%>
<%--            if (result.isConfirmed) {--%>
<%--                $('#checkout_form').submit()--%>
<%--            }--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>

</body>

</html>