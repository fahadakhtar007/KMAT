<%-- 
    Document   : editProject
    Created on : Feb 24, 2016, 4:38:41 PM
    Author     : Asbah
--%>

        <%@page import="SourceClasses.Group"%>
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
    
</head>
    <h2 class="text-center">Edit Project</h2>
    
     <div style="margin: 20px;"></div>
     
     <%
                Group group=new Group();
                group.setGroup_id(Integer.parseInt(request.getParameter("group_id")));
                group.setCreated_by_idfk(Integer.parseInt(request.getParameter("created_by_idfk")));
                group.setGroup_name(request.getParameter("group_name"));
                group.setDescription(request.getParameter("description"));
                group.setPrivacy_level_idfk(request.getParameter("privacy_level_idfk"));
                group.setCreate_dt(request.getParameter("create_dt"));
                group.setUpdate_dt(request.getParameter("update_dt"));
        %>
     
     <form name="groupEdit" action="groupDetails.jsp" method="POST" role="form" class="form-horizontal">
        
        <input type="text" name="group_id" hidden="true" value="<%=group.getGroup_id().toString()%>"/> 
        <input type="text" name="created_by_idfk" hidden="true" value="<%=group.getCreated_by_idfk().toString()%>"/> 
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="group_name" placeholder="Group Name" class="form-control"/>
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
        <input type="radio" name="privacy_level_idfk" value="0" />
        <label>Public</label>
        <input type="radio" name="privacy_level_idfk" value="1" />
        <label>Private</label>
        
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="groupEdit" style="margin-left: 5px;">Edit</button>
        
        
    </form>
 

