package controller.Users;
/**
 * this function use for both password and information update
*/
import model.Users.UsersDAO;
import model.Users.Users;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class Update extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        } else {
            response.sendRedirect("/_WebMaster/client/Users/login.jsp");
        }
        UsersDAO dao = new UsersDAO();
        String xOldPassword = request.getParameter("old-password");
        String xPassword = request.getParameter("password");
        String xRePassword = request.getParameter("rePassword");
        String xFirstName = request.getParameter("firstName");
        String xLastName = request.getParameter("lastName");
        String sBalance =  request.getParameter("balance");
        Users x = null;
        String alert = "", url="";
        if(xOldPassword != null){ //Update password
            if(xOldPassword.equals(xUser.getPassword())){
                if(xPassword.equals(xRePassword)){
                    if(xUser.isAdmin()){
                        x = new Users(xUser.getFirstName(), xUser.getLastName(), xUser.getEmail(), xPassword, xUser.getBalance(), true, true);
                    }else{
                        x = new Users(xUser.getFirstName(), xUser.getLastName(), xUser.getEmail(), xPassword, xUser.getBalance());
                    }
                    alert = "Update password successfully!";
                    url = "/_WebMaster/client/Users/Profile.jsp";
                }else{
                    alert = "New password not matched!";
                    url = request.getHeader("referer");
                }
            }else{
                alert = "Wrong Password!";
                url = request.getHeader("referer");
            }
        }else if(sBalance != null){ //Update balance
            float xBalance = xUser.getBalance() + Float.parseFloat(sBalance);
            if(xUser.isAdmin()){
                x = new Users(xUser.getFirstName(), xUser.getLastName(), xUser.getEmail(), xUser.getPassword(), xBalance, true, true);
            }else{
                x = new Users(xUser.getFirstName(), xUser.getLastName(), xUser.getEmail(), xUser.getPassword(), xBalance);
            }
            url = "/_WebMaster/client/Users/Profile.jsp";
            alert = "Top-up balance successfully!";
        }else{
            if(xUser.isAdmin()){ //Update User information
                x = new Users(xFirstName, xLastName, xUser.getEmail(), xUser.getPassword(), xUser.getBalance(), true, true);
            }else{
                x = new Users(xFirstName, xLastName, xUser.getEmail(), xUser.getPassword(), xUser.getBalance());
            }
            alert = "Update information successfully!";
            url = "/_WebMaster/client/Users/Profile.jsp";
        }
        if(x != null){
            dao.update(xUser.getEmail(), x);
            session.setAttribute("user", x);
        }
        session.setAttribute("alert", alert);
        response.sendRedirect(url);
    }
}
