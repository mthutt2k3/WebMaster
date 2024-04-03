package controller.Cart;

import model.Cart.CartDAO;
import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class AddToCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        response.setContentType("text/html;charset=UTF-8");
        int productID = Integer.parseInt(request.getParameter("productID"));
        String email = request.getParameter("email");
        String productName = request.getParameter("productName");
        CartDAO dao = new CartDAO();
        dao.addCart(productID, email);
        ProductDAO u = new ProductDAO();
        List<Product> lst = u.getListProduct();
        String referringPage = request.getHeader("referer");
       
        
        String alert = "Added " + productName;
        session.setAttribute("alert", alert);
        if (referringPage != null && !referringPage.isEmpty()) {
            response.sendRedirect(referringPage);
        } else {
            request.setAttribute("lst", lst);
            request.getRequestDispatcher("/client/Product/ProductPage.jsp").forward(request, response);
        }
    }
}





