package controller.authentication;

import com.restfb.types.User;
import model.Customer;
import utils.RestFB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FacebookLoginServlet", value = "/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String code = request.getParameter("code"); // receive code from Facebook
        if (code != null) {
            String accessToken = RestFB.getToken(code);
            User userFacebook = RestFB.getUserInfor(accessToken);

            Customer customer = new Customer();
            customer.setFullname(userFacebook.getName());
            customer.setSex(userFacebook.getGender());
            customer.setEmail_customer(userFacebook.getEmail());


            request.getSession().setAttribute("auth_customer",customer);
            response.sendRedirect(request.getContextPath()+"/shop/home");

        } else {
            response.sendRedirect(request.getContextPath() + "/shop/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
