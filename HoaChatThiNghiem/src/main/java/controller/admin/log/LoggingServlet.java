package controller.admin.log;

import bean.Log;
import model.admin.Admin;
import service.AdminService;
import utils.CommonString;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoggingServlet", value = "/admin/logging")
public class LoggingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Admin admin = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if (admin.getId_role_admin() == 3) {
            ArrayList<Log> listLog = (ArrayList<Log>) AdminService.getAllLog();
            request.setAttribute("ListLog", listLog);
            request.getRequestDispatcher("/admin-jsp/logging.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/trang-chu");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
