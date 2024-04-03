package controller.Users;
/**
 * this function use for both password and information update
*/
import model.Users.UsersDAO;
import model.Users.Users;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class SetRole extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        if (session.getAttribute("user") == null) {
            response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }
        UsersDAO dao = new UsersDAO();
        
        String xEmail = request.getParameter("email");
        String xRole = request.getParameter("role");
        Users x = dao.getUsersByEmail(xEmail);
        String alert = "Set " + x.getEmail() + "to ";
        
        if(xRole.equals("admin")){
            alert += "admin";
            dao.setRole(xEmail, true);
            x.setRole(true);
        }else{
            alert += "user";
            dao.setRole(xEmail, false);
            x.setRole(false);
        }
        session.setAttribute("lstUsers", dao.getListUsers());
        session.setAttribute("alert", alert);
        String url = request.getHeader("referer");
        response.sendRedirect(url);
    }
}
