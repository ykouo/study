<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 성공 페이지 입니다</h1>
<hr>
<h3 style="color:salmon">${user}님 환영합니다 ヾ(≧▽≦*)o</h3>
<% if(session.getAttribute("user") != null){ %>
	<mytag:logout/> 
<%} %>

</body>
</html>