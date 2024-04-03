package controller.Blogs;

import model.Blogs.BlogsDAO;
import model.Blogs.Blogs;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class GetPost extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter pr = response.getWriter();
        BlogsDAO u = new BlogsDAO();
        int xId = Integer.parseInt(request.getParameter("id"));
        Blogs x = u.getBlog(xId);
        request.setAttribute("blog", x);
        request.getRequestDispatcher("client/Blogs/PostPage.jsp").forward(request, response);
    }
}
