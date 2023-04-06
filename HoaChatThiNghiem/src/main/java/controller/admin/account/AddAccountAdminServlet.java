package controller.admin.account;

import bean.Log;
import database.DB;
import database.JDBiConnector;
import model.admin.Admin;
import model.shop.Customer;
import service.AdminService;
import service.AdminService_MT;
import utils.CommonString;

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
            Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
            long idUser = -1;
            String nameUser = "Unknown";
            String ipAddress = request.getHeader("X-Forwarded-For");
            if (ipAddress == null) {
                ipAddress = request.getRemoteAddr();
            }
            String webBrowser = request.getHeader("User-Agent");
            String statusLog = "";
            if (ad != null) {
                idUser = 0;
                nameUser = ad.getFullname();
            }
            Log log = null;
            Admin admin = new Admin(username, password, role, status, " ");
            if (!AdminService_MT.checkUsername(username)) {
                if (AdminService_MT.addAccountAdmin(admin) == 1) {
                    response.getWriter().write("success");
                    statusLog = "Thành công";
                    // nếu tài khoản mới thêm vào có quyền cao nhất thì cảnh báo nguy hiểm
                    if (role == 3) {
                        log = new Log(Log.DANGER, idUser + "", nameUser, "Thêm tài khoản admin '" + username+"' với quyền super-root", ipAddress, webBrowser, statusLog);
                    } else {
                        log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin " + username, ipAddress, webBrowser, statusLog);
                    }
                } else {
                    statusLog = "Thất bại";
                    log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin " + username, ipAddress, webBrowser, statusLog);
                    response.getWriter().write("fail");
                }
            } else {
                statusLog = "Thành công";
                log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin '" + username+"' đã tồn tại", ipAddress, webBrowser, statusLog);
                response.getWriter().write("exits");
            }
            DB.me().insert(log);

        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }
}