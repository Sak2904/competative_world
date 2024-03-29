<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--
    Code Art Solutions
    Project Name: Photo-Competition
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ContactUS</title>
		<!-- Font Awesome -->
		<link rel="stylesheet" href="MDB-Free/font/font-awesome.min.css">
		<!-- Bootstrap core CSS -->
		<link href="MDB-Free/css/bootstrap.min.css" rel="stylesheet">
		<!-- Material Design Bootstrap -->
		<link href="MDB-Free/css/mdb.min.css" rel="stylesheet">
		<!-- Your custom styles (optional) -->
		<link href="MDB-Free/css/style.css" rel="stylesheet">	
		<link rel="stylesheet" href="navbar.css">
		<style type="text/css">
            .jumbotron{
                //background: url(images/backgrounds/sign-up-2.jpg);
                background: linear-gradient(to top, #ffffff 0%, #696969 100%);
                background-size: 100% 100%;
                opacity:1;
            }
            .fontStyle{
                font-size: 20px;
                color: white;
            }
            .cardStyle{
                //opacity:0.8;
            }
			.custom {border-radius: 30px;}
            .cardGradient{
                background: linear-gradient(to right, #66ff33 0%, #00ffff 100%);
            }
            .buttonGradient{
                background: linear-gradient(to right, #cc00cc 0%, #ff3399 100%);
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
			function gotoCompetitions(){
				window.location = "competitions.jsp";
			}

		</script>
    </head>
    <body onload="showNavBar('CONTACT_US')">
        <!--
		<div id="nav-bar-id">
        </div>-->
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
        <br>
        <div class="container">
            <div class="jumbotron">
                <div class="card black">
                    <div class="card-body">
                        <center> <b class="fontStyle"> Contact Us </b> </center>
                    </div>
                </div>         
                <br>
                <div class="card">
                    <div class="card-body text-center">
                        <div class="row">
                            <div class="col-md-4">
                                <p>
                                    <b>Contact No: 020-4040404040 </b>
                                </p>
                            </div>
                            <div class="col-md-4">
                                <p>
                                    <b>
                                    Address: 
                                    Pune<br>
                                    ABC XYZ<br>
                                    Pincode: 443322
                                    </b>
                                </p>
                            </div>
                            <div class="col-md-4">
                                <p>
                                    <b> Website: <a href=""> www.CompetativeWorld.in </a> </b>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>         
                <br>
                
            </div>
        </div>

		<script type="text/javascript" src="scripts/nav-bar.js"></script>
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>
    </body>
</html>