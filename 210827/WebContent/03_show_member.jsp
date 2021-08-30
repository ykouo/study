<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="join3.*" %>
    <jsp:useBean id="memDAO" class= "join3.memDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입한 멤버 목록 출력</title>
</head>
<body>
<h1>가입한 멤버 리스트</h1>
<hr>
<%
for(memVO vo : memDAO.getDatas()){
%>
	[ 이름 ] : <%=vo.getUserName() %>
	[ ID ] : <%=vo.getUserId() %>
	[ Password ] : <%=vo.getUserPw() %> <br>
<% } %>


<a href = "03_join.jsp"><button>회원가입페이지로</button></a>







</body>
</html>