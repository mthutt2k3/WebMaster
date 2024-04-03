package controller;

import model.Blogs.*;
import model.Users.*;
import model.Product.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class Search extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession(false);
        String xInput = request.getParameter("input").trim();
        String xTarget = request.getParameter("target").trim();
        BlogsDAO u = new BlogsDAO();
        ProductDAO proDAO = new ProductDAO();
        UsersDAO uDAO = new UsersDAO();
        List<Blogs> lstBlog = u.searchBlog(xInput);
        List<Product> lstPro = proDAO.searchProduct(xInput);
        String url = "";
        switch (xTarget) {
            case "ProductManage":
                url = "/_WebMaster/client/Product/ProductManage.jsp";
                session.setAttribute("lstProduct", lstPro);
                response.sendRedirect(url);
                break;
            case "UserManage":
                List<Users> lstUser = uDAO.searchUsers(xInput);
                url = "/_WebMaster/client/Users/UserManage.jsp";
                session.setAttribute("lstUsers", lstUser);
                response.sendRedirect(url);
                break;
            case "Search":
                url = "/client/Search.jsp";
                request.setAttribute("lstBlog", lstBlog);
                request.setAttribute("lstProduct", lstPro);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
        
    }
}
