package controller.Users;

import model.Users.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String xEmail = request.getParameter("email").trim();
        String xPassword = request.getParameter("password").trim();
        String isRemember = request.getParameter("rememberme");
        if(xEmail == null){
            xEmail = "";
        }
        if(xPassword == null){
            xPassword = "";
        }
        UsersDAO dao = new UsersDAO();
        Users x = dao.getUsersByEmail(xEmail);
        String alert = "Wrong email or password!";
        
        if(isRemember != null ){
            String namePass = xEmail + "|" + xPassword;
            Cookie y = new Cookie("currUser",namePass);
            y.setMaxAge(60*60*24); // 1 day
            response.addCookie(y);
        }
        
        HttpSession session = request.getSession();
        if(x == null || !x.getPassword().equals(xPassword)){
            session.setAttribute("email", xEmail);
            session.setAttribute("alert", alert);
            response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }else{
            session.setAttribute("user", x);
            response.sendRedirect("/_WebMaster/client/MainPage.jsp");
        }
    }
}
