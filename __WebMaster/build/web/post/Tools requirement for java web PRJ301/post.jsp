<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Blogs.*" %>
<%
    Blogs blog = (Blogs) request.getAttribute("blog");
%>

<div class="container bg-dark bg-opacity-80" style="min-height: 100vh; margin-top: 70px">
    <div class="row h-auto w-auto">
        <h1 class="text-center text-primary">
            <%=blog.getTitle()%>
        </h1>
    </div>
    <div class="row h-auto w-auto mx-5">
        <a type="button" style="width: 500px" href="https://download.oracle.com/java/17/archive/jdk-17.0.9_windows-x64_bin.exe" class="button-link">
            1. Install JDK 17.0.9 [Windows-x86]
        </a><br>
        <a type="button" style="width: 500px" href="https://www.filepuma.com/download/apache_tomcat_10.1.11-35716/download/?fbclid=IwAR1v5p_wQXuofMAeIbQLztnKpE2LWyD59rsYE_yYIWkwGpQFYTPDTGhqpgM" class="button-link">
            2. Download Apache Tomcat 10.1.11
        </a><br>
        <a type="button" style="width: 500px" href="https://archive.apache.org/dist/netbeans/netbeans-installers/17/Apache-NetBeans-17-bin-windows-x64.exe" class="button-link">
            3. Download Netbeans 17
        </a><br>
        <a type="button" style="width: 500px" href="https://download.microsoft.com/download/7/f/8/7f8a9c43-8c8a-4f7c-9f92-83c18d96b681/SQL2019-SSEI-Expr.exe" class="button-link">
            Download SQL Server 2019
        </a>
    </div>
    <div class="row h-auto w-auto">
        <ul class="mx-3">
            <li class="text-warning">Software 1,2,3 need to be installed in the correct order as above.</li>
            <li class="text-warning">SQL Server can be installed independently.</li>
            <li class="text-warning">However, to try connecting to JDBC, you must have installed 1,2,3 to be able to do so.</li>
        </ul>
        <ul class="mx-3">
            <li class="text-warning">
                If the application needs to access the SQL server database on the Server side, the file is needed: 
                <span>
                    <li class="text-info mx-4">mssql-jdbc-10.2.0.jre17.jar</li>
                </span>
            </li>
            <li class="text-warning">
                Apps that use JSTL (JSP Standard Tag Library) need files: 
                <span>
                    <li class="text-info mx-4">
                        jakarta.servlet.jsp.jstl-2.0.0.jar
                    </li>
                    <li class="text-info mx-4">
                        jakarta.servlet.jsp.jstl-api-2.0.0.jar
                    </li>
                </span>
            </li>
        </ul>
    </div>
    <div class="row h-auto w-auto">
        <h3 style="color: red">
            Note when install NetBeans:
        </h2>
        <p>When installing NetBeans (or Tomcat), the installation program will find the path to the JDK directory. If not found then search for the environment variable named JAVA_HOME. If this variable does not exist or the path value is wrong, an error will be reported.</p>
        <p>In this case, you must right-click on the computer icon, select <span class="text-info">Properties -> Advanced System Setting -> Environment Variables</span></p>
        <p>In the System variables area create a new variable with Variable name JAVA_HOME and Variable value is the path to the JDK directory, for example: </p>
        <p class="fw-bold text-warning">C:\Program Files\Java\jdk-17</p>
    </div>
</div>