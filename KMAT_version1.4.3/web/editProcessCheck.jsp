<%-- 
    Document   : editProcessCheck
    Created on : Feb 26, 2016, 5:49:18 PM
    Author     : Asbah
--%>

<%@page import="java.sql.Connection"%>
<%@page import="SourceClasses.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="SourceClasses.Process"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <title>Process Details</title>
    </head>
    <body>
        
        <% 
            Process process=new Process();
            
                process.setProcess_id(Integer.parseInt(request.getParameter("process_id")));
                process.setProcess_name(request.getParameter("process_name"));
                process.setDescription(request.getParameter("description"));
                process.setCreate_dt(request.getParameter("create_dt"));
                process.setUpdate_dt(request.getParameter("update_dt"));
        %>
        
        <h2 class="text-center"><%=request.getParameter("process_name")%></h2>
        
        
        <form name="processEdit" action="processDetails.jsp" method="POST" role="form" class="form-horizontal">
            <input type="text" name="process_id" hidden="true" value="<%=process.getProcess_id().toString()%>"/> 
            <div class="col-md-2"></div>
            <div class="form-group col-md-8">
                <input  type="text" name="process_name" placeholder="Process Name" class="form-control" value="<%=process.getProcess_name()%>"/>
            </div>
            <div class="col-md-2"></div>

            <div class="row"></div>



            <div class="col-md-2"></div>
            <div class="col-md-2"></div>

            <div class="row"></div>

            <div class="col-md-2"></div>


            <div class="form-group col-md-8">
                    <textarea  name="description" placeholder="Add Description" class="form-control" style="height: 200px;"><%=process.getDescription()%></textarea>
            </div>

            <div class="row"></div>
            <div style="margin: 20px;"></div>

            <div class="col-md-2"></div>

            <button type="submit" class="btn btn-primary" name="processEdit" style="margin-left: 5px;">Edit</button>
        </form>
    </body>
</html>
