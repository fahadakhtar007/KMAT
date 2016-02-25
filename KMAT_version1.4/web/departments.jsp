<%-- 
    Document   : departments
    Created on : Nov 17, 2015, 11:14:34 AM
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

    <h2 class="text-center">Departments</h2>
   
    <div class="list-group col-md-6" style="margin-top:20px;">
        <a href="#" class="list-group-item">Computer Science</a>
        <a href="#" class="list-group-item">Mathematics</a>
        <a href="#" class="list-group-item">Physics</a>
        <a href="#" class="list-group-item">Electrical Engineering</a>
        <a href="#" class="list-group-item">Biology</a>
        <a href="#" class="list-group-item">Chemistry</a>
        <a href="#" class="list-group-item">Accounting and Finance</a>
        <a href="#" class="list-group-item">Economics</a>
        <a href="#" class="list-group-item">Anthropology</a>
        <a href="#" class="list-group-item">Sociology</a>
        <a href="#" class="list-group-item">Law</a>
        <a href="#" class="list-group-item">Management Science</a>
        <a href="#" class="list-group-item">Political Science</a>
        <a href="#" class="list-group-item">Economics & Politics</a>
        <a href="#" class="list-group-item">History</a>
    </div>
    <div class="col-md-3"></div>
