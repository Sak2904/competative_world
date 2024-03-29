<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
		<!-- Font Awesome -->
		<link rel="stylesheet" href="MDB-Free/font/font-awesome.min.css">
		<!-- Bootstrap core CSS -->
		<link href="MDB-Free/css/bootstrap.min.css" rel="stylesheet">
		<!-- Material Design Bootstrap -->
		<link href="MDB-Free/css/mdb.min.css" rel="stylesheet">
		<!-- Your custom styles (optional) -->
		<link href="MDB-Free/css/style.css" rel="stylesheet">		
		<link rel="stylesheet" href="navbar.css">
		<style>
		html, body, header, .view {
				height: 100%;
			}
			
			@media (max-width: 740px) {
				html, body, header, .view {
					height: 1000px;
				}
			}
			
			@media (min-width: 800px) and (max-width: 850px) {
				html, body, header, .view {
					height: 650px;
				}
			}
			
			@media (min-width: 800px) and (max-width: 850px) {
				.navbar:not(.top-nav-collapse) {
					background: #1C2331!important;
				}
			}
			.custom {border-radius: 30px;}
			
			.jumbotron1{
				background: rgba(204, 204, 204, 0.3);
				height: 1200px;
				padding-top :10px;
				
			}
			.card1{
				//background: rgba(204, 204, 204, 0.7);
				border-radius: 30px;
			}
			.switch {
			  position: relative;
			  display: inline-block;
			  width: 60px;
			  height: 34px;
			}

			.switch input {display:none;}

			.slider {
			  position: absolute;
			  cursor: pointer;
			  top: 0;
			  left: 0;
			  right: 0;
			  bottom: 0;
			  background-color: rgba(204, 204, 204, 0.5);
			  -webkit-transition: .4s;
			  transition: .4s;
			}

			.slider:before {
			  position: absolute;
			  content: "";
			  height: 26px;
			  width: 26px;
			  left: 4px;
			  bottom: 4px;
			  background-color: white;
			  -webkit-transition: .4s;
			  transition: .4s;
			}

			input:checked + .slider {
			  background-color: #2196F3;
			}

			input:focus + .slider {
			  box-shadow: 0 0 1px #2196F3;
			}

			input:checked + .slider:before {
			  -webkit-transform: translateX(26px);
			  -ms-transform: translateX(26px);
			  transform: translateX(26px);
			}

			/* Rounded sliders */
			.slider.round {
			  border-radius: 34px;
			}

			.slider.round:before {
			  border-radius: 50%;
			}
		</style>
		<script>
			function gotoHome(){
				window.location = "homePage.jsp";
			}
			function gotoAbout(){
				window.location = "AboutUs.jsp";
			}
			function gotoContact(){
				window.location = "contactUs.jsp";
			}
			function gotoLogin(){
				window.location = "login.jsp";
			}
			
			function switchDivision(){
				var switchButton = document.getElementById("switch-button").checked;
				if(switchButton){
					document.getElementById("change-title").innerHTML = "Organizer";
					document.getElementById("competitor-body").style="display:none";
					document.getElementById("admin-body").style="display:block";
				} else {
					document.getElementById("change-title").innerHTML = "Judge";
					document.getElementById("competitor-body").style="display:block";
					document.getElementById("admin-body").style="display:none";
				}
			}
			function gotoCompetitions(){
				window.location = "competitions.jsp";
			}

		</script>
    </head>
    <body onload="switchDivision()">
	<nav>
		<ul class="menu">
			<li class="logo"><a onclick="gotoHome()" href="#">Competative World</a></li>
			<li class="item"><a onclick="gotoHome()" href="#">Home</a></li>
			<li class="item"><a onclick="gotoCompetitions()" href="#">Competitions</a></li>
			<li class="item"><a onclick="gotoAbout()" href="#">About</a></li>
			<li class="item"><a onclick="gotoContact()" href="#">Contact</a></li>
			</li>
			<li class="item button"><a onclick="gotoLogin()" href="#">Log In</a></li>
			<li class="toggle"><span class="bars"></span></li>
		</ul>
	</nav>
		<div class="view full-page-intro" style="background-image: url('login_back.jpg'); background-repeat: no-repeat; background-size: cover;">
			<div class="jumbotron jumbotron1">
				<br><br>
				<div class="row">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
						<div class="card card1">
							<div class="card-header">
								<div class="row">
									<div class="col-md-12" align="center">
										<label class="switch">
											<input type="checkbox" id="switch-button" onchange="switchDivision()">
											<span class="slider round"></span>
										</label>
										<h3 class="card-title">
											<font color="black">
												<b> <p id="change-title"> </p> </b>
											</font>
										</h3>
									</div>
								</div>
							</div>

                            <form action="LoginValidationServlet" method="post">
                                <div class="card-body" id="admin-body">
                                    <div class="md-form mb-5">
                                        <input type="email" id="orangeForm-email" name="adminEmailId" class="form-control validate" required>
                                        <label data-error="wrong" data-success="right" for="orangeForm-email">
                                            <font color="black"><b>  Email </b></font>
                                        </label>
                                    </div>
                                    <div class="md-form mb-5">
                                        <input type="password" id="orangeForm-email" name="adminPassword" class="form-control validate" required>
                                        <label data-error="wrong" data-success="" for="orangeForm-email">
                                            <font color="black"><b>  Password </b></font>
                                        </label>
                                    </div>
                                    <br>
                                    <button type="submit" style="background: linear-gradient(to left, #6600ff 0%, #ff99cc 100%);" class="btn custom btn-block btn-primary">Organizer Login</button>
                                </div>
                            </form>

                            <form action="LoginValidationServlet" method="post">
                                <div class="card-body" id="competitor-body" style="display:none">
                                    <div class="md-form mb-5">
                                        <input type="email" id="orangeForm-email" name="judgeEmailId" class="form-control validate" required>
                                        <label data-error="wrong" data-success="right" for="orangeForm-email">
                                            <font color="black"><b> Email </b></font>
                                        </label>
                                    </div>
                                    <div class="md-form mb-5">
                                        <input type="password" id="orangeForm-email" name="judgePassword" class="form-control validate" required>
                                        <label data-error="wrong" data-success="" for="orangeForm-email">
                                            <font color="black"><b>  Password </b></font>
                                        </label>
                                    </div>
                                    <br>
                                    <button type="submit" style="background: linear-gradient(to left, #6600ff 0%, #ff99cc 100%);" class="btn custom btn-block btn-primary">Judge Login</button>
                                </div>
                            </form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- MDB - SCRIPTS -->
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>
		
    </body>
<html>