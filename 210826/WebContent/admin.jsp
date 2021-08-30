<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지입니다.</title>
</head>
<body>

<%
int cnt =(Integer)application.getAttribute("cnt");
%>

<h3>결제한 횟수 : <%=cnt %></h3>
</body>
</html>