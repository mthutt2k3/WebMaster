package controller.Users;

import model.Users.UsersDAO;
import model.Users.Users;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class ShowListUsers extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
//        PrintWriter pr = response.getWriter();
        UsersDAO u = new UsersDAO();
        List<Users> lst = u.getListUsers();
        session.setAttribute("lstUsers", lst);
        response.sendRedirect("/_WebMaster/client/Users/UserManage.jsp");
    }
}
