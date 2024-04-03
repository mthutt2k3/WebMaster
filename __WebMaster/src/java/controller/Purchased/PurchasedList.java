package controller.Purchased;

import model.Purchased.*;
import model.Users.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class PurchasedList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //Check if User exist or not
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        }else{
            response.sendRedirect("login.jsp");
        }
        //Get List
        PurchasedDAO purDAO = new PurchasedDAO();
        List<Purchased> lst = purDAO.purchasedListOf(xUser.getEmail());
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("/client/Purchased/PurchasedList.jsp").forward(request, response);
    }
}
