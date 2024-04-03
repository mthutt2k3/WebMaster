/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Users;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users.Users;
import model.Users.UsersDAO;

/**
 *
 * @author lap21
 */
public class Register extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String xFirstName, xLastName, xEmail, xPassword, xRePassword;
        xFirstName = request.getParameter("firstName").trim();
        xLastName = request.getParameter("lastName").trim();
        xEmail = request.getParameter("email").trim();
        xPassword = request.getParameter("password").trim();
        xRePassword = request.getParameter("rePassword").trim();
        
        UsersDAO dao = new UsersDAO();
        Users x = new Users(xFirstName, xLastName, xEmail, xPassword);
        
        if(!xPassword.equals(xRePassword)){
            request.setAttribute("user", x);
            request.setAttribute("error", "Password not matched!");
            request.getRequestDispatcher("/client/Users/register.jsp").forward(request, response);
        }else if(dao.getUsersByEmail(xEmail) != null){
            request.setAttribute("user", x);
            request.setAttribute("error", "This email has already exist!");
            request.getRequestDispatcher("/client/Users/register.jsp").forward(request, response);
        }
        else{
            dao.insert(x);
            request.setAttribute("email", xEmail);
            request.setAttribute("password", xPassword);
            request.getRequestDispatcher("login").forward(request, response);
        }
    } 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
}
