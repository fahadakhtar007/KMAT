<%-- 
    Document   : createGroup
    Created on : Sep 8, 2015, 10:27:27 AM
    Author     : Kamran
--%>
        <%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   
    <h2 class="text-center">Create Group</h2>
    
     <div style="margin: 20px;"></div>
     
     
    <form name="groupInfo" action="CreateGroupServlet" method="POST" role="form" class="form-horizontal">
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="groupName" placeholder="Group Name" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        
        <div class="form-group col-md-8">
            <textarea name="description" placeholder="What is this group about?" class="form-control" style="height: 200px;"></textarea> 
        </div>
        
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="members" placeholder="Who do you want to add to the group?" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
          
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <input type="radio" name="Privacy" value="Public" />
        <label>Public</label>
        <input type="radio" name="Privacy" value="Private" />
        <label>Private</label>
        
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="save" style="margin-left: 5px;">Create</button>
        
        
    </form>
 

