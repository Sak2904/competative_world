<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
      
<!DOCTYPE html>
<html lang="en">
  <head>
  	<link rel="stylesheet" href="navbar.css">
    <title>Admin Dashboard</title>
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
        padding-bottom: 40px;
        padding-left : 8px;
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

      }

      td a {
        text-decoration: none;
      }

      .active span{

        border-radius: 12px;
        display: inline-flex;
        background-color: rgb(160, 221, 160);
        color: green;
      }

      .sidebar {
        width: 250px;
        height: 100vh;
        background-color: rgb(13, 12, 37);
        color: #fff;
      }

      .sidebar header {
        padding: 16px;
        margin: 5px;
        text-align: center;
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
  </head>
  <body>
  <nav>
	<ul class="menu">
		<li class="logo"><a role="button" onclick="gotoHome()" href="#">Competative World</a></li>
		<li class="item"><a role="button" onclick="gotoHome()" href="#"></a></li>
		<li class="item"><a role="button" onclick="gotoCompetitions()" href="#"></a></li>
		<li class="item"><a role="button" onclick="gotoAbout()" href="#"></a></li>
		<li class="item"><a role="button" onclick="gotoContact()" href="#"></a></li>
		</li>
		<li class="item button"><a role="button" onclick="gotoLogin()" href="#">Log out</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
    <div class="main-container">
      <div class="sidebar">
        <header class="sidebar-header">
          <h2>Competitve World</h2>
        </header>
        <div class="sidebar-nav">
          <ul>
            <li><a href="#">Dashboard</a></li>
            
          </ul>
        </div>
      </div>
      <div class="dashboard-container">
        <div class="dashboard">
          <header>
            <h1>Participant List</h1>
          </header>
          
          <table>
            <thead>
              <tr>
                <th style="padding-left:30px;">ID</th>
                <th style="padding-left:2px;">Competition</th>
                <th style="padding-left:18px;">Paticipant</th>
                <th></th>
                <th>Points</th>
                <th>status</th>
              </tr>
            </thead>
            <tbody>
            <%
            try{
            	Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
                
                String q = "Select participant.name,result.points from participant,result where participant.email = result.pid and cid = ? order by points desc";
                PreparedStatement smt = c.prepareStatement(q);
                
                int cid = Integer.parseInt(request.getParameter("cid"));
                smt.setInt(1,cid);
                
                ResultSet rs = smt.executeQuery();
                
               	while(rs.next()){ %> 
              <tr>
                <td style="padding-left:30px;"><%= request.getParameter("cid") %></td>
                <td style="padding-left:2px;"><%= request.getParameter("cname") %></td>
                <td style="padding-left:10px;"><%= rs.getString(1) %></td>
                <td></td>
                <td class="activ"><span><%= rs.getFloat(2) %></span></td>
                <td>completed</td>
              </tr>
              <% } %>
              <% }
              catch(Exception ex){
              
              	ex.printStackTrace();
              }%>
            </tbody>
          </table>
        </div>
    </div>
  </body>
</html>
