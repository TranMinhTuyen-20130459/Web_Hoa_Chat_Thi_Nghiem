package controller.authentication;

import model.Customer;
import model.GooglePojo;
import utils.GoogleUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
