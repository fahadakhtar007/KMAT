<%-- 
    Document   : addProcess
    Created on : Aug 30, 2015, 11:25:03 AM
    Author     : Kamran
--%>
        <%@page import="java.sql.Connection"%>
<%@page import="SourceClasses.DB"%>
<%
        if(session.getAttribute("userID")==null)
        {
           response.sendRedirect("signUp.jsp");
        }
        %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="SourceClasses.Process"%>
<!DOCTYPE html>

    <h2 class="text-center">Add Process Ladder</h2>                    
    
    <div style="margin: 20px;"></div>
    <%
        if(request.getParameter("addProcess")!=null)
        {
            Process process=new Process();
            process.setProcess_name(request.getParameter("process_name"));
            process.setDescription(request.getParameter("description"));
            
            if(request.getParameter("root_node_idfk").isEmpty()!=true)
            {
                process.setRoot_node_idfk(Integer.parseInt(request.getParameter("root_node_idfk")));
            }
            
            DB db=new DB();
            Connection con=db.connectDB();
            db.createProcess(con, process);
            response.sendRedirect("index.jsp");
        }
    %>
                    
    <form name="addProcess" action="addProcess.jsp" method="POST" role="form" class="form-horizontal">
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="process_name" placeholder="Enter Process Name" class="form-control"/>
        </div>
        <div class="col-md-2"></div>
        
        <div class="row"></div>
        
        
        
        <div class="col-md-2"></div>
        <div class="form-group col-md-8">
            <input type="text" name="root_node_idfk" placeholder="Enter root node's ID here..." class="form-control"/>
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

        <button type="submit" class="btn btn-primary" name="addProcess" style="margin-left: 5px;">Add Process</button>
    </form>
<!--    Save the tree
    <form name="save" action="index.jsp" method="POST" role="form" class="form-horizontal">
        <div class="col-md-2"></div>
        <button type="submit" class="btn btn-success" name="save" style="margin-left: 5px;">Save</button>
        <button type="submit" class="btn btn-danger" name="cancel" style="margin-left: 5px;">Cancel</button>
    </form>-->


<%--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	</head>
	<body>
		<style>
			#div1, #div2
			{float:left; width:100px; height:35px; margin:10px;padding:10px;border:1px solid #aaaaaa;}
		</style>
		<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)">
			<img src="img_logo.gif" draggable="true" ondragstart="drag(event)" id="drag1" width="88" height="31">
		</div>

		<div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)"></div>

		<!-- jQuery -->
		<script src="jquery.js"></script>
		<script>
			function allowDrop(ev) {
				ev.preventDefault();
			}

			function drag(ev) {
				ev.dataTransfer.setData("text", ev.target.id);
			}

			function drop(ev) {
				ev.preventDefault();
				var data = ev.dataTransfer.getData("text");
				ev.target.appendChild(document.getElementById(data));
			}
		</script>

	</body>
</html>
--%>