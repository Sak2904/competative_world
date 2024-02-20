<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AboutUS</title>
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
<body>
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
                        <center> <b class="fontStyle"> About Us </b> </center>
                    </div>
                </div>         
                <br>
                <div class="card">
                    <div class="card-body">
                        <p>
                            Competitive World  is a Web Based Application Which conducts/organizes different 
							types of competitions in online mode.
							This site can be accessible universally anyone can participate in competitions if  
							they full fill given criteria. This system provides easy service to competitors as
							well to organizers to conduct competitions in online mode .
							We usually come across areas where everyone can show their skills and talent. Using our system they can show their talent and skills.
							Peoples who are interested to take part into competitions they have register for competitions through our system, After completion of registration  participant have to submit all their competition related documents/files/images  into our System by end of Deadline scheduled by organizers.

                        </p>
                    </div>
                </div>         
                <br>
                <div class="card black">
                    <div class="card-body">
                        <center> <b class="fontStyle"> Our Competition Organizers </b> </center>
                    </div>
                </div>     
                <br>                
                <div class="row">
                    <div class="col-md-4 bottom">
                        <div class="card hoverable">
                            <img class="card-img-top hoverable" src="images/experts-images/expert-1.jpg" alt="photo">
                            <div class="card-body">
                                <h4 class="card-title"><a>Dheeraj Paul</a></h4>
                                <p class="card-text">
                                    Versatile Photographer <br>
                                    Delhi <br>
                                    Family of legends
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 bottom">
                        <div class="card hoverable">
                            <img class="card-img-top hoverable" src="images/experts-images/expert-2.jpg" alt="photo">
                            <div class="card-body">
                                <h4 class="card-title"><a>Ranu Mistry</a></h4>
                                <p class="card-text">
                                    Wedding Master <br>
                                    Vadodra <br><br>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 bottom">
                        <div class="card hoverable">
                            <img class="card-img-top hoverable" src="images/experts-images/expert-3.png" alt="photo">
                            <div class="card-body">
                                <h4 class="card-title"><a>Gurudas Dua</a></h4>
                                <p class="card-text">
                                    Commercial <br>
                                    Indore <br>
                                    Potrait Master
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<script type="text/javascript" src="scripts/nav-bar.js"></script>
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>
    </body>
</html>