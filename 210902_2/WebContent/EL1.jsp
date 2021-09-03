<%@page import="model.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL실습 1</title>
</head>
<body>
	
	<form action="EL2.jsp" method="post">
		<jsp:useBean id="prbean" class="model.ProductBean" scope="session"/>
		<select name="pname">
			
			<%

			for(String v : prbean.getProductName()){ 	
				%>
				<option><%=v %></option>
			<% } %>
		
		</select>
		<input type="number" name ="cnt" value="1" min="0" max="10" >
		<input type="submit" value="전송">
	</form>
	
	
</body>
</html>