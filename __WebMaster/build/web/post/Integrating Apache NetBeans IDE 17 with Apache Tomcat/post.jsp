<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Blogs.*" %>
<%
    Blogs blog = (Blogs) request.getAttribute("blog");
%>

<div class="container bg-dark bg-opacity-80" style="min-height: 50vh; margin-top: 70px">
    <div class="row h-auto w-auto">
        <h1 class="text-center text-primary">
            <%=blog.getTitle()%>
        </h1>
        <h2 class="text-secondary text-center">Content Uploading... (or never be loaded :<)</h2>
    </div>
</div>