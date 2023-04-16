package controller.admin.bill;

import database.dao.CustomerDao;
import model.admin.Admin;
import model.shop.Bill;
import service.CustomerService;
import utils.CommonString;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminBillsManager", value = "/admin/quan-ly-don-hang-root")
public class AdminBillsManagerServlet extends HttpServlet {
    private final CustomerDao customerDao = new CustomerDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin ad = (Admin) request.getSession().getAttribute(CommonString.ADMIN_SESSION);
        if(ad.getId_role_admin() >= 2){
            List<Bill> bills = CustomerService.getAllBills();
            request.setAttribute("bills", bills);

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin-jsp/bills-manager.jsp");
            dispatcher.forward(request,response);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/admin/trang-chu");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("bill_id");
        String cus = req.getParameter("bill_cus");
        String price = req.getParameter("bill_price");
        String status = req.getParameter("bill_status");
        String address = req.getParameter("bill_address");
        customerDao.updateBill(Integer.parseInt(id), cus, Double.parseDouble(price), extractStatusId(status), address);
        resp.sendRedirect(req.getContextPath() + "/admin/quan-ly-don-hang");
    }

    private int extractStatusId(String status) {
        switch (status) {
            case "bg-success": return 1;
            case "bg-warning": return 2;
            case "bg-info": return 4;
            case "bg-danger": return 3;
        }
        return -1;
    }
}