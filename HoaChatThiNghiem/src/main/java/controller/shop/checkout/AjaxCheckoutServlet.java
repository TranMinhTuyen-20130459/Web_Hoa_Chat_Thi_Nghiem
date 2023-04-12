package controller.shop.checkout;

import model.shop.Bill_MT;
import model.shop.Cart;
import model.shop.Customer;
import service.CheckoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AjaxCheckoutServlet", value = "/AjaxCheckoutServlet")
public class AjaxCheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String NameCustomer = request.getParameter("NameCustomer");
        String PhoneCustomer = request.getParameter("PhoneCustomer");
        String EmailCustomer = request.getParameter("EmailCustomer");
        String City = request.getParameter("City");
        String District = request.getParameter("District");
        String Ward = request.getParameter("Ward");
        String Address = request.getParameter("Address");
        String BillPriceBefore = request.getParameter("BillPriceBefore");

        Customer cus = (Customer) request.getSession().getAttribute("auth_customer");

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Bill_MT bill = new Bill_MT(NameCustomer, PhoneCustomer, EmailCustomer, City, District, Ward, Address, Double.parseDouble(BillPriceBefore));

        boolean addBillAndBillDetail = CheckoutService.addBillAndBillDetail(bill, cart, cus.getId() + "-1");

        if (addBillAndBillDetail)
            response.getWriter().write("true");
        else
            response.getWriter().write("false");

    }
}
