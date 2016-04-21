<%-- 
    Document   : editProject
    Created on : Feb 24, 2016, 4:38:41 PM
    Author     : Asbah
--%>

        <%@page import="SourceClasses.Project"%>
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
    
</head>
    <h2 class="text-center">Edit Project</h2>
    
     <div style="margin: 20px;"></div>
     
     <%
                Project project=new Project();
                project.setProject_id(Integer.parseInt(request.getParameter("project_id")));
                project.setProject_name(request.getParameter("project_name"));
                project.setDescription(request.getParameter("description"));
                project.setPrivacy_level(request.getParameter("privacy_level"));
                project.setCreate_dt(request.getParameter("create_dt"));
                project.setUpdate_dt(request.getParameter("update_dt"));
     %>
     
    <form name="projectEdit" action="projectDetails.jsp" method="POST" role="form" class="form-horizontal">
        
        <input type="text" name="project_id" hidden="true" value="<%=request.getParameter("project_id")%>"/> 
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="project_name" placeholder="Project Name" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <textarea name="description" placeholder="Add Description" class="form-control" style="height: 200px;"></textarea>
        </div>
        <div class="col-md-2"></div>
          
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <input type="radio" name="privacy_level" value="0" />
        <label>Public</label>
        <input type="radio" name="privacy_level" value="1" />
        <label>Private</label>
        
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="projectEdit" style="margin-left: 5px;">Edit</button>
        
        
    </form>
 

