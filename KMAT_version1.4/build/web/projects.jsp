<%-- 
    Document   : groups
    Created on : Sep 9, 2015, 10:31:28 AM
    Author     : Kamran
--%>
        <%@page import="SourceClasses.Project"%>
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page import="SourceClasses.DB"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMAT Login</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    </head> <!--head-->
    
    <body>
    <h2 class="text-center">Projects</h2>
    
    <div class="list-group col-md-10" style="margin-top:20px;">
        
        <% 
        
            DB db=new DB();
            Connection con=db.connectDB();
            
            if(request.getParameter("projectToDelete")!=null)
            {
                db.deleteProject(con, request.getParameter("deleteProject_id"));
            }
            
            
            
            con=db.connectDB();
            List<Project> projects=db.getAllProjects(con);
            pageContext.setAttribute("listOfProjects", projects);
        %>
        
             <c:forEach var="item" items="${listOfProjects}" >
                        
                <a href="<c:url value="projectDetails.jsp">
                    <c:param name="project_id" value="${item.getProject_id()}"/>
                    <c:param name="project_name" value="${item.getProject_name()}"/>
                    <c:param name="description" value="${item.getDescription()}"/>
                    <c:param name="privacy_level" value="${item.getPrivacy_level()}"/>
                    <c:param name="create_dt" value="${item.getCreate_dt()}"/>
                    <c:param name="update_dt" value="${item.getUpdate_dt()}"/>
                   </c:url>" 
                   class="list-group-item">
                    <c:out value="${item.getProject_name()}" />
                </a>
                
                <form name="projectToDelete" method="POST" action="projects.jsp" id="projectToDelete" class="form-horizontal" role="form">
                    <input type="hidden" id="deleteProject_id" type="text" class="form-control" name="deleteProject_id" value="${item.getProject_id().toString()}">
                    <button name="projectToDelete" type="submit" class="btn btn-primary"><i class="icon-hand-right"></i> Delete</button> 
                </form>
            </c:forEach>
        
    </div>
    
    </body>
</html>