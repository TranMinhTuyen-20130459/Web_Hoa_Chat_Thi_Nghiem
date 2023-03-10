package controller.admin.log;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AjaxLoggingServlet", value = "/AjaxLoggingServlet")
public class AjaxLoggingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idRole = request.getParameter("IdRoleAdmin");
        try {
            Integer idRoleAdmin = Integer.parseInt(idRole);
            if (idRoleAdmin == 3) {
                response.getWriter().write(request.getContextPath() + "/admin/logging");
            } else {
                response.getWriter().write("fail");
            }
        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }
}
