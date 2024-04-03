package controller.Purchased;
/**
 * this function use for both password and information update
*/
import model.Users.*;
import model.Rate.*;
import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;


public class Rate extends HttpServlet {
    
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
        //Get variable
        String xEmail = xUser.getEmail();
        String sRate = request.getParameter("rate");
        int xProductID = Integer.parseInt(request.getParameter("productid"));
        if(sRate == null){
            sRate = "0";
        }
        int xRate = Integer.parseInt(sRate);
        //get DAO tools
        RateDAO rdao = new RateDAO();
        ProductDAO pDAO = new ProductDAO();
        //Rate
        rdao.rate(xProductID, xEmail, xRate);
        session.setAttribute("lstProduct", pDAO.getListProduct());
        //Send to page
        String alert = "Thank you for rating!^^";
        String url = request.getHeader("referer");
        session.setAttribute("alert", alert);
        response.sendRedirect(url);
    }
}
