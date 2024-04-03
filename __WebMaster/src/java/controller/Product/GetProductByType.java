package controller.Product;

import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class GetProductByType extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        ProductDAO u = new ProductDAO();
        String xType = request.getParameter("type");
        String xTarget = request.getParameter("target");
        List<Product> x = u.searchByType(xType);
        String url = "";
        switch (xTarget) {
            case "ProductManage":
                url = "/_WebMaster/client/Product/ProductManage.jsp";
                break;
            case "ProductPage":
                url = "/_WebMaster/client/Product/ProductPage.jsp";
                break;
            default:
                throw new AssertionError();
        }
        session.setAttribute("lstProduct", x);
        response.sendRedirect(url);
    }
}
