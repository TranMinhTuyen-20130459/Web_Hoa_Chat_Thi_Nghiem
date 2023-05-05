package controller.admin.customer;

import bean.Log;
import model.admin.Admin;
import service.AdminService_MT;
import utils.CommonString;
import utils.WritingLogUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "UpdateCustomerServlet", value = "/admin/update-account-cus")
public class UpdateCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // không phải quyền super-root thì về trang home
        Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if (ad.getId_role_admin() != 2 ||ad.getId_role_admin() != 3) {
            response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
        } else {
            doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("UserName");
        String idRole = "";
        String idStatus = "";
        String password_new = "";
        String fullname = "";
        Log log = null;
        String statusLog = "Thất bại";
        try {
            password_new = request.getParameter("PassAd").replace(" ", "");
            idRole = request.getParameter("IdRole");
            idStatus = request.getParameter("IdStatus");
            fullname = request.getParameter("Fullname").trim();
            Integer role = 0;
            Integer status = 0;
            // nếu là chuỗi số mới parse
            if (isNumber(idRole) && isNumber(idStatus)) {
                role = Integer.parseInt(idRole);
                status = Integer.parseInt(idStatus);
            }
            Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
            if (ad != null) {
                // kiểm tra xem quyền hiện tại có giống quyền lúc đăng nhập vào không
                if (!AdminService_MT.checkUsernameWithRole(ad.getUsername(), ad.getId_role_admin())) {
                    request.getSession().invalidate();
                    response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                    // kiểm tra xem phải quyền super-root và
                } else if (ad.getId_role_admin() == 3) {
                    int roleOld = AdminService_MT.checkUsername(username).getId_status_acc();
                    if (roleOld != 3 ) { // tài khoản này nếu bị khóa vĩnh viễn th không cho cập nhật
                        // kiểm tra xem mật khẩu có bị đổi không
                        if (!isPassword(username, password_new)) { // khong doi
                            // nếu không bị đổi thì gán mật khẩu chính
                            password_new = AdminService_MT.checkUsername(username).getPassAD();
                        }
                        //dữ liêu nhập đã hợp lệ chưa
                        if (checkInvalid(username, password_new, role, status)) {
                            Admin admin = new Admin(username, password_new, role, status, fullname);
                            if (AdminService_MT.updateAccount(admin)) { // update
                                response.getWriter().write("success");
                                statusLog = "Thành công";
                                if (status == 3) { // nếu trạng thái khóa vĩnh viễn
                                    log = new Log(Log.DANGER, 0 + "", ad.getUsername(), "Sửa tài khoản admin '" + username + "' sang trạng thái KHÓA VĨNH VIỄN", statusLog);
                                    WritingLogUtils.writeLog(request, log);
                                }
                                if (status == 2) {// nếu trạng thái tạm khóa
                                    log = new Log(Log.DANGER, 0 + "", ad.getUsername(), "Sửa tài khoản admin '" + username + "' sang trạng thái TẠM KHÓA", statusLog);
                                    WritingLogUtils.writeLog(request, log);
                                }
                                if (role == 3) { // nếu quyền là super-root
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
                            response.getWriter().write("wrong");
                            statusLog = "Thất bại";
                            log = new Log(Log.WARNING, 0 + "", ad.getUsername(), "Nhập sai dữ liệu", statusLog);
                            WritingLogUtils.writeLog(request, log);
                        }
                    }else {
                        response.getWriter().write("seal");
                        statusLog = "Thất bại";
                        log = new Log(Log.WARNING, 0 + "", ad.getUsername(), "Sửa tài khoản đã bị khóa", statusLog);
                        WritingLogUtils.writeLog(request, log);
                    }
                } else {
                    response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                    response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
                }
            } else {
                response.getWriter().write(request.getContextPath() + "/admin/dang-nhap");
                response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
                statusLog = "Thất bại";
                log = new Log(Log.DANGER, 0 + "", "", "Người này không phải admin " + username, statusLog);
                WritingLogUtils.writeLog(request, log);
            }
        } catch (Exception e) {
            response.getWriter().write("error");

        }
    }

    private boolean checkInvalid(String username, String pass, int role, int status) {
        if (AdminService_MT.checkLogin(username, pass) != null || pass.length() > 8) return true;
        else if (role < 3 && role > 0) return true;
        else if (status < 4 && status > 1) return true;
        return false;
    }

    private boolean isNumber(String textnum) {
        String regex = "^\\d+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(textnum);
        return matcher.matches();
    }

    private boolean isPassword(String username, String pass) {
        if (AdminService_MT.checkLogin(username, pass) != null || pass.length() == 0)
            return false;
        else return true;

    }
}

