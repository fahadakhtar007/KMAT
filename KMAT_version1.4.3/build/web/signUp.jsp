<%-- 
    Document   : signUp
    Created on : Sep 26, 2015, 5:21:21 PM
    Author     : Kamran
--%>
        
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="SourceClasses.DB"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import ="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--JSP Main Code-->
<%

    if(request.getParameter("signupform") != null)
    { 
        DB db=new DB();
        Connection con=db.connectDB();
        String email=request.getParameter("email");
        String firstName=request.getParameter("firstname");
        String lastName=request.getParameter("lastname");
        String password=request.getParameter("passwd");
        String address=request.getParameter("address");
        String contactNumber=request.getParameter("contactNumber");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String dateString=dateFormat.format(date);
        
        
        db.createNewUser(con,email,password,dateString,dateString);
        
        String userId=db.findUserId( con,  email);
        
        db.createNewUserDetails(con, userId, email,  firstName, lastName, password,  address,  contactNumber,  "",  dateString,  dateString);
        session.setAttribute("userID", userId);
        response.sendRedirect("index.jsp");
    }
    else if(request.getParameter("loginform") != null)
    {
        DB db=new DB();
        Connection con=db.connectDB();
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        
        String userId=db.findUserId( con,  userName);
        
        if(userId!=null)
        {
            session.setAttribute("userID", userId);
            response.sendRedirect("index.jsp");
        }
    }
    else
    {
        out.write(request.getParameter("loginform"));
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KMAT Login</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    </head> <!--head-->
    
    <body>
        
        <div class="container">    
        
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <div style="float:right; font-size: 95%; position: relative; top:-10px"><a href="#">Forgot Password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form name="loginform" method="POST" action="signUp.jsp" id="loginform" class="form-horizontal" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="Username or Email">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="Password">
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <div class="col-sm-12 controls">
                                      <button name="loginform" type="submit" class="btn btn-primary"><i class="icon-hand-right"></i> Login</button> 
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:95%" >
                                            Don't have an account? 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here!
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     



                        </div>                     
                    </div>  
        </div>
        
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <form name="signupform" method="POST" role="form" action="signUp.jsp" class="form-horizontal">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>    
                                  
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="email" placeholder="Email Address">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="firstname" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Last Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="lastname" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="passwd" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-md-3 control-label">Address</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address" placeholder="Address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="contactNumber" class="col-md-3 control-label">Contact Number</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="contactNumber" placeholder="Contact Number">
                                    </div>
                                </div>

                                <div class="form-group">                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button name="signupform" type="submit" class="btn btn-primary"><i class="icon-hand-right"></i> Sign Up</button> 
                                    </div>
                                </div>
                               
                            </form>
                         </div>
                    </div> 
         </div> 
        </div>

        <!-- jQuery -->
        <script src="jquery.js"></script>

    </body>

</html>
    