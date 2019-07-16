<%-- 
    Document   : signup
    Created on : Mar 19, 2019, 8:24:43 PM
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
        <script>
            
            $(function() {

    $('#login-form-link').click(function(e) {
    	$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
        </script>
        <script>
            $(document).on("blur", "#stregno", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("RegisterStudent", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                    alert(responseText);           // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
        <div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Student Register</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Staff Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="RegisterStudent" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="name" id="username" tabindex="1" class="form-control" placeholder="Name" value="">
									</div>
									<div class="form-group">
										<input type="text" name="regno" id="stregno" tabindex="2" class="form-control" placeholder="Register No">
									</div>
                                                                    <div class="form-group">
										<input type="date" name="dob" id="password" tabindex="2" class="form-control" placeholder="DOB">
									</div>
                                                                        <div class="form-group">
                                                                            <select name="department" class="form-control" required>
                                                                                <option value="">---Select Department ---</option>
                                                                                <option value="tamil">Tamil</option>
                                                                                <option value="English">English</option>
                                                                                <option value="Economics">Economics</option>
                                                                                <option value="Commerce">Commerce</option>
                                                                                <option value="Commerce CA">Commerce CA</option>
                                                                                <option value="History">History</option>
                                                                                <option value="BBA">BBA</option>
                                                                                <option value="Mathematics">Mathematics</option>
                                                                                <option value="Physics">Physics</option>
                                                                                <option value="Chemistry">Chemistry</option>
                                                                                <option value="Computer Science">Computer Science</option>
                                                                                <option value="Bio-Chemistry">Bio-Chemistry</option>
                                                                                <option value="Micro biology">Micro biology</option>
                                                                                <option value="Computer Application">Computer Application</option>
                                                                                <option value="Software Technology">Software Technology</option>
                                                                                <option value="MSW">MSW</option>
                                                                                <option value="Counseling Psychology">Counseling Psychology</option>
                                                                                <option value="MCA">MCA</option>
                                                                                <option value="MBA">MBA</option>
                                                                            </select>
									</div>
                                                                        <div class="form-group">
                                                                            <select name="gender" class="form-control">
                                                                                <option value="">--- Select Gender ---</option>
                                                                                <option value="male">Male</option>
                                                                                <option value="female">Female</option>
                                                                            </select>
									</div>
                                                                    <div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
                                                                        <div class="form-group">
										<input type="password" name="cpassword" id="password" tabindex="2" class="form-control" placeholder="Conform Password">
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Register Now">
											</div>
										</div>
									</div>
									
								</form>
								<form id="register-form" action="RegisterStaff" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="name" id="username" tabindex="1" class="form-control" placeholder="Name" value="">
									</div>
									<div class="form-group">
										<input type="text" name="staffcode" id="password" tabindex="2" class="form-control" placeholder="Staff Code">
									</div>
                                                                    
                                                                        <div class="form-group">
                                                                            <select name="department" class="form-control">
                                                                                <option value="">---Select Department ---</option>
                                                                                <option value="Tamil">Tamil</option>
                                                                                <option value="English">English</option>
                                                                                <option value="Economics">Economics</option>
                                                                                <option value="Commerce">Commerce</option>
                                                                                <option value="Commerce CA">Commerce CA</option>
                                                                                <option value="History">History</option>
                                                                                <option value="BBA">BBA</option>
                                                                                <option value="Mathematics">Mathematics</option>
                                                                                <option value="Physics">Physics</option>
                                                                                <option value="Chemistry">Chemistry</option>
                                                                                <option value="Computer Science">Computer Science</option>
                                                                                <option value="Bio-Chemistry">Bio-Chemistry</option>
                                                                                <option value="Micro biology">Micro biology</option>
                                                                                <option value="Computer Application">Computer Application</option>
                                                                                <option value="Software Technology">Software Technology</option>
                                                                                <option value="MSW">MSW</option>
                                                                                <option value="Counseling Psychology">Counseling Psychology</option>
                                                                                <option value="MCA">MCA</option>
                                                                                <option value="MBA">MBA</option>
                                                                            </select>
									</div>
                                                                        <div class="form-group">
                                                                            <select name="gender" class="form-control">
                                                                                <option value="">--- Select Gender ---</option>
                                                                                <option value="male">Male</option>
                                                                                <option value="male">Female</option>
                                                                            </select>
									</div>
                                                                    <div class="form-group">
                                                                            <select name="designation" class="form-control">
                                                                                <option value="">--- Select Designation ---</option>
                                                                                <option value="Associate Professor">Associate Professor</option>
                                                                                <option value="Professor">Professor</option>
                                                                            </select>
									</div>
                                                                        <div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
                                                                    <div class="form-group">
										<input type="password" name="cpassword" id="password" tabindex="2" class="form-control" placeholder="Conform Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    </body>
</html>
