package controller.Product;

import model.Users.*;
import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;
public class AddProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        } else {
            response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }
        //[productName], [thumbnail], [description], [type], [cost], [source]
        String productName = request.getParameter("productName").trim();
        String thumbnail = request.getParameter("thumbnail");
        String description = request.getParameter("description").trim();
        String type = request.getParameter("type");
        Float cost = Float.parseFloat(request.getParameter("cost"));
        String source = request.getParameter("source");
        
        if(thumbnail == null || thumbnail.length() == 0){
            thumbnail = "null.png";
        }
        if(!source.contains("//")){
            source = "https://shattereddisk.github.io/rickroll/rickroll.mp4";
        }
        Product x = new Product(productName, thumbnail, description, type, cost, source);
        ProductDAO pDAO = new ProductDAO();
        boolean isSourceExist = pDAO.isSourceExist(source);
        if(source.equals("https://shattereddisk.github.io/rickroll/rickroll.mp4")){
                isSourceExist = false;
            }
        if (pDAO.isNameExist(productName) || isSourceExist) {
            String alert = "Product " + productName + " or source already exist!";
            session.setAttribute("x", x);
            session.setAttribute("alert", alert);
            String url = "/_WebMaster/client/Product/AddProduct.jsp";
            response.sendRedirect(url);
        }
        else{
            pDAO.insert(x);
            String alert = "Added Product " + productName + " successfully!";
            List<Product> lst = pDAO.getListProduct();
            session.setAttribute("lstProduct", lst);
            session.setAttribute("alert", alert);
            String url = "/_WebMaster/client/Product/ProductManage.jsp";
            response.sendRedirect(url);
        }
    }
}
