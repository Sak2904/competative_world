<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
        
<!DOCTYPE html>
<html>
<head>
 <title>Cards</title>
 <link rel="stylesheet" href="navbar.css">

<style type="text/css">


*{
 margin: 0px;
 padding: 0px;
}
body{
 font-family: arial;
}
.main{

 margin: 2%;
}

.card{
     width: 20%;
	 height: 20%;
	 
     display: inline-block;
     box-shadow: 2px 2px 20px black;
     border-radius: 5px; 
     margin: 2%;
    }

.image img{
  width: 246px;
  height : 200px;
  border-top-right-radius: 5px;
  border-top-left-radius: 5px;
 }

.title{
 
  text-align: center;
  padding: 10px;
  
 }

h1{
  font-size: 20px;
 }

.des{
  padding: 3px;
  text-align: center;
 
  padding-top: 10px;
        border-bottom-right-radius: 5px;
  border-bottom-left-radius: 5px;
}
button{
  margin-top: 40px;
  margin-bottom: 10px;
  background-color: white;
  border: 1px solid black;
  border-radius: 5px;
  padding:10px;
}
button:hover{
  background-color: black;
  color: white;
  transition: .5s;
  cursor: pointer;
}
	
</style>
<script>
function gotoHome(){
	
	window.location = "homePage.jsp";
}

function gotoLogin(){
	
	window.location = "login.jsp";
}

</script>
</head>
<body>
<nav>
	<ul class="menu">
		<li class="logo"><a role="button" onclick="gotoHome()" href="#">Competative World</a></li>
		
		<li class="item button"><a role="button" onclick="gotoLogin()" href="#">Log out</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>

<div class="main">

<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
	    
	    String q = "select part_compi.psphoto,participant.name,part_compi.description,part_compi.email from participant,part_compi,competition where participant.email = part_compi.email and part_compi.cid = competition.cid and part_compi.cid = ? and part_compi.status = ?";
	    PreparedStatement smt = c.prepareStatement(q);
	    
	    smt.setInt(1,cid);
	    smt.setString(2,"completed");
		//smt.setString(3,"yes");	
			
	    ResultSet rs = smt.executeQuery();%>
	
		
		<%  while(rs.next()){ %>
           
			<div class="card" style="">
			
				<div class="image">
				   <img src="<%= rs.getString(1)%>">
				</div>
				<div class="title">
				<h1><%=rs.getString(2)%></h1>
				</div>
				<div class="des">
				 <p><%= rs.getString(3)%></p>
				 
				<a href="judgeEvaluateSub.jsp?pid=<%=rs.getString(4) %>&cid=<%=cid%>"><button style="">Points</button></a>	 
				</div>
			</div>
	<% }
	
	 } catch(Exception ex){
         	ex.printStackTrace();
   	  }%>

</div>
</body>
</html>