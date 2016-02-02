<%-- 
    Document   : index
    Created on : Aug 24, 2015, 8:25:17 AM
    Author     : Kamran
--%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="coreservlets.Tree"%>
<%@page import="coreservlets.Node"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMAT</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="simple-sidebar.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
    </head> <!--head-->
  
    <body>
        
        <jsp:useBean id="menu" scope="page" class="coreservlets.UI" />
        <jsp:useBean id="node" scope="page" class="coreservlets.Node" />
        
        <!--JSP declarations-->
        <%! 
            private Tree compTree;
           
            
            private void addNode(String name){
                if(compTree==null){
                    compTree = new Tree(name);
                    compTree.currentNode = compTree.getRoot();
                }
                else
                    compTree.addChild(compTree.currentNode,name);
            }
            
            private void printChildren(JspWriter myOut,Node n){  
                
                ArrayList<Node> children = n.getChildren();
                try{
                   
                    myOut.print("<br/>Children of " + n.getName() + ": ");
                    
                    if( children.isEmpty())
                        myOut.print("null");
                    else{
    
                        for(int i=0;i<children.size();++i){
                            Node child = children.get(i);
                            myOut.print(child.getName() + "\t");
                        }
                        
                        for(int i=0;i<=children.size();++i){
                            Node child = children.get(i);
                            printChildren(myOut,child);
                        }
                    }
                } catch(Exception e){}
            }
        %>
        
        <div id="wrapper">

        <!-- Sidebar -->
        
        
        
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#" id="focus">
                       KMAT
                    </a>
                </li>
                
<!--                <li>
                    <a href="#">Users</a>
                </li>-->
              
                
                <li>
                    <a href="#" onClick="loadContent(2)">Create Project</a>
                </li>
                <li>
                    <a href="#" onClick="loadContent(6)">View Projects</a>
                </li>
                
    
                
                <li>
                    <a href="#" onClick="loadContent(3)">Create Group</a>
                </li>
                <li>
                    <a href="#" onClick="loadContent(7)">View Groups</a>
                </li>
                <li>
                    <a href="#" onClick="loadContent(8)">Create Department</a>
                </li>
                <li>
                    <a href="#" onClick="loadContent(9)">View Departments</a>
                </li>
                <li>
                    <a href="#" onClick="loadContent(4)">Create Process</a>
                </li>
                <li>
                    <a href="#">View Processes</a>
                </li>
                
                <li>
                    <a href="#">Resources</a>
                </li>
                <li>
                    <a href="#">Concept Map</a>
                </li>
   
                
            </ul>
        </div>
        
            <!-- Page Content -->
            <div id="page-content-wrapper">
        
                <!--JSP Main Code-->
                <%

        //            Move to another node
                    if(request.getParameter("move") != null){
                        compTree.currentNode = compTree.search(request.getParameter("moveTo"),compTree.getRoot());
                        out.write("<br/>You are at " + compTree.currentNode.getName() + "<br/>");
                        printChildren(out,compTree.getRoot());
                    }

        //            Add Node
                    if(request.getParameter("addNode") != null){
                        if(request.getParameter("nodeName") != null){
                            out.print(request.getParameter("nodeName") + " was added in the tree.");
                            String name = request.getParameter("nodeName");
                            addNode(name);

                            out.write("<br/>You are at " + compTree.currentNode.getName() + "<br/>");
                            printChildren(out,compTree.getRoot());
                        }
                    }

        //            Add Data
                    if(request.getParameter("addData") != null){
                       out.write("<br/>You are at " + compTree.currentNode.getName() + "<br/>");
                    }
                    String contentType = request.getContentType();
                    if((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)){
                        out.write("You sent something..." + contentType);
                        DataInputStream in = new DataInputStream(request.getInputStream());
                        int maxFileSize = 5000 * 1024;
                        int maxMemSize = 5000 * 1024;
                        int dataLength = request.getContentLength();
                        byte dataBytes[] = new byte[dataLength];

                    }

        //            Save the tree
                    if(request.getParameter("save") != null){
                       try{
                            ObjectOutputStream OOS = null;
                            OOS = new ObjectOutputStream(new FileOutputStream("Backup.ser"));
                            OOS.writeObject(compTree);
                            OOS.close();
                            out.write("<br/>The process ladder has been saved in the database.<br/>");

                            File f = new File(".");
                            out.print(f.getAbsolutePath()); // to print working directory

                       }catch(IOException e){

                            out.write("<br/>There was an error. You lost your data.<br/>");
                            out.println("<div id=\"error\">");
                            e.printStackTrace(new java.io.PrintWriter(out));
                            out.println("</div>");
                        }
                    }
                %>
        
                <!--Toggle sidebar-->
                <div class="row" style="margin-top:20px">
                   <a href="#" class="btn btn-default" id="menu-toggle">Toggle sidebar</a>
                </div>
            </div><!-- page-content-wrapper !-->
                
        </div> <!--wrapper !--> 
            
        <!-- jQuery -->
        <script src="jquery.js"></script>
            
        <!-- Custom Script -->
        <script>    
            document.getElementById('focus').focus();
                
            $("#menu-toggle").click(function(e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
                
            function loadContent(itemNum) {
                if(itemNum === 2)
                    $('#page-content-wrapper').load('createProject.jsp');
                else if(itemNum === 3)
                    $('#page-content-wrapper').load('createGroup.jsp');
                else if(itemNum === 4 )
                $('#page-content-wrapper').load('addProcess.jsp');
                else if(itemNum === 6 )
                    $('#page-content-wrapper').load('projects.jsp');
                else if(itemNum === 7 )
                    $('#page-content-wrapper').load('groups.jsp');
                else if(itemNum === 8 )
                    $('#page-content-wrapper').load('createDepartment.jsp');
                else if(itemNum === 9 )
                    $('#page-content-wrapper').load('departments.jsp');
            }
        </script>
            
    </body>
    
</html>
