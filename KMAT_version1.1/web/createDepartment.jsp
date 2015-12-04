<%-- 
    Document   : createDepartment
    Created on : Nov 17, 2015, 10:24:00 AM
    Author     : Kamran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   
    <h2 class="text-center">Create Department</h2>
    
     <div style="margin: 20px;"></div>
     
     
    <form name="groupInfo" action="index.jsp" method="POST" role="form" class="form-horizontal">
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="groupName" placeholder="Department Name" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        
        <div class="form-group col-md-8">
            <textarea name="description" placeholder="Department Info" class="form-control" style="height: 200px;"></textarea> 
        </div>
        
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="members" placeholder="Add People" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
          
        <div class="row"></div>
        
    
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="save" style="margin-left: 5px;">Create</button>
        
        
    </form>
 

