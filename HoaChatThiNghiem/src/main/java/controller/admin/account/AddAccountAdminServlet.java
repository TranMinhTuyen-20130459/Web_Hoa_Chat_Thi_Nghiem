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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "AddAccountAdminServlet", value = "/admin/add-account")
public class AddAccountAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if (ad.getId_role_admin() != 3) {
            response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
        } else {
            doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("UserName");
        String password = request.getParameter("PassAd");
        String idRole = request.getParameter("IdRole");
        String idStatus = request.getParameter("IdStatus");
        try {

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
                // kiểm tra xem quyền lúc này có bị thay đổi không
                if (!AdminService_MT.checkUsernameWithRole(ad.getUsername(), ad.getId_role_admin())) {
                    request.getSession().invalidate();
                    response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                } else {
                    idUser = 0;
                    nameUser = ad.getFullname();
                    if (AdminService_MT.checkUsername(username) == null) { // kiem tra username
                        // check độ dài mat khau
                        if (checkData(username, password, idRole, idStatus)) {
                            Integer role = Integer.parseInt(idRole);
                            Integer status = Integer.parseInt(idStatus);
                            Admin admin = new Admin(username, password, role, status, " ");
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
                                DB.me().insert(log);
                            }
                        } else {
                            statusLog = "Thất bại";
                            log = new Log(Log.WARNING, idUser + "", nameUser, "Lỗi nhập dữ liệu", ipAddress, webBrowser, statusLog);
                            response.getWriter().write("invalid");
                            DB.me().insert(log);
                        }

                    } else { // mật khẩu ngắn hơn 8 kí tự
                        statusLog = "Thất bại";
                        log = new Log(Log.WARNING, idUser + "", nameUser, "Thêm tài khoản admin " + username + "' đã tồn tại", ipAddress, webBrowser, statusLog);
                        response.getWriter().write("exists");
                        DB.me().insert(log);
                    }
                }
            } else {
                response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
            }

        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }

    private boolean checkData(String username, String pass, String role, String status) {
        if (username.contains(" ") || username.length() < 3 || username.length() > 50) return false;
        if (pass.contains(" ") || pass.length() < 8) return false;
        if (!isNumber(role)) return false;
        if (!isNumber(status)) return false;
        return true;
    }

    private boolean isNumber(String textnum) {
        String regex = "^\\d+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(textnum);
        return matcher.matches();
    }
}