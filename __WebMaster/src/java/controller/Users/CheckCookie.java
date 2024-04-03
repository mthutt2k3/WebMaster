package controller.Users;

import model.Users.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class CheckCookie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        UsersDAO dao = new UsersDAO();

        Cookie[] a = request.getCookies();
        String xValue = searchCookie(a, "currUser");
        if (xValue != null) {
            String[] b = xValue.split("[|]+");
            String xEmail = b[0];
            Users x = dao.getUsersByEmail(xEmail);
            HttpSession session = request.getSession();
            session.setAttribute("user", x);
            String alert = "Welcome back, " + x.getFirstName() + " " + x.getLastName();
            session.setAttribute("alert", alert);
            response.sendRedirect("/_WebMaster/client/MainPage.jsp");
        } else {
            Logout logout = new Logout();
            logout.doGet(request, response);
        }
    }

    public static String searchCookie(Cookie[] a, String xName) {
        String u = null;
        if (a == null) {
            return (null);
        }
        for (Cookie x : a) {
            if (x.getName().equals(xName)) {
                return (x.getValue());
            }
        }
        return (u);
    }
}
