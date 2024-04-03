/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author lap21
 */
public class controlDispatch extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String variable, url= "";
        variable = request.getParameter("requestAction");
        switch (variable) {
        //Users
            case "Login":
                url = "login";
                break;
            case "Register":
                url = "register";
                break;
            case "Reset Password":
                url = "resetpassword";
                break;
            case "Manage Users":
                url = "list";
                break;
            case "Sort Users":
                url= "sortusers";
                break;
            case "Logout":
                url = "logout";
                break;
            case "Set Role":
                url = "setrole";
                break;
            case "Profile":
            case "Change password":
            case "Change Information":
            case "Top-up Balance":
                url = "update";
                break;
        //Blogs
            case "Blog Tutorial":
                url = "bloglist";
                break;
        //Products
            case "Manage Product":
            case "Code Store":
                url = "productlist";
                break;
            case "Get Product":
                url = "getproduct";
                break;
            case "Get Product Type":
                url = "getproductbytype";
                break;
            case "Sort Product":
                url= "sortproduct";
                break;
            case "Add Product":
                url="addproduct";
                break;
            case "Update Product":
                url="updateproduct";
                break;
            case "Rate":
                url="rate";
                break;
        //Cart
            case "Add to cart":
                url = "addtocart";
                break;
            case "View Cart":
                url = "cartlist";
                break;
        //Purchased
            case "My Purchased":
                url = "purchasedlist";
                break;
            case "Purchase":
                url = "purchase";
                break;
        //General
            case "Search":
                url = "search";
                break;
            case "Delete":
                url = "delete";
                break;
            default:
                url = "MainPage.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        
    } 
        
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
    }
//
//    /** 
//     * Returns a short description of the servlet.
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>

}
