<%-- 
    Document   : groups
    Created on : Sep 8, 2015, 10:26:45 PM
    Author     : Kamran
--%>
        
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>
<%@page import="SourceClasses.Group"%>        
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="SourceClasses.DB"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <h2 class="text-center">Groups</h2>
    
    <div class="col-md-1"></div>
    <div class="list-group col-md-10" style="margin-top:20px;">
        <% 
        
            DB db=new DB();
            Connection con=db.connectDB();
            
            if(request.getParameter("groupToDelete")!=null)
            {
                db.deleteGroup(con, request.getParameter("deleteGroup_id"));
            }
            
            con=db.connectDB();
            
            List<Group> groups=db.getAllGroups(con);
            pageContext.setAttribute("listOfGroups", groups);
            
        %>
            <c:forEach var="item" items="${listOfGroups}" >
                        
                <a href="<c:url value="groupDetails.jsp">
                    <c:param name="group_id" value="${item.getGroup_id()}"/>
                    <c:param name="created_by_idfk" value="${item.getCreated_by_idfk()}"/>
                    <c:param name="group_name" value="${item.getGroup_name()}"/>
                    <c:param name="description" value="${item.getDescription()}"/>
                    <c:param name="privacy_level_idfk" value="${item.getPrivacy_level_idfk()}"/>
                    <c:param name="create_dt" value="${item.getCreate_dt()}"/>
                    <c:param name="update_dt" value="${item.getUpdate_dt()}"/>
                    </c:url>"
                   class="list-group-item">
                    <c:out value="${item.getGroup_name()}" />
                </a>
                
                
                <form name="groupToDelete" method="POST" action="groups.jsp" id="groupToDelete" class="form-horizontal" role="form">
                    <input type="hidden" id="deleteGroup_id" type="text" class="form-control" name="deleteGroup_id" value="${item.getGroup_id().toString()}">
                    <button name="groupToDelete" type="submit" class="btn btn-primary"><i class="icon-hand-right"></i> Delete</button> 
                </form>
            </c:forEach>
    </div>
    <div class="col-md-1"></div>
