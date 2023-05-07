package controller.admin.bill;

import model.shop.Bill_MT;
import service.BillService_MT;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AjaxBillUpdateServlet", value = "/AjaxBillUpdateServlet")
public class AjaxBillUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String IdBill = request.getParameter("IdBill");
        String IdStatusBill = request.getParameter("IdStatusBill");

        try {
            Bill_MT bill = new Bill_MT(Integer.parseInt(IdBill), Integer.parseInt(IdStatusBill));
            boolean checkUpdateBill = BillService_MT.updateInforBill(bill);
            if (checkUpdateBill) response.getWriter().write("true");
            else
                response.getWriter().write("false");
        } catch (Exception e) {
            response.getWriter().write("fail");
        }
    }
}
