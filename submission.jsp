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
        <title>Submission</title>
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
                background: linear-gradient(to top, #66ccff 0%, #ffffff 100%);
                background-size: 100% 100%;
                opacity:1;
				padding-top : 20px;
            }
            .fontStyle{
                font-size: 25px;
                color:white;
            }
            .cardStyle{
                //opacity:0.8;
            }
			.custom {border-radius: 30px;}
            .cardGradient{
                background: linear-gradient(to left, #6666ff 0%, #66ccff 100%);
            }
            .buttonGradient{
                background: linear-gradient(to right, #3333cc 0%, #33ccff 100%);
            }
            .defaultFontColor{
                color:black;
            }
		</style>
        <style>
            <!-- This is used for date-picker -->
            [type="date"] {
              background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
            }
            [type="date"]::-webkit-inner-spin-button {
              display: none;
            }
            [type="date"]::-webkit-calendar-picker-indicator {
              opacity: 5;
            }

            /* custom styles */
            label {
              display: block;
            }
            input {
              border: 1px solid #c4c4c4;
              border-radius: 5px;
              background-color: #fff;
              padding: 3px 5px;
              box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
              width: 190px;
            }
            .centerPadding{
                padding-top: 31px;
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
				window.location = "ParticipantLogin.jsp";
			}
			function gotoCompetitions(){
				window.location = "competitions.jsp";
			}
			function gotoParticipantDashboard(){
				
				window.location = "ParticipantDashboard.jsp";
			}

		</script>
    </head>
    <body onload="printShutterValues(), setLoginId()">
	<nav>
	<ul class="menu">
		<li class="logo"><a onclick="gotoHome()" href="#">Competative World</a></li>
		
		<li class="item button"><a  onclick="gotoHome()" href="#">Log out</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
	</nav>
        <br>
        <div class="container">
            <div class="jumbotron">
                <div class="card cardGradient">
                    <div class="card-body">
                        <center> <b class="fontStyle"><%= request.getParameter("cname") %> Competition Submission</b> </center>
                    </div>
                </div>         
                <br>
                <form name="photoCompForm" class="text-center border border-light p-5" action="ParticipantSubServlet" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-12">
                            <textarea type="text" id="photoDescription" name="photoDescription" class="form-control mb-4" placeholder="Photo Description" onchange="" required></textarea>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 centerPadding">
                            <input type="text" id="camera_model" name="cid" class="form-control mb-4" value="<%= request.getParameter("cid") %>" ></input>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputFile" class="bmd-label-floating" align="left" required>Upload Your Photo</label>
                                <input type="file" class="form-control-file" accept=".jpg,.jpeg,.png,.pdf,.docx" name="myPhoto" id="exampleInputFile" required>
                                <small align="left">Photo size must be less than 5MB</small>&nbsp;<small id="photoStatus"></small>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="loginId" name="loginId"></input>
                    <div class="row">
                        <div class="col-md-4">
                            <button class="btn btn-info my-4 btn-block custom buttonGradient" type="submit">Submit Your Entry</button>
                        </div>                                                
                        <div class="col-md-4">                                
                            <button class="btn btn-info my-4 btn-block custom buttonGradient"  type="reset">Clear</button>
                        </div>
                        <div class="col-md-4">                                
                            <button class="btn btn-info my-4 btn-block custom buttonGradient" onclick="gotoParticipantDashboard()" type="reset">Cancel</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		
		<!-- Custom Scripts -->
        <script src="scripts/competition-registration-validation.js"></script>
		<script type="text/javascript" src="scripts/file-type-validation.js"></script>
        <script>
            function setLoginId(){
                var loginId = getURL().split("=")[1];
                document.getElementById("loginId").value = loginId;
            }
        </script>
		<!-- MDB - SCRIPTS -->
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>

    </body>
</html>