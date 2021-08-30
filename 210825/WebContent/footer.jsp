<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer페이지</title>
</head>
<body>

<h2>[footer.jsp에서 출력하는 페이지 입니다.]</h2>
<%= request.getParameter("email") %><br>

<%
	out.println(request.getParameter("tel"));
%>

</body>
</html>