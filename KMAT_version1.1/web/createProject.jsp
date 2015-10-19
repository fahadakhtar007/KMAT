<%-- 
    Document   : createGroup
    Created on : Sep 8, 2015, 10:27:27 AM
    Author     : Kamran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   
    <h2 class="text-center">Create Project</h2>
    
     <div style="margin: 20px;"></div>
     
     
    <form name="projectInfo" action="index.jsp" method="POST" role="form" class="form-horizontal">
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="projectName" placeholder="Project Name" class="form-control"/>
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
        <input type="radio" name="Privacy" value="Public" />
        <label>Public</label>
        <input type="radio" name="Privacy" value="Private" />
        <label>Private</label>
        
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="save" style="margin-left: 5px;">Create</button>
        
        
    </form>
 

