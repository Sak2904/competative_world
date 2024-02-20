<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.util.ArrayList" %>

<!--
    Code Art Solutions
    Project Name: Photo-Competition
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Photo Competition | Login</title>
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
			html, body, header, .view {
			
			}
			
			
            .custom {border-radius: 30px;}
            .bottom{
                padding-bottom: 25px;
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
        <div class="container" >
            <div class="jumbotron" style="">
            <div class="row" id="show-competition-response-id">
                <% try{
                    	Class.forName("com.mysql.cj.jdbc.Driver");
                    	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
						String q = "select part_compi.psphoto,participant.name,part_compi.subDate,part_compi.description,result.points from participant,part_compi,competition,result where participant.email = part_compi.email and part_compi.cid = competition.cid and result.pid = part_compi.email and part_compi.cid = result.cid and  part_compi.status = ? and cname like ? order by result.points desc";
                    	PreparedStatement smt = c.prepareStatement(q);
                    	
                    	smt.setString(1,"completed");
                    	smt.setString(2,request.getParameter("comp")+"%");
                    	
                    	ArrayList<String> arrList = new ArrayList<>();
                    	
                    	ResultSet rs = smt.executeQuery();
                    	
                    	while(rs.next()){ %>
                    	
                    	<%  arrList.add(rs.getString(1));
                    		arrList.add(rs.getString(2));
                    		arrList.add(rs.getDate(3).toString());
                    		arrList.add(rs.getString(4));
                    		arrList.add(String.valueOf(rs.getInt(5)));
                    		session.setAttribute("arrList",arrList);
                    	%>
                    	
                    	<div class="col-md-4 bottom">
                        	<div class="card hoverable">
                            	<a href="">
                             	   <img class="card-img-top hoverable" src=<%= rs.getString(1) %> style="height: 300px;" alt="photo">
                            	</a>
                            	<div class="card-body"><br>
                             	   <h4 class="card-title" style="padding-left :50px;"><a><b><%= rs.getString(2) %></b></a></h4>
                             	   <label style="padding-left :100px;"><strong><h3><%=rs.getFloat(5) %>/10</h3></strong></label>
                            	</div>
                        	</div>
                    	</div>
                    	
                    	<% } %>
                    
                    <% }catch(Exception ex){
                    	
                    	ex.printStackTrace();
                    }%>
                 
                </div>
            </div>
        </div>
        
        <!-- Custom Scripts -->
		<script type="text/javascript" src="scripts/admin-nav-bar.js"></script>
        <script type="text/javascript" src="scripts/admin-check-competition-response.js"></script>
        
        <!-- MDB scripts -->
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>
	</body>
</html>