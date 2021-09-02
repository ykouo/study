<%@page import="model.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Practice_EL1</title>
</head>
<body>
	
	
	<form action="Practice_B.jsp" method="post">
		<jsp:useBean id="prBean" class="model.ProductBean" scope="session"/>
		<!-- for문에서 사용할 dataBean을 위해 form태그 안에서 jspuseBean을 선언 -->
		<select name="pname">
			<%
				for(String v : prBean.getProduct()){
			%>
				<option><%=v%></option>
			<%
				} 
			%>
		</select>	
			<input type="number" name="cnt" value="1"> <!-- 개수를 선택받아 전송될때 함께 보내진다. -->
			<input type="submit" value="전송">
	</form>
</body>
</html>