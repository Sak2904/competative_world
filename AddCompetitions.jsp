<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
    
<!--
    Code Art Solutions
    Project Name: Photo-Competition
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Competition</title>
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
		       .form-text
                      {
                        color:red;
                       }
            .jumbotron{
                //background: url(images/backgrounds/sign-up-2.jpg);
                //background: linear-gradient(to bottom, #ff9966 0%, #ffcc66 100%);
                background-size: 100% 100%;
                opacity:1;
				padding-top : 29px;
            }
            
			.container {
				padding-top : 10px;
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
                background: linear-gradient(to bottom, #336699 0%, #336699 100%);   
            }
            .buttonGradient{
                background: linear-gradient(to bottom, #336699 0%, #336699 100%);   
            }
            .defaultFontColor{
                color:black;
            }
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
			<script src="JS/form_val.js">
		
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

    <body >
	<nav>
		<ul class="menu">
			<li class="logo"><a href="#">Competative World</a></li>
			
			<li class="item button"><a onclick="gotoLogin()" href="#">Log out</a></li>
			<li class="toggle"><span class="bars"></span></li>
		</ul>
	</nav>
        <div class="container">
            <div class="jumbotron">
                <div class="card cardGradient">
                    <div class="card-body">
                        <center> <b class="fontStyle"> Add Competition </b> </center>
                    </div>
                </div>         
                <form name="photoCompForm" class="text-center border border-light p-5" action="AddCompetition" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="text" id="theme_name" name="com_name" class="form-control mb-4" placeholder="Competition Name" onchange="" required Onblur="validateEmpty(this,document.getElementById('NameErr'),'This box should not be empty')"></input>
                                <small id="NameErr" class="form-text ">  </small>
                                                       
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <textarea id="theme_description" name="com_description" class="form-control mb-4" placeholder="Enter Competition Description" onchange="" required Onblur="validateEmpty(this,document.getElementById('AmeErr'),'This box should not be empty')"></textarea>
                                    <small id="AmeErr" class="form-text ">  </small>
                                                      
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputFile" class="bmd-label-floating" align="left" required>Choose start date</label>
                                <input type="date" id="start_date" name="start_date" class="form-control floating-label" placeholder="Date">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputFile" class="bmd-label-floating" align="left" required>Choose end date</label>
                                <input type="date" id="end_date" name="end_date" class="form-control floating-label" placeholder="Date">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputFile" class="bmd-label-floating" align="left" required>Upload Photo</label>
                                <input type="file" class="form-control-file" accept=".jpg,.jpeg,.png" name="com_photo" id="exampleInputFile" onchange="selectedFile(this,'ADMIN'),enableAddThemeButton()"  required>
                                <small align="left">Photo size must be less than 150MB</small>&nbsp;<small id="photoStatus"></small>
                            </div>
                        </div>
                        <!-- Code to select Availble Judges For Competition -->
                        <%
                        	try{
	                        	Class.forName("com.mysql.cj.jdbc.Driver");
	                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
	                            
	                            String q = "Select j_id,j_email,j_name from judge where status = ?";
	                            PreparedStatement smt = c.prepareStatement(q);
	                            
	                            smt.setString(1,"availble");
	                            
	                            ResultSet rs = smt.executeQuery();%>
	                            
                        <div class="col-md-6">
                            <div class="form-group">
                            	<label for="exampleInputFile" class="bmd-label-floating" align="left" required>Choose Judge For Competition</label>
                                 <select type="dropdown" id="" name="judge" class="form-control floating-label" placeholder="Select Judge">
                                <%  while(rs.next()){ %>
                                 <option class="form-control floating-label" value="<%= rs.getInt(1) %>">(<%= rs.getInt(1) %>)&nbsp<%= rs.getString(3) %></option>
                            	<% }%>
                            	</select>
                            </div>
                            
                        </div>
                        <% } catch(Exception ex){
                        		ex.printStackTrace();
                        }%>  
                        
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <button class="btn btn-info my-4 btn-block custom buttonGradient" id="add-theme-button" type="submit">Add Competition</button>
                        </div>                                                
                        <div class="col-md-6">
                            <button class="btn btn-info my-4 btn-block custom buttonGradient" type="reset">Clear</button>
                        </div>                                                
                    </div>
                    
                </form>
            </div>
        </div>
        
        <!-- Custom Scripts -->
		<script type="text/javascript" src="scripts/admin-nav-bar.js"></script>
		<script type="text/javascript" src="scripts/file-type-validation.js"></script>
        <script>
            function enableAddThemeButton(){
                var themeName = document.getElementById("theme_name").value;
                var themeDescription = document.getElementById("theme_description").value;
                var startDate = document.getElementById("start_date").value;
                var endDate = document.getElementById("end_date").value;
                
                if(themeName != "" && themeDescription != "" && startDate != "" && endDate != ""){
                    document.getElementById("add-theme-button").disabled = false;
                }
            }
        </script>
        <!-- MDB - SCRIPTS -->
		<script type="text/javascript" src="MDB-Free/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/popper.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="MDB-Free/js/mdb.min.js"></script>
    </body>
</html>