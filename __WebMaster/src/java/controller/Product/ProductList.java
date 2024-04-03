package controller.Product;

import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class ProductList extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
//        PrintWriter pr = response.getWriter();
        ProductDAO u = new ProductDAO();
        List<Product> lst = u.getListProduct();
        session.setAttribute("lstProduct", lst);
        String action = request.getParameter("action");
        String url="/_WebMaster/client/Product/";
        switch (action) {
            case "ProductPage":
                url += "ProductPage.jsp";
                break;
            case "ProductManage":
                url += "ProductManage.jsp";
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect(url);
    }
}
