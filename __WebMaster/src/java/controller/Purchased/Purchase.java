package controller.Purchased;
/**
 * this function use for both password and information update
*/
import model.Users.*;
import model.Purchased.*;
import model.Cart.*;
import model.Product.*;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.ArrayList;
import java.util.List;
import model.Product.ProductDAO;
public class Purchase extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        } else {
            response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }
        //variable
        String xEmail = xUser.getEmail();
        String alert = null;
        String url = null;
        boolean check = false;
        float moneyNeed = 0;
        float balance = xUser.getBalance();
        List<Product> products = new ArrayList<>();

        
        //Tools
        UsersDAO usersDAO = new UsersDAO();
        CartDAO cartDAO = new CartDAO();
        ProductDAO productDAO = new ProductDAO();
        PurchasedDAO purchasedDAO = new PurchasedDAO();
        
        //get value
        String []sProductIdList = request.getParameterValues("purchaseList");
        String pId = request.getParameter("purchase");
        if(sProductIdList != null){
            for (String pid : sProductIdList) {
                int productID = Integer.parseInt(pid);
                Product x = productDAO.getProduct(productID);
                moneyNeed+= x.getCost();
                products.add(x);
            }
        }

        if(pId != null){
            int productID = Integer.parseInt(pId);
            Product x = productDAO.getProduct(productID);
            moneyNeed+= x.getCost();
            products.add(x);
        }
        //Check transaction
        if(balance >= moneyNeed){
            check = true;
        }
        
        if(check){// Process if enough balance
            for (Product product : products) {
                int xId = product.getId();
                purchasedDAO.purchase(xId, xEmail);
            }
            float remain = balance - moneyNeed;
            usersDAO.updateBalance(xEmail, remain);
            xUser.setBalance(remain);
            alert ="Purchased succesfully!";
        }else{//Process if not enough balance
            alert = "Not enough fund!";
        }
        //get last url
        url = request.getHeader("referer");
        //Save notification
        session.setAttribute("alert", alert);
        if (url != null && !url.isEmpty()) {
            response.sendRedirect(url);
        } else {
            PurchasedList getList = new PurchasedList();
            getList.doGet(request, response);
        }
    }
}
