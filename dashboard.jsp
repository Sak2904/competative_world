<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="back.Organizer" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Admin Dashboard</title>
	<link rel="stylesheet" href="navbar.css">
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
	 
      table {
        display: grid;
        border-collapse: collapse;
        min-width: 100%;
        grid-template-columns:
          minmax(150px, 1fr)
          minmax(150px, 1fr)
          minmax(150px, 1fr)
          minmax(150px, 1fr)
          minmax(150px, 1fr)
          minmax(150px, 1fr);
        border-collapse: collapse;
        border: 1px solid #ccc;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
          0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }

      thead,
      tbody,
      tr {
        display: contents;
      }

      th,
      td {
        padding: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        background-color: #fff;
      }

      th {
        position: sticky;
        top: 0;
        background: rgb(245, 241, 241);
        text-align: left;
        font-weight: normal;
        font-size: 1.2rem;
        color: rgb(95, 87, 87);
      }

      th:last-child {
        border: 0;
      }

      td {
        padding-top: 10px;
        padding-bottom: 10px;
        color: #000000;
        font-size: 1.1rem;
      }

      /*body {
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
      }*/

      .main-container {
        max-width: 100vw;
        display: flex;
        flex-direction: row;
      }

      .buttons {
        display: flex;
        justify-content: flex-end;
        padding: 20px;
      }

      .buttons .btn {
        border: none;
        height: 50px;
        width: 200px;
        cursor: pointer;
        background-color: rgb(13, 12, 37);
        color: #fff;
        font-weight: bold;
        font-size: 16px;
        border-radius: 5px;
      }

      tr td {
        border-bottom: 2px solid rgb(235, 228, 228);
        padding: 26px;
      }

      td a {
        text-decoration: none;
      }

      .active span{
        padding: 5px;
        border-radius: 12px;
        display: inline-flex;
        background-color: rgb(160, 221, 160);
        color: green;
      }

      .sidebar {
        width: 250px;
        height: 140vh;
        background-color: rgb(13, 12, 37);
        color: #fff;
      }

      .sidebar header {
        padding: 30px;
        margin: 5px;
        
      }

      .sidebar-nav ul {
        padding: 30px;
        list-style-type: none;
      }

      .sidebar ul li {
        padding: 10px;
        font-size: 18px;
        margin-bottom: 20px;
      }

      .sidebar ul li:hover {
        border-bottom: 1px solid #fff;
      }

      .sidebar a {
        text-decoration: none;
        color: #fff;
      }

      .dashboard-container {
        display: flex;
        flex-direction: column;
        padding: 0px 0px;
        width: 100%;
      }

      .header-bar {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        padding: 16px;
        border-bottom: 2px solid rgb(13, 12, 37);
        box-shadow: 1px 2px rgb(13, 12, 37, 0.2);
      }

      .searchbar input {
        height: 30px;
        width: 250px;
        padding: 12px;
        border: 1px solid #6c7ae0;
        border-radius: 5px;
      }

      .profile-btn {
        width: 40px;
        height: 40px;
        background-color: rgb(13, 12, 37);
        border-radius: 50%;
      }

      .dashboard {
        background-color: rgb(236, 228, 228);
        padding: 30px;
        height: 100%;
      }

      .dashboard header {
        color: #5f606d;
      }

      .dashboard-cards {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        padding: 20px;
      }

      .dashboard-cards .card {
        background-color: #fff;
        border-radius: 10px;
        width: 220px;
        padding: 20px;
        margin: 10px;
        display: inline-flex;
        align-items: center;
      }

      .dashboard-cards .card .card-body {
        font-size: 18px;
        font-weight: bold;
        padding-left: 15px;
      }

      .card-body span {
        font-size: 16px;
        color: rgb(122, 116, 116);
      }
    </style>
	<script>
	function myFunction() {
		document.getElementById("Judge").style.display ="none";
		document.getElementById("compi").style.display="block";	
	}

		function showJudge(){
			document.getElementById("compi").style.display="none";
			document.getElementById("Judge").style.display ="block";
		}
		function addCompi(){
			
			window.location = "AddCompetitions.html";
		}
		function gotoHome(){
		window.location = "homePage.html";
	}
	function gotoContact(){
		window.location = "contactUs.html";
	}
	function gotoAbout(){
		window.location = "AboutUs.html";
	}
	function gotoLogin(){
		window.location = "login.html";
	}
	</script>
  </head>
  
  <body>
	<nav>
	<ul class="menu">
		<li class="logo"><a role="button" onclick="gotoHome()" href="#">Competative World</a></li>
		<li class="item"><a role="button" onclick="gotoHome()" href="#">Home</a></li>
		<li class="item"><a role="button" onclick="gotoHome" href="#">Competitions</a></li>
		<li class="item"><a role="button" onclick="gotoAbout()" href="#">About</a></li>
		<li class="item"><a role="button" onclick="gotoContact()" href="#">Contact</a></li>
		</li>
		<li class="item button"><a role="button" onclick="gotoLogin()" href="#">Log out</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
    <div class="main-container">
      <div class="sidebar">
        <header class="sidebar-header">
          <h2>Mahadev Bansode</h2>
        </header>
        <div class="sidebar-nav">
          <ul>
            <li><a role="button" onclick="myFunction()" href="#">Dashboard</a></li>
            <li><a role="button" onclick="myFunction()" href="#">Organizers</a></li>
            <li><a role="button" onclick="showJudge()" href="#">Judges</a></li>
            <li><a href="#">Log Out</a></li>
          </ul>
        </div>
      </div>
      <div class="dashboard-container">
        <!--<div class="header-bar">
          <div class="searchbar">
            <input type="text" placeholder="Search" />
          </div>
          <div class="admin-nav">
            <div class="profile-btn"></div>
          </div>
        </div>-->
        <div class="dashboard">
          <header>
            <div align="center"><h1>Dashboard</h1></div>
          </header>
          <div class="dashboard-cards">
            <div class="card">
              <div class="profile-btn"></div>
              <div class="card-body">
                <p>123999</p>
                <span>Total Competitions</span>
              </div>
            </div>
            <div class="card">
              <div class="profile-btn"></div>
              <div class="card-body">
                <p>123999</p>
                <span>Completed</span>
              </div>
            </div>
            <div class="card">
              <div class="profile-btn"></div>
              <div class="card-body">
                <p>123999</p>
                <span>Active</span>
              </div>
            </div>
          </div>
		  <div id="compi">
          <div class="buttons">
            <button class="btn" onclick="addCompi()">+ Add New Competition</button>
          </div>
          <table >
            <thead>
              <tr>
                <th>ID</th>
                <th>Competition Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Status</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
            	<td>1</td>
                <td>Poster Making</td>
                <td>02-02-2022</td>
                <td>05-02-2022</td>
                <td class="active"><span>Active</span></td>
                <td><a style="color :blue;" href="#">Update</a></td>
              </tr>
              <tr>
                <td>1</td>
                <td>Poster Making</td>
                <td>02-02-2022</td>
                <td>05-02-2022</td>
                <td class="active"><span>Active</span></td>
                <td><a style="color :blue;" href="#">Update</a></td>
              </tr>
              <tr>
                <td>1</td>
                <td>Poster Making</td>
                <td>02-02-2022</td>
                <td>05-02-2022</td>
                <td>Closed</td>
                <td><a style="color :blue;" href="#">Update</a></td>
              </tr>
              <tr>
                <td>1</td>
                <td>Poster Making</td>
                <td>02-02-2022</td>
                <td>05-02-2022</td>
                <td>Closed</td>
                <td><a style="color :blue;" href="#">Update</a></td>
              </tr>
              <tr>
                <td>1</td>
                <td>Poster Making</td>
                <td>02-02-2022</td>
                <td>05-02-2022</td>
                <td>Closed</td>
                <td><a style="color :blue;" href="#">Update</a></td>
              </tr>
            </tbody>
          </table>
		  </div>
		  
		  <!-- table to show judges list -->
			<div id="Judge" style="display : none;">
          <table cellspacing="5px">
            <thead>
              <tr>
                <th>ID</th>
                <th>Judge Name</th>
                <th>Competition</th>
                <th>email</th>
                <th>Status</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
              	<% Organizer[] oo = (Organizer[])session.getAttribute("robj");%>
              	<% for(int i=0 ; i<oo.length ; i++) {%>
     
            		<td><%= oo[i].getId() %>1</td>
	                <td>oo[i].getName()</td>
	                <td>PhtotoGraphy</td>
	                <td>oo.getEmail()</td>
	                <td class="active"><span>Active</span></td>
	                <td><a style="color :blue;" href="#">invite</a></td>
	            <% } %>    
              </tr>
              

            </tbody>
          </table>
		  </div>
			<!-- -->
		</div>
      </div>
    </div>
  </body>
</html>
