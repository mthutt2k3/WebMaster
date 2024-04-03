package controller.Cart;
//Ajax method
import model.Cart.*;
import model.Users.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class GetNumberOfOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        Users xUser = new Users();
        if (session.getAttribute("user") != null) {
           xUser = (Users) session.getAttribute("user");
        } else {
            response.sendRedirect("login.jsp");
        }
        try (PrintWriter out = response.getWriter()) {
            CartDAO dao = new CartDAO();
            int numberOfOrder = dao.getCartOf(xUser.getEmail()).size();
            out.print(numberOfOrder);
            out.flush();
        }
    }
}
