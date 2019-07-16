<%-- 
    Document   : index
    Created on : 6 Mar, 2019, 9:05:36 PM
    Author     : Pavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document Management</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            ul.quick-links li{
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
 ul.quick-links li:hover{
	padding: 3px 0;
	margin-left:5px;
	font-weight:700;
}
 ul.quick-links li a i{
	margin-right: 5px;
}
 ul.quick-links li:hover a i {
    font-weight: 700;
}
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <img src="img/head.JPG" alt="" style="width: 100%; height: 120px;"/>

            </div>
            <div class="row">
                <div class="col-md-6 ">
                    <div class="login-form">
                    <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">Department Records  </h3>

                            </div>
                        <div class="panel-body" style="height: 200px;">
                        <div class="col-xs-12">
					
					<ul class="list-unstyled quick-links">
						<li><a href="studentdepartment.jsp"><i class="fa fa-angle-double-right"></i>View Student Record</a></li>
						<li><a href="StaffDocument.jsp"><i class="fa fa-angle-double-right"></i>View Staff Record</a></li>
						
					</ul>
				</div>
                        </div>
                        </div>
                        </div>
                </div>
                    
                
                <div class="col-md-6">
                    <div class="login-form">    
            <form action="process.jsp" method="post">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
    	<h4 class="modal-title">Login to Your Account</h4>
        <div class="form-group">
            <input type="text" class="form-control" name="username" placeholder="Username" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
        <div class="form-group small clearfix">
            <label class="checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="#" class="forgot-link">Forgot Password?</a>
        </div> 
        <input type="submit" class="btn btn-primary btn-block btn-lg" name="option" value="login">              
    </form>			
    <div class="text-center small">Don't have an account? <a href="signup.jsp">Sign up</a></div>
</div>
                </div>
            </div>
            <div class="footer">
                <div class="span11">
                    <p><h3>Contact Us</h3>
                    <h4>         
Sacred Heart College (Autonomous),<br/>
Tirupattur-635 601,<br/>
Vellore District,<br/>
Tamilnadu, India.<br/>
Tel: 04179-220553 <br/>
URL : www.shctpt.edu <br/>
Mail: office@shctpt.edu<br/></h4>
                </p>
                    <p>
                    <center> <h2>   &copy; 2019. Powered By PG Department Of Computer Science</h2> </center>
                    </p>
                </div>
            </div>

        </div>
       
    </body>
</html>
