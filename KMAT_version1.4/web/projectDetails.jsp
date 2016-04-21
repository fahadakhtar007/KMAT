<%-- 
    Document   : projectDetails
    Created on : Feb 17, 2016, 9:00:14 PM
    Author     : Pc
--%>

<%@page import="java.sql.Connection"%>
<%@page import="SourceClasses.DB"%>
<%@page import="SourceClasses.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        
        <title>Edit Project</title>
    </head>
    <body>
        <% 
            Project project=new Project();
            
            project.setProject_id(Integer.parseInt(request.getParameter("project_id")));
                project.setProject_name(request.getParameter("project_name"));
                project.setDescription(request.getParameter("description"));
                project.setPrivacy_level(request.getParameter("privacy_level"));
                project.setCreate_dt(request.getParameter("create_dt"));
                project.setUpdate_dt(request.getParameter("update_dt"));
                
            if(request.getParameter("projectEdit")!=null)
            {
                
                DB db=new DB();
                Connection con=db.connectDB();
                String projectID=request.getParameter("project_id");
                db.editProject(con, projectID, project);
            }
        %>
        
        <h2 class="text-center"><%=request.getParameter("project_name")%></h2>
        
    <form name="projectInfo" action="editProject.jsp" method="POST" role="form" class="form-horizontal">
        
        <input type="text" name="project_id" hidden="true" value="<%=project.getProject_id().toString()%>"/> 
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input disabled="true" type="text" name="projectName" placeholder="Project Name" class="form-control" value="<%=project.getProject_name()%>"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <textarea  disabled="true"  name="description" placeholder="Add Description" class="form-control" style="height: 200px;" ><%=project.getDescription()%></textarea>
        </div>
        <div class="col-md-2"></div>
          
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        
        
        <input disabled="true" type="radio" name="privacy_level" value="Public" <% if(project.getPrivacy_level().equalsIgnoreCase("0")) { %>checked="true"  <%}%> />
        <label>Public</label>
        <input disabled="true" type="radio" name="privacy_level" value="Private" <% if(project.getPrivacy_level().equalsIgnoreCase("1")) { %>checked="true"  <%}%> />
        <label>Private</label>
        
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="edit" style="margin-left: 5px;">Edit</button>
        
        
    </form>
        
        
    </body>
</html>
