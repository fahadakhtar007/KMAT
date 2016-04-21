<%-- 
    Document   : processes
    Created on : Feb 25, 2016, 6:08:15 PM
    Author     : Asbah
--%>

        
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
<%@page import="SourceClasses.Process"%>        
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
    <h2 class="text-center">Processes</h2>
    
    <div class="list-group col-md-10" style="margin-top:20px;">
        
        <% 
        
            DB db=new DB();
            Connection con=db.connectDB();
            
            if(request.getParameter("processToDelete")!=null)
            {
                db.deleteProcess(con, request.getParameter("deleteProcess_id"));
            }
            
            
            
            con=db.connectDB();
            List<Process> processes=db.getAllProcesses(con);
            pageContext.setAttribute("listOfProcesses", processes);
        %>
        
             <c:forEach var="item" items="${listOfProcesses}" >
                        
                <a href="<c:url value="processDetails.jsp">
                    <c:param name="process_id" value="${item.getProcess_id()}"/>
                    <c:param name="root_node_idfk" value="${item.getRoot_node_idfk()}"/>
                    <c:param name="process_name" value="${item.getProcess_name()}"/>
                    <c:param name="description" value="${item.getDescription()}"/>
                    <c:param name="create_dt" value="${item.getCreate_dt()}"/>
                    <c:param name="update_dt" value="${item.getUpdate_dt()}"/>
                   </c:url>" 
                   class="list-group-item">
                    <c:out value="${item.getProcess_name()}" />
                </a>
                
                <form name="processToDelete" method="POST" action="processes.jsp" id="processToDelete" class="form-horizontal" role="form">
                    <input type="hidden" id="deleteProcess_id" type="text" class="form-control" name="deleteProcess_id" value="${item.getProcess_id().toString()}">
                    <button name="processToDelete" type="submit" class="btn btn-primary"><i class="icon-hand-right"></i> Delete</button> 
                </form>
            </c:forEach>
        
    </div>
    
    </body>
</html>
