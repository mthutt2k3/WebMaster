<%-- 
    Document   : MainPage
    Created on : Oct 5, 2023, 4:58:40 PM
    Author     : lap21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Users.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    session = request.getSession(false);
    Users xUser = new Users();
    if (session.getAttribute("user") != null) {
       xUser = (Users) session.getAttribute("user");
    } else {
        response.sendRedirect("/_WebMaster/client/index.html");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>WEB MASTER</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="/_WebMaster/assests/css/style.css"/>
    </head>
    <body>
        <!--nav bar-->
        <%@include file="/navigator/Navbar.jsp" %>
        <%@include file="/navigator/Toast.jsp" %>
        <!--Main page information-->
        <div id="home" style="height: 915px; background-image: url(/_WebMaster/assests/images/background/MainPage.png)">
            <div class="landing-text">
                <h1>WEB MASTER</h1>
                <h3>Zero to hero PRJ30x</h3>
                <a href="#page1" class="btn btn-info">Get Started</a>
            </div>
        </div>

        <!--Second page information-->
        <div class="wrapper bg-dark" id="page1">
            <div class="container main">
                <div class="row" style="background-image: url(/_WebMaster/assests/images/background/FramePage-1.png);">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6 right">
                        <div class="text-box">
                            <header>Preparartion for subject</header>
                            <div class="button-field">
                                <a type="button" href="https://download.oracle.com/java/17/archive/jdk-17.0.9_windows-x64_bin.exe" class="button-link">
                                    1. Install JDK 17.0.9 [Windows-x86]
                                </a>
                                <a type="button" href="https://www.filepuma.com/download/apache_tomcat_10.1.11-35716/download/?fbclid=IwAR1v5p_wQXuofMAeIbQLztnKpE2LWyD59rsYE_yYIWkwGpQFYTPDTGhqpgM" class="button-link">
                                    2. Install Apache Tomcat 10.1.11
                                </a>
                                <a type="button" href="https://archive.apache.org/dist/netbeans/netbeans-installers/17/Apache-NetBeans-17-bin-windows-x64.exe" class="button-link">
                                    3. Install Netbeans 17
                                </a>
                                <a type="button" href="https://download.microsoft.com/download/7/f/8/7f8a9c43-8c8a-4f7c-9f92-83c18d96b681/SQL2019-SSEI-Expr.exe" class="button-link">
                                    4. Install SQL Server 2019
                                </a>
                            </div> 
                        </div>  
                    </div>
                </div>
            </div>
            
        <!--Third page information-->
        <div class="wrapper bg-dark">
            <div class="container main">
                <div class="row" style="background-image: url(/_WebMaster/assests/images/background/FramePage-2.png);">
                    <div class="col-md-6 right">
                        <div class="text-box">
                            <header>Material</header>
                            <div class="button-field">
                                <a type="button" href="https://www.w3schools.com/html/" class="button-link">
                                    HTML
                                </a>
                                <a type="button" href="https://www.w3schools.com/css/" class="button-link">
                                    CSS
                                </a>
                                <a type="button" href="https://getbootstrap.com/docs/versions/" class="button-link">
                                    BOOTSTRAP
                                </a>
                            </div> 
                        </div>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>