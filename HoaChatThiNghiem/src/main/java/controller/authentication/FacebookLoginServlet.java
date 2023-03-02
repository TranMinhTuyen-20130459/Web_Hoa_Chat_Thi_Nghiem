package controller.authentication;

import com.restfb.types.User;
import model.shop.Customer;
import utils.FacebookUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FacebookLoginServlet", value = "/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /* Tham số này chứa mã lỗi nếu việc đăng nhập bị hủy bởi người dùng.*/
        String error = request.getParameter("error");

        /* Tham số này chứa mã xác thực dùng để lấy thông tin người dùng Facebook nếu việc đăng nhập thành công.*/
        String code = request.getParameter("code");

        // khi người dùng hủy đăng nhập bằng Facebook
        if (error != null && error.equals("access_denied")) {
            response.sendRedirect(request.getContextPath() + "/shop/login");
        }

        // khi người dùng đăng nhập thành công bằng Facebook
        if (code != null) {
            String accessToken = FacebookUtils.getToken(code);
            User userFacebook = FacebookUtils.getUserInfor(accessToken);

            Customer customer = new Customer();
            customer.setFullname(userFacebook.getName());
            customer.setSex(userFacebook.getGender());
            customer.setEmail_customer(userFacebook.getEmail());

            request.getSession().setAttribute("auth_customer", customer);
            response.sendRedirect(request.getContextPath() + "/shop/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
