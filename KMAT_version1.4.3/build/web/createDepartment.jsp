<%-- 
    Document   : createDepartment
    Created on : Nov 17, 2015, 10:24:00 AM
    Author     : Kamran
--%>
        <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="SourceClasses.DB"%>
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   
    <h2 class="text-center">Create Department</h2>
    
     <div style="margin: 20px;"></div>
     
     <%
        if(request.getParameter("deptInfo")!=null)
        {
            DB db=new DB();
            Connection con=db.connectDB();
            //db.createProject(con, null, null, null, null);

            String deptName=request.getParameter("deptName");
            String description=request.getParameter("description");



            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String dateString=dateFormat.format(date);

            db.createDepartment(con, deptName, description, dateString, dateString);    


            response.sendRedirect("index.jsp");
        }
     %>
    <form name="deptInfo" action="createDepartment.jsp" method="POST" role="form" class="form-horizontal">
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="deptName" placeholder="Department Name" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <textarea name="description" placeholder="Add Description" class="form-control" style="height: 200px;"></textarea>
        </div>
        <div class="col-md-2"></div>
          
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="deptInfo" style="margin-left: 5px;">Create</button>
        
        
    </form>
 


