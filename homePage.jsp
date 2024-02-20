<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Competative World</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="navbar.css">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    .container {
      max-width: 1100px;
    }

    body {
      font-size: 14px;
    }

  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  .img-responsive{
	max-height : 200px;
  }
  </style>
  <script>
	function gotoHome(){
		window.location = "homePage.jsp";
	}
	function gotoContact(){
		window.location = "contactUs.jsp";
	}
	function gotoAbout(){
		window.location = "AboutUs.jsp";
	}
	function gotoLogin(){
		window.location = "login.jsp";
	}
	function gotoCompi_dash(){
		window.location = "compi_dash.jsp";
	}
	function gotoPLogin(){
		
		window.location = "participantLogin.jsp";
	}
	function gotoCompetitions(){
		window.location = "competitions.jsp";
	}

  
  </script>
</head>
<body>
<nav>
	<ul class="menu">
		<li class="logo"><a role="button" onclick="gotoHome()" href="#">Competative World</a></li>
		<li class="item"><a role="button" onclick="gotoHome()" href="#">Home</a></li>
		<li class="item"><a role="button" onclick="gotoCompetitions()" href="#">Competitions</a></li>
		<li class="item"><a role="button" onclick="gotoAbout()" href="#">About</a></li>
		<li class="item"><a role="button" onclick="gotoContact()" href
 href="#">Contact</a></li>
		</li>
		<li class="item button"><a role="button" onclick="gotoLogin()" href="#">Log In</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
<!--
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Competitive World</a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#" role = "button" onclick = "gotoHome()">Home</a></li>
        <li><a href="#" role = "button" onclick = "">Competitions</a></li>
        <li><a href="#" id = "about" role="button" onclick="gotoAboutUs()">About</a></li>
        <li><a href="#" role="buttin" onclick="gotoContactUs()">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" role = "button" onclick = "gotoAdmin()"><span class="glyphicon glyphicon-log-in" ></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
-->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/slider.jpg" style="height:200px;"alt="Image">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="images/slider2.png" style="height:200px;"alt="Image">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h3><b>COMPETITIONS</b></h3><br>
  <div class="row">
    <div class="col-sm-4">
      <img src="images/2998424.jpg" class="img-responsive" style="border:1px solid black; width:100%" alt="Image">
      <a role = "button" href="compi_dash.jsp?comp=photography" style = "color : black"><b>Photography</b></a>
    </div>
    <div class="col-sm-4"> 
      <img src="images/pst1.jpg" class="img-responsive" style="border:1px solid black; width:100%" alt="Image">
      <a role = "button" href="compi_dash.jsp?comp=poster" style = "color : black"><b>Poster Making</b></a>    
    </div>
    <div class="col-sm-4">
      <img src="images/flower.jpg" class="img-responsive" style="border:1px solid black; width:100%" alt="Image">
      <a role = "button" href="compi_dash.jsp?comp=flower" style = "color : black"><b>Flower Arrangement</b></a>    
    </div>    
  </div><br>
  
	<div class="row">
    <div class="col-sm-4" >
      <img src="images/s3.jpg" class="img-responsive" style="border:1px solid black; width:100%;" alt="Image">
      <a role = "button" href="compi_dash.jsp?comp=painting" style = "color : black;"><b>Sketches</b></a>
    </div>
    <div class="col-sm-4"> 
      <img src="images/p8.jpg" class="img-responsive" style="border:1px solid black; width:100%" alt="Image">
      <a role = "button" href="compi_dash.jsp?comp=drawing" style = "color : black"><b>Drawing</b></a>    
    </div>
    <div class="col-sm-4">
      <img src="images/d7.jpg" class="img-responsive" style="border:1px solid black; width:100%" alt="Image">
      <a role = "button" href="compi_dash.jsp?comp=decoration" style = "color : black"><b>Decoration</b></a>    
    </div>
      
  </div>
  
</div><br>

<footer class="container-fluid text-center">
  <p><Strong>All Rights are Reserved By @www.CompetativeWorld.com</p>
</footer>

</body>
</html>