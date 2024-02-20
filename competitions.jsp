<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>    

<html>
<head>
	<link rel="stylesheet" href="navbar.css">
	<style>
		body {
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  font-size: 14px;
  line-height: 1.52857143;
  color: #515253;
  background-color: #f5f7fa;
  
}

.widget .panel, .widget.panel {
  overflow: hidden;
}

.widget {
  margin-bottom: 20px;
  border: 0;
}

.row {
   display: flex;

}

.row-table {
  display: table;
  table-layout: fixed;
  height: 100%;
  width: 100%;
  margin: 0;
}



.row-table>[class*=col-] {
  display: table-cell;
  float: none;
  table-layout: fixed;
  vertical-align: middle;
}

.widget .lateral-picture {
  position: relative;
  height: 200px;
  width: auto;  
  overflow: hidden;
  display:flex;
  justify-content: flex-end;
  margin-right: 20px;
}

.widget .lateral-picture>img {

  max-height: 100%;

}

.align-middle {
  vertical-align: middle;
}

.p-lg {
  padding: 5px!important;
}

.btn {
  border-radius: 3px;
  font-size: 13px;
  border-color: transparent;
  -webkit-appearance: none;
  outline: 0!important;
  -webkit-transition: all .1s;
  -o-transition: all .1s;
  transition: all .1s;
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
			function gotoParticipantLogin(){
				window.location = "ParticipantLogin.jsp";
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
		<li class="item button"><a onclick="gotoParticipantLogin()" href="#">Log In</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
	</nav>
<div class="container">
	<% 
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//out.println("Druver found");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
			//out.println("connected");
			
			String q = "select * from competition where end_date >= ?";
			PreparedStatement smt = c.prepareStatement(q);
			
			long millis=System.currentTimeMillis();     
		    java.sql.Date date = new java.sql.Date(millis);
		    
			smt.setDate(1,date);
			
			ResultSet rs = smt.executeQuery();
			
			while(rs.next()){ %>
				
				<div class="row">
				
				<div class="col-md-6">
			      <!-- START widget-->
			      <div class="panel widget">
			         <div class="row row-table row-flush">
			            <div class="col-xs-5">
			               <picture class="lateral-picture">
			                  <img src="<%= rs.getString(8) %>" alt="">
			               </picture>
			            </div>
			            <div class="col-xs-7 align-middle p-lg">
			            <% int r = rs.getInt(1); %>
			               <div class="pull-right"><a href="ParticipantRegistration.jsp?cid=<%= r%>" class="btn btn-primary btn-sm" style="font-size : 19px; color : blue";>Register</a>
			               </div><br>
			               <p>
			                  <strong><h2><%= rs.getString(2) %></h2></strong>
			               </p>
			               <p>
			                  <span class="text-lg"><b><%= rs.getDate(3) %>&nbsp to &nbsp<%= rs.getDate(4) %></b></span></p>
			           
			               <p><%= rs.getString(7) %></p>
			            </div>
			         </div>
			      </div>
			      <!-- END widget-->
				</div>
				
				<% if(!rs.next())
					break;
				
					else {
				%>
				
				<div class="col-md-6">
			      <!-- START widget-->
			      <div class="panel widget">
			         <div class="row row-table row-flush">
			            <div class="col-xs-5">
			               <picture class="lateral-picture">
			                  <img src="<%= rs.getString(8) %>" alt="">
			               </picture>
			            </div>
			            <div class="col-xs-7 align-middle p-lg">
			               <div class="pull-right"><a href="ParticipantRegistration.jsp?cid=<%=rs.getInt(1) %>" class="btn btn-primary btn-sm" style="font-size : 19px; color : blue";>Register</a>
			               </div><br>
			               <p>
			                  <strong><h2><%= rs.getString(2) %></h2></strong>
			               </p>
			               <p>
			                  <span class="text-lg"><b><%= rs.getDate(3) %> &nbsp to &nbsp <%= rs.getDate(4) %></b></span></p>
			               
			               <p><%= rs.getString(7) %></p>
			            </div>
			         </div>
			      </div>
			      <!-- END widget-->
				</div>
				<% } %>
				<!-- end of row -->	
				</div>	
				<hr>
			<% }%>
			
		<% }catch(Exception e){
			e.printStackTrace();
		} %>
</div> 
</div>
</body>
</html>
