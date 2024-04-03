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
    <div class="row h-auto w-auto" style="margin-left: 350px">
        <a type="button" style="width: 500px" href="https://www.filepuma.com/download/apache_tomcat_10.1.11-35716/download/?fbclid=IwAR1v5p_wQXuofMAeIbQLztnKpE2LWyD59rsYE_yYIWkwGpQFYTPDTGhqpgM" class="button-link">
            Install Apache Tomcat 10.1.11
        </a><br>
    </div>
    <div class="row h-auto w-auto">
        <h1 class="text-center text-secondary">
            Installing tutorial
        </h1>
    </div>
    <div class="row h-auto w-auto mt-5">
        <div class="col-md-6 side-image" style="background-image: none">
            <img class="img w-100" src="<%=blog.getPath()%>/images/image1.png" alt="">
        </div>
        <div class="col-md-6">
            <div class="text-box">
                <header style="margin-bottom: 10px">Step 1</header>
                <p>Open the installer file then click <span class="text-info">“Next”</span> button, until you see as the left screen</p>
                <ul>
                    <li>By default, the HTTP port is set as <span class="text-info">8080</span>. You can change it but you better keep it for simplicity. Same for Window Service Name</li>
                    <li>You can also set username and password at this step, but it is an optional and you can do it later</li>
                </ul>
            </div>  
        </div>
    </div>
        
    <div class="row h-auto w-auto mt-5">
        <div class="col-md-6">
            <div class="text-box" style="margin-left: 200px">
                <header style="margin-bottom: 10px">Step 2</header>
                <ul>
                    <li>Click <span class="text-info">“Next”</span>, then the installer will ask you for JRE folder. Basically, the installer can automatically detect JRE folder, but in the case it cannot, you can add it manually</li>
                    <li>Click “Next” …. Again then “Finish”</li>
                </ul>
            </div>  
        </div>
        <div class="col-md-6 side-image" style="background-image: none">
            <img class="img w-100" src="<%=blog.getPath()%>/images/image2.png" alt="">
        </div>
    </div>
        
    <div class="row h-auto w-auto mt-5">
        <div class="col-md-6 side-image" style="background-image: none">
            <img class="img w-100" src="<%=blog.getPath()%>/images/image3.png" alt="">
        </div>
        <div class="col-md-6">
            <div class="text-box">
                <header style="margin-bottom: 10px">Step 3</header>
                <p>Normally, you are going to see the app displayed:</p>
                <p class="text-warning">It is ok, this application used to control your TOMCAT webserver, but if you do not see it, do not worry. I recommend you follow below instructions: </p>
                <ul>
                    <li>TOMCAT now is installed as a Window Service (It is a software, but it does not have a graphic user interface)</li>
                    <li>To work with Window Service, press window+R, fill <span class="text-info">service.msc</span></li>
                </ul>
                <img class="img w-100" src="<%=blog.getPath()%>/images/image4.png" alt="">
            </div>  
        </div>
    </div>
            
    <div class="row h-auto w-auto mt-5">
        <div class="col-md-6">
            <div class="text-box" style="margin-left: 200px">
                <header style="margin-bottom: 10px">Step 4</header>
                <ul>
                    <li>Find the <span class="text-info">“TOMCAT service”</span> in the list</li>
                    <li class="text-info">Right click -> properties -></li>
                </ul>
                <img class="img w-100" src="<%=blog.getPath()%>/images/image6.png" alt="">
            </div>  
        </div>
        <div class="col-md-6 side-image" style="background-image: none">
            <img class="img w-100" src="<%=blog.getPath()%>/images/image5.png" alt="">
        </div>
    </div>
        
    <div class="row h-auto w-auto mt-5">
        <div class="col-md-6">
            <div class="text-box" style="margin-left: 200px">
                <header style="margin-bottom: 10px">Step 5</header>
                <ul>
                    <li><span class="text-warning">Now you can start/stop the TOMCAT service. Just make sure it is running before use</span></li>
                    <li><span class="text-warning">You can grant permission for TOMCAT to run with Local System account on the same dialog</span></li>
                </ul>
            </div>  
        </div>
        <div class="col-md-6 side-image" style="background-image: none">
            <img class="img w-100" src="<%=blog.getPath()%>/images/image7.png" alt="">
        </div>
    </div>
<!--    <div class="row h-auto w-auto">
        <p class="">
            End line
        </p>
    </div>-->
</div>