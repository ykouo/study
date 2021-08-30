<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩방식</title>
</head>
<body>
<!-- include는 페이지주도권 /제어권을 줬다 가져오지만  forward는  페이지 주도권/ 제어권을 결과페이지에 준다.  -->
<jsp:forward page="result.jsp">  
   <jsp:param value="coding_helper@naver.com" name="email"/>
</jsp:forward>



</body>
</html>