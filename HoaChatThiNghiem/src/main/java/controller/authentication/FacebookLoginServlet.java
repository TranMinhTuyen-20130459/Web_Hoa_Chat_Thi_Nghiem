package controller.authentication;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FacebookLoginServlet", value = "/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String appId = getServletConfig().getInitParameter("facebook-app-id");
        String appSecret = getServletConfig().getInitParameter("facebook-app-secret");
        String redirectUri = request.getRequestURL().toString();

        String loginUrl = "https://www.facebook.com/v7.0/dialog/oauth?client_id=" + appId +
                "&redirect_uri=" + redirectUri + "&state=facebook_login";

        response.sendRedirect(loginUrl);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
