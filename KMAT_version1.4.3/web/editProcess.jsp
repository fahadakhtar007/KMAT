<%-- 
    Document   : editProcess
    Created on : Feb 26, 2016, 4:40:25 PM
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="SourceClasses.Process"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <title>Edit Process</title>
    </head>
    <h2 class="text-center">Edit Process</h2>
    
    <div style="margin: 20px;"></div>
     
     <%
                Process process2=new Process();
                process2.setProcess_id(Integer.parseInt(request.getParameter("process_id")));
//                process.setRoot_node_idfk(Integer.parseInt(request.getParameter("root_node_idfk")));
//                process.setProcess_name(request.getParameter("process_name"));
//                process.setDescription(request.getParameter("description"));
//                process.setCreate_dt(request.getParameter("create_dt"));
//                process.setUpdate_dt(request.getParameter("update_dt"));
     %>
     
        <form name="processEdit" action="processDetails.jsp" method="POST" role="form" class="form-horizontal">
            <input type="text" hidden="true" name="process_id"  value="<%=request.getParameter("process_id")%>"/> 
            <div class="col-md-2"></div>
            <div class="form-group col-md-8">
                <input type="text" name="process_name" placeholder="Process Name" class="form-control" />
            </div>
            <div class="col-md-2"></div>

            <div class="row"></div>



            <div class="col-md-2"></div>
            <div class="form-group col-md-8">
                <input type="text" name="root_node_idfk" placeholder="Root node's ID" class="form-control" />
            </div>
            <div class="col-md-2"></div>

            <div class="row"></div>

            <div class="col-md-2"></div>


            <div class="form-group col-md-8">
                    <textarea name="description" placeholder="Add Description" class="form-control" style="height: 200px;"></textarea>
            </div>

            <div class="row"></div>
            <div style="margin: 20px;"></div>

            <div class="col-md-2"></div>

            <button type="submit" class="btn btn-primary" name="processEdit" style="margin-left: 5px;">Edit</button>
        </form>
        
