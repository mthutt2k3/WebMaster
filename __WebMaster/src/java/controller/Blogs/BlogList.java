package controller.Blogs;

import model.Blogs.BlogsDAO;
import model.Blogs.Blogs;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
public class BlogList extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        BlogsDAO u = new BlogsDAO();
        List<Blogs> lst = u.getListBlogs();
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("client/Blogs/BlogsPage.jsp").forward(request, response);
    }
}
