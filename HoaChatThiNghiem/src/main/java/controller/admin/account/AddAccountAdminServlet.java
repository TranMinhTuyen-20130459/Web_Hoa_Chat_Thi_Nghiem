package controller.admin.account;

import model.admin.Admin;
import service.AdminService;
import service.AdminService_MT;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddAccountAdminServlet", value = "/AddAccountAdminServlet")
public class AddAccountAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("UserName");
        String password = request.getParameter("PassAd");
        String idRole = request.getParameter("IdRole");
        String idStatus = request.getParameter("IdStatus");
        try {
            Integer role = Integer.parseInt(idRole);
            Integer status = Integer.parseInt(idStatus);
            Admin admin = new Admin(username, password, role, status, " ");
            if (!AdminService_MT.checkUsername(username)) {
                if (AdminService_MT.addAccountAdmin(admin) == 1) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("fail");
                }
            } else {
                response.getWriter().write("exits");
            }

        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }
}