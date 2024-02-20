<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<% 
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//out.println("Druver found");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
			//out.println("connected");
			
			String q = "select * from part_compi where email = ?";
			PreparedStatement smt = c.prepareStatement(q);
			smt.setString(1,"abc@gmail.com");
	
			ResultSet rs = smt.executeQuery();
			
			while(rs.next()){ %>
			
				<img src=<%= rs.getString(5)%> />
			
			
			<% } %>
		<% }catch(Exception ex){ 
			
			
		}%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>