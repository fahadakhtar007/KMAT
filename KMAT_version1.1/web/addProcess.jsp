<%-- 
    Document   : addProcess
    Created on : Aug 30, 2015, 11:25:03 AM
    Author     : Kamran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <h2 class="text-center">Add Process Ladder</h2>                    
    
    <div style="margin: 20px;"></div>
    
    <!--Add Data-->
    <!--    <form name="uploadform" action="index.jsp" method="post" enctype="multipart/form-data">
        <input name="file" type="file"  />
        <button name="addData" type="submit" class="btn btn-primary" style="margin: 5px;">Add Data</button>
    </form>-->
                    
    <!--Move to Some Node-->
    <form name="move" action="index.jsp" method="POST" role="form" class="form-horizontal">
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="moveTo" placeholder="Enter node's name you want to move to..." class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="move" style="margin-left: 5px;">Move</button>
    </form>
                    
    <div style="margin: 20px;"></div>
                    
    <!--Add Node-->
    <form name="input" action="index.jsp" method="POST" role="form" class="form-horizontal">
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="nodeName" placeholder="Enter node's name here..." class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="addNode" style="margin-left: 5px;">Add Node</button>
    </form>
    
    <div style="margin: 20px;"></div>
    
    <!--Save the tree-->
    <form name="save" action="index.jsp" method="POST" role="form" class="form-horizontal">
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-success" name="save" style="margin-left: 5px;">Save</button>
        <button type="submit" class="btn btn-danger" name="cancel" style="margin-left: 5px;">Cancel</button>
    </form>
