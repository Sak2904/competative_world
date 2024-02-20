<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>    
<!--
    Code Art Solutions
    Project Name: Photo-Competition
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Photo View</title>
		<!-- Font Awesome -->
		<link rel="stylesheet" href="MDB-Free/font/font-awesome.min.css">
		<!-- Bootstrap core CSS -->
		<link href="MDB-Free/css/bootstrap.min.css" rel="stylesheet">
		<!-- Material Design Bootstrap -->
		<link href="MDB-Free/css/mdb.min.css" rel="stylesheet">
		<!-- Your custom styles (optional) -->
		<link href="MDB-Free/css/style.css" rel="stylesheet">		
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="navbar.css">
		<style type="text/css">
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
            .bottom{
                padding-bottom: 25px;
            }
            .buttonGradient{
                background: linear-gradient(to left, #6600ff 0%, #ff99cc 100%);
            }
		</style>
	</head>
	
    <body onload="showCompetitorDetails()">
	<nav>
	<ul class="menu">
		<li class="logo"><a href="#">Competative World</a></li>
		<li class="item"><a href="#">Home</a></li>
		<li class="item"><a href="#">Competitions</a></li>
		<li class="item"><a href="#">About</a></li>
		<li class="item"><a href="#">Contact</a></li>
		<li class="item button"><a href="#">Log In</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
		<br>
        <div class="container" >
            <div class="jumbotron">
            <% ArrayList<String> arr = (ArrayList)session.getAttribute("arrList"); %>
                <div class="card hoverable" id="show-competitor-details-id">
                    <img src="<%= arr.get(0) %>" alt="photo">
                    <div class="card-body">
                    
                        <h4 class="card-title"><a>{Competitior Name: <%= arr.get(1)%>}</a></h4>
                        <p class="card-text">
                            <table class="table table-bordered">
                                <thead align="center">
                                    <tr>
                                        <th scope="col"><b>Submission Date</b></th>
                                        <th scope="col"><b>Description</b></th>
                                        
                                        <th scope="col"><b>Points&nbsp;&nbsp;</b></th>
                                    </tr>
                                </thead>
                                <tbody align="center">
                                    <tr>
                                        <td><b><%= arr.get(2)%></b></td>
                                        <td><b><%= arr.get(3)%></b></td>
                                        
                                        <td ><input type="text" /></td>
									</tr>	
                                </tbody>
                            </table>
                            
                        </p>
                        <a href="admin-dashboard.html" class="btn custom btn-block btn-primary buttonGradient" >Click here to Submit Points</a>
                    </div>
                </div>
            </div>
        </div>
		
		<script>
			function showCompetitorDetails(){
                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET","/photo-competition/jsp-pages/show-competitor-details-to-admin.jsp?loginId="+getLoginId(),false);
                xmlhttp.send();
                output = xmlhttp.responseText;
				document.getElementById("show-competitor-details-id").innerHTML = output+"";
			}
            function getLoginId(){
                return getURL().split("=")[1]; 
            }
		</script>
		<script type="text/javascript" src="scripts/get-url.js"></script>
		<script type="text/javascript" src="scripts/nav-bar.js"></script>
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>
	</body>
</html>