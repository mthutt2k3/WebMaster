package controller.Product;
/**
 * this function use for both password and information update
*/
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Product.*;
public class UpdateProduct extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        Product rootProduct = new Product();
        if (session.getAttribute("user") == null) {
           response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }
        if(session.getAttribute("x") != null){
            rootProduct = (Product) session.getAttribute("x");
        }
        //[productName], [thumbnail], [description], [type], [cost], [source]
        String xProductId = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String thumbnail = request.getParameter("thumbnail");
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        String sCost = request.getParameter("cost");
        String source = request.getParameter("source");
        
        ProductDAO pDAO = new ProductDAO();
        Product x;
        if(session.getAttribute("x") == null){
            int id = Integer.parseInt(xProductId);
            x = pDAO.getProduct(id);
            session.setAttribute("x", x);
            session.setAttribute("lstProduct", pDAO.getListProduct());
            String url = "/_WebMaster/client/Product/UpdateProduct.jsp";
            response.sendRedirect(url);
        }else{
            if(thumbnail == null || thumbnail.length() == 0){
                thumbnail = "null.png";
            }
            if(!source.contains("//")){
                source = "https://shattereddisk.github.io/rickroll/rickroll.mp4";
            }
            Float cost = Float.parseFloat(sCost);
            x = new Product(productName, thumbnail, description, type, cost, source);
            boolean isSourceExist = pDAO.isSourceExist(source);
            boolean isNameExist = pDAO.isNameExist(productName);
            if(productName.equals(rootProduct.getProductName())){
                isNameExist = false;
            }
            if(source.equals("https://shattereddisk.github.io/rickroll/rickroll.mp4") || source.equals(rootProduct.getSource())){
                    isSourceExist = false;
            }
            if (isNameExist || isSourceExist) {
                String alert = "Product " + productName + " or source already exist!";
                session.setAttribute("x", x);
                session.setAttribute("alert", alert);
                String url = "/_WebMaster/client/Product/UpdateProduct.jsp";
                response.sendRedirect(url);
            }
            else{
                pDAO.update(rootProduct.getId(), x);
                String alert = "Update product " + rootProduct.getId() + " successfully!";
                String url = "/_WebMaster/client/Product/ProductManage.jsp";
                session.setAttribute("lstProduct", pDAO.getListProduct());
                session.setAttribute("alert", alert);
                session.removeAttribute("x");
                response.sendRedirect(url);
            }
        }
    }
}
