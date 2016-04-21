<%-- 
    Document   : groupDetails
    Created on : Feb 25, 2016, 3:19:21 PM
    Author     : Pc
--%>

<%@page import="SourceClasses.Group"%>
<%@page import="java.sql.Connection"%>
<%@page import="SourceClasses.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <title>Edit Group</title>
    </head>
    <body>
        
        <% 
            Group group=new Group();
            
                group.setGroup_id(Integer.parseInt(request.getParameter("group_id")));
                group.setCreated_by_idfk(Integer.parseInt(request.getParameter("created_by_idfk")));
                group.setGroup_name(request.getParameter("group_name"));
                group.setDescription(request.getParameter("description"));
                group.setPrivacy_level_idfk(request.getParameter("privacy_level_idfk"));
                group.setCreate_dt(request.getParameter("create_dt"));
                group.setUpdate_dt(request.getParameter("update_dt"));
                
            if(request.getParameter("groupEdit")!=null)
            {
                
                DB db=new DB();
                Connection con=db.connectDB();
                String groupID=request.getParameter("group_id");
                db.editGroup(con, groupID, group);
            }
        %>
            <h2 class="text-center"><%=request.getParameter("group_name")%></h2>
    
     <div style="margin: 20px;"></div>
     
     
    <form name="groupInfo" action="editGroup.jsp" method="POST" role="form" class="form-horizontal">
        
        <input type="text" name="group_id" hidden="true" value="<%=group.getGroup_id().toString()%>"/> 
        <input type="text" name="created_by_idfk" hidden="true" value="<%=group.getCreated_by_idfk().toString()%>"/> 
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input disabled="true" type="text" name="group_Name" placeholder="Group Name" class="form-control" value="<%=group.getGroup_name()%>"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        
        <div class="form-group col-md-8">
            <textarea disabled="true" name="description" placeholder="What is this group about?" class="form-control" style="height: 200px;"><%=group.getDescription()%></textarea> 
        </div>
        
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input disabled="true" type="text" name="members" placeholder="Who do you want to add to the group?" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
          
        <div class="row"></div>
        
        <div class="col-md-2"></div>
        <input disabled="true" type="radio" name="privacy_level" value="Public" <% if(group.getPrivacy_level_idfk().equalsIgnoreCase("0")) { %>checked="true"  <%}%> />
        <label>Public</label>
        <input disabled="true" type="radio" name="privacy_level_idfk" value="Private" <% if(group.getPrivacy_level_idfk().equalsIgnoreCase("1")) { %>checked="true"  <%}%> />
        <label>Private</label>
        
        <div class="row"></div>
        <div style="margin: 10px;"></div>
        
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-primary" name="edit" style="margin-left: 5px;">Edit</button>
        
        
    </form>
    </body>
</html>
