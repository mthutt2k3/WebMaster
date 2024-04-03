package controller.Users;

import model.Users.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class SortUsers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        UsersDAO u = new UsersDAO();
        String colName = request.getParameter("colName");
        String sortType = request.getParameter("sortType");
        List<Users> lst = u.orderBy(colName, sortType);
        String url = "/_WebMaster/client/Users/UserManage.jsp";
        
        String alert = "Sorted " + colName + " " + sortType;
        session.setAttribute("alert", alert);
        session.setAttribute("lstUsers", lst);
        response.sendRedirect(url);
    }
}
