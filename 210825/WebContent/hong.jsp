<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍길동님의 미니홈피</title>
</head>
<body>
<h1>[길동이]의 미니홈피에 온것을 환영합니다!</h1>
<%
	int cnt =(Integer)application.getAttribute("cnt");// 애플리케이션 객체에 저장된 값;을 받아와서
	cnt++;
	application.setAttribute("cnt", cnt);
%>
<h3>투데이 방문자 수: <%=cnt %></h3>

</body>
</html>