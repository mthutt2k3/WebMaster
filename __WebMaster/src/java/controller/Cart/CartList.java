package controller.Cart;

import model.Cart.Cart;
import model.Cart.CartDAO;
import model.Users.Users;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class CartList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        } else {
            response.sendRedirect("login.jsp");
        }
        CartDAO purDAO = new CartDAO();
        List<Cart> lst = purDAO.getCartOf(xUser.getEmail());
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("/client/Cart/Cart.jsp").forward(request, response);
    }
}
