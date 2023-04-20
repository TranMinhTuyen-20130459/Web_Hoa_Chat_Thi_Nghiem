package controller.admin.account;

import bean.Log;
import database.DB;
import model.admin.Admin;
import service.AdminService_MT;
import utils.CommonString;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddAccountAdminServlet", value = "/admin/add-account")
public class AddAccountAdminServlet extends HttpServlet {
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
        String username = request.getParameter("UserName").replace(" ", "");
        String password = request.getParameter("PassAd").replace(" ", "");
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
            Log log = null;
            if (ad != null) {
                if (!AdminService_MT.checkUsernameWithRole(ad.getUsername(), ad.getId_role_admin())) {
                    request.getSession().invalidate();
                    response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                } else {
                    idUser = 0;
                    nameUser = ad.getFullname();

                    Admin admin = new Admin(username, password, role, status, " ");
                    if (!AdminService_MT.checkUsername(username)) { // kiem tra username
                        // check độ dài mat khau
                        if (password.length() > 8 || username != "" ) {
                            if (AdminService_MT.addAccountAdmin(admin) == 1) {
                                response.getWriter().write("success");
                                statusLog = "Thành công";
                                // nếu tài khoản mới thêm vào có quyền cao nhất thì cảnh báo nguy hiểm
                                if (role == 3) {
                                    log = new Log(Log.DANGER, idUser + "", nameUser, "Thêm tài khoản admin '" + username + "' với quyền super-root", ipAddress, webBrowser, statusLog);
                                } else {
                                    log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin " + username, ipAddress, webBrowser, statusLog);
                                }
                                DB.me().insert(log);
                            } else {
                                statusLog = "Thất bại";
                                log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin " + username, ipAddress, webBrowser, statusLog);
                                response.getWriter().write("fail");
                            }
                        } else {
                            statusLog = "Thất bại";
                            log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin '" + username + "' đã tồn tại", ipAddress, webBrowser, statusLog);
                            response.getWriter().write("exits");
                        }

                    } else { // mật khẩu ngắn hơn 8 kí tự
                        statusLog = "Thất bại";
                        log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin " + username, ipAddress, webBrowser, statusLog);
                        response.getWriter().write("fail");
                    }
                }
                DB.me().insert(log);
            } else {
                response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
            }

        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }
}