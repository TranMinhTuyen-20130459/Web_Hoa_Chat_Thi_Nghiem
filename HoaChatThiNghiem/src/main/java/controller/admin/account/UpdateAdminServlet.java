package controller.admin.account;

import bean.Log;
import model.admin.Admin;
import service.AdminService_MT;
import utils.CommonString;
import utils.WritingLogUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateAdminServlet", value = "/UpdateAdminServlet")
public class UpdateAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("PassAd").strip();
        String username = request.getParameter("UserName");
        String idRole = request.getParameter("IdRole");
        String idStatus = request.getParameter("IdStatus");
        String password_new = "";
        String fullname = "";
        String pass = "";
        Log log = null;
        String statusLog = "Thất bại";
        try {
            try {
                password_new = request.getParameter("PassNew").strip();
                fullname = request.getParameter("Fullname").trim();
            } catch (Exception e) {
            }
            Integer role = Integer.parseInt(idRole);
            Integer status = Integer.parseInt(idStatus);
            Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
            if (ad != null && ad.getId_role_admin() == 3) {
                if (AdminService_MT.checkLogin(username, password) != null) { // đúng mat khau
                    if (password_new != "") pass = password_new;
                    else pass = password;
                    Admin admin = new Admin(username, pass, role, status, fullname);
                    if (AdminService_MT.updateAccount(admin)) {
                        response.getWriter().write("success");
                        statusLog = "Thành công";
                        if (status == 3) {
                            log = new Log(Log.DANGER, 0 + "", ad.getUsername(), "Sửa tài khoản admin '" + username + "' sang trạng thái KHÓA VĨNH VIỄN", statusLog);
                            WritingLogUtils.writeLog(request, log);
                        }
                        if (status == 2) {
                            log = new Log(Log.DANGER, 0 + "", ad.getUsername(), "Sửa tài khoản admin '" + username + "' sang trạng thái TẠM KHÓA", statusLog);
                            WritingLogUtils.writeLog(request, log);
                        }
                        if (role == 3) {
                            log = new Log(Log.DANGER, 0 + "", ad.getUsername(), "Sửa tài khoản admin '" + username + "' sang quyền SUPER-ROOT", statusLog);
                        } else {
                            log = new Log(Log.WARNING, 0 + "", ad.getUsername(), "Sửa tài khoản admin " + username, statusLog);
                            WritingLogUtils.writeLog(request, log);
                        }
                    } else {
                        response.getWriter().write("fail");
                        log = new Log(Log.INFO, 0 + "", ad.getUsername(), "Sửa tài khoản admin " + username, statusLog);
                        WritingLogUtils.writeLog(request, log);
                    }
                } else {
                    response.getWriter().write("passfail");
                    log = new Log(Log.INFO, 0 + "", ad.getUsername(), "Sửa tài khoản admin " + username, statusLog);
                    WritingLogUtils.writeLog(request, log);
                }
            }
        } catch (Exception e) {
            response.getWriter().write("error");
        }
    }
}
