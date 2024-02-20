<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="back.Participant" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% ArrayList ar = (ArrayList)request.getAttribute("ar"); 
            	
            	for(int i=0 ; i<ar.size() ; i++){
            		
            		Participant pt = (Participant)ar.get(i); %>
	              <tr>
	                <td><%= i+1 %></td>
	                <td><%= pt.getCname() %></td>
	                <td><%= pt.getStart() %></td>
	                <td><%= pt.getEnd() %></td>
	                <td class="active" ><span>Incomplete</span></td>
	                <td><a style="color :blue;" href="submission.jsp?comp=poster">Submit</a></td>
	              </tr>
              <%} %>
</body>
</html>