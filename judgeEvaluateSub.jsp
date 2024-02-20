<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
       
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
		
		<script>
		
			function gotoLogin(){
				
				window.location = "login.jsp";
			}
		</script>
	</head>
	
    <body onload="">
	<nav>
	<ul class="menu">
		<li class="logo"><a href="homePage.jsp">Competative World</a></li>
		<li class="item button"><a href="login.jsp" onclick="gotoLogin()">Log out</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
		<br>
        <div class="container" >
            <div class="jumbotron">
            
            <%
            
            String pid = request.getParameter("pid");
            int cid = Integer.parseInt(request.getParameter("cid"));
        	
        	try{
        		Class.forName("com.mysql.cj.jdbc.Driver");
        	    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
        	    
        	    String q = "select part_compi.psphoto,participant.name,part_compi.description,part_compi.subDate from participant,part_compi where participant.email = part_compi.email and part_compi.email = ? and part_compi.cid = ?";
        	    PreparedStatement smt = c.prepareStatement(q);
        	    
        	    smt.setString(1,pid);
        	    smt.setInt(2,cid);
        	    
        	    ResultSet rs = smt.executeQuery();%>

				<%  while(rs.next()){ %>
				<form action="JudgeEvaluateSubServlet?pid=<%=pid%>&cid=<%= cid%>" method="post">
                <div class="card hoverable" id="show-competitor-details-id">
                
                    <div><img class="card-img-top hoverable" src="<%= rs.getString(1) %>" alt="photo"></div>
                    <div class="card-body">
                    	
                        <h4 class="card-title">{Competitior Name: <%=rs.getString(2) %>}</h4>
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
                                        <td name="pid" value="<%= pid %>"><b><%= rs.getDate(4) %></b></td>
                                        <td name="cid" value="<%= cid %>"><b><%= rs.getString(3) %></b></td>
                                        
                                        <td ><input name="point" type="text" text-align=center/></td>
									</tr>	
                                </tbody>
                            </table>
                        </p>
                        <button class="btn custom btn-block btn-primary buttonGradient" >Click here to Submit Points</button>
                    <% }
                    
                    }catch(Exception e){
                    	
                    	e.printStackTrace();
                    }%>
                    </div>
                </div>
                </form>
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