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

@WebServlet(name = "UpdateAdminServlet", value = "/admin/update-account")
public class UpdateAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if (ad.getId_role_admin() != 3) {
            response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
        }else {
            doPost(request, response);
        }
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
            if (ad != null) {
                if (!AdminService_MT.checkUsernameWithRole(ad.getUsername(), ad.getId_role_admin())) {
                    request.getSession().invalidate();
                    response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                } else if (ad.getId_role_admin() == 3) {
                    if (AdminService_MT.checkLogin(username, password) != null) { // đúng mat khau
                        if (password_new != "" && password_new.length() > 8) pass = password_new;
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
                                WritingLogUtils.writeLog(request, log);
                            } else {
                                log = new Log(Log.WARNING, 0 + "", ad.getUsername(), "Sửa tài khoản admin " + username, statusLog);
                                WritingLogUtils.writeLog(request, log);
                            }
                        } else {
                            response.getWriter().write("fail");
                            statusLog = "Thất bại";
                            log = new Log(Log.INFO, 0 + "", ad.getUsername(), "Sửa tài khoản admin " + username, statusLog);
                            WritingLogUtils.writeLog(request, log);
                        }
                    } else {
                        response.getWriter().write("passfail");
                        statusLog = "Thất bại";
                        log = new Log(Log.INFO, 0 + "", ad.getUsername(), "Sửa tài khoản admin " + username, statusLog);
                        WritingLogUtils.writeLog(request, log);
                    }
                } else {
                    response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                    response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
                }
            }
        } catch (Exception e) {
            response.getWriter().write("error");
            statusLog = "Thất bại";
            log = new Log(Log.INFO, 0 + "", "", "Sửa tài khoản admin " + username, statusLog);
            WritingLogUtils.writeLog(request, log);
        }
    }
}
