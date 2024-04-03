package controller.Users;

import model.Users.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class ResetPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        String xEmail = request.getParameter("email").trim();
        String xOldPassword = request.getParameter("old-password").trim();
        String xPassword = request.getParameter("password").trim();
        String xRePassword = request.getParameter("rePassword").trim();
        
        session.setAttribute("email", xEmail);
        
        UsersDAO dao = new UsersDAO();
        String alert = "";
        String url= "";
        
        Users xUser = dao.getUsersByEmail(xEmail);
        Users x = null;
        
        if(xUser != null){  
            if(xOldPassword.equals(xUser.getPassword())){
                if(xPassword.equals(xRePassword)){
                    if(xUser.isAdmin()){
                        x = new Users(xUser.getFirstName(), xUser.getLastName(), xUser.getEmail(), xPassword, xUser.getBalance(), true, true);
                    }else{
                        x = new Users(xUser.getFirstName(), xUser.getLastName(), xUser.getEmail(), xPassword, xUser.getBalance());
                    }
                    alert = "Update password successfully!";
                    url = "/_WebMaster/client/MainPage.jsp";
                }else{
                    alert = "New password not matched!";
                    url = request.getHeader("referer");
                }
            }else{
                alert = "Wrong Password!";
                url = request.getHeader("referer");
            }
            if(x != null){
                dao.update(xUser.getEmail(), x);
                session.setAttribute("user", x);
            }
        }else{
            alert = "Email not found!";
            url= request.getHeader("referer");
        }
        session.setAttribute("alert", alert);
        response.sendRedirect(url);
    }
}
