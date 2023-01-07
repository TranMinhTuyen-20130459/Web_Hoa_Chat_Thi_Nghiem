package controller.shop.profile;

import database.dao.CustomerDao;
import model.Cart;
import model.CartItem;
import model.Customer;
import model.Order;
import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderHistoryServlet", urlPatterns = "/shop/profile/order-history")
public class OrderHistoryServlet extends HttpServlet {
    private final CustomerDao customerDao = new CustomerDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = (Customer) req.getSession().getAttribute("auth_customer");
        if (customer != null) {
            String orderId = req.getParameter("order_id");
            if (orderId != null) {
                List<CartItem> cartItems = CustomerService.getCartItemsByBillId(Integer.parseInt(orderId));
                Cart cart = (Cart) req.getSession().getAttribute("cart");
                if (cart == null) cart = new Cart();
                for (CartItem item : cartItems) {
                    cart.addProduct(item.getProduct(), item.getQuantity());
                }
                req.getSession().setAttribute("cart", cart);
                resp.sendRedirect(req.getContextPath() + "/shop/cart");
            } else {
                List<Order> orders = CustomerService.getOrderByUser(customer.getId());
                req.setAttribute("orders", orders);
                req.getRequestDispatcher("/shop/order-history.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("cancel");
        if (id != null) {
            customerDao.cancelOrder(Integer.parseInt(id));
        }
        resp.sendRedirect(req.getContextPath() + "/shop/profile/order-history");
    }
}
