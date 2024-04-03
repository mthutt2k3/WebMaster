package controller;

import model.Cart.*;
import model.Users.*;
import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;
import model.Product.ProductDAO;

public class Delete extends HttpServlet {
    /**
     * This function can delete an Users or a Cart 
     * @param request
     * @param response
     * @throws jakarta.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        } else {
            response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }

        String xEmail = request.getParameter("email");
        String cartID = request.getParameter("cartID");
        String sProductID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String url="", alert ="";
        //Delete an Product
        if(sProductID != null){
            int productID = Integer.parseInt(sProductID);
            ProductDAO u = new ProductDAO();
            u.delete(productID);
            session.setAttribute("lstProduct", u.getListProduct());
            alert = "Deleted " + productName;
        }
        //Delete an User
        if(xEmail != null){
            UsersDAO u = new UsersDAO();
            u.deleteByEmail(xEmail);
            session.setAttribute("lstUsers", u.getListUsers());
            alert = "Deleted " + xEmail;
        }
        //Delete an Cart item
        if(cartID != null){
            int xCartID = Integer.parseInt(cartID);
            CartDAO dao = new CartDAO();
            dao.deleteByID(xCartID);
            alert= "Removed " + productName + " from cart!";
        }
        url = request.getHeader("referer");
        //Save notification
        session.setAttribute("alert", alert);
        if (url != null && !url.isEmpty()) {
            response.sendRedirect(url);
        } else {
            response.sendRedirect("/_WebMaster/client/MainPage.jsp");
        }
    }
}
