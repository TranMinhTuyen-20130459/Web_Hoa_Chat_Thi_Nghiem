package controller.authentication;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import model.Customer;
import model.GooglePojo;
import utils.GoogleUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collections;
import java.util.zip.CheckedOutputStream;

@WebServlet(name = "GoogleLoginServlet", value = "/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /* Tham số này chứa mã xác thực dùng để lấy thông tin người dùng Google nếu việc đăng nhập thành công.*/
        String code = request.getParameter("code");

        if (code != null) {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo userGoogle = GoogleUtils.getUserInfor(accessToken);

            Customer customer = new Customer();
            customer.setFullname(userGoogle.getName());
            customer.setEmail_customer(userGoogle.getEmail());

            request.getSession().setAttribute("auth_customer", customer);
            response.sendRedirect(request.getContextPath() + "/shop/home");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
