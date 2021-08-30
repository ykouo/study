<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장객체 </title>
</head>
<body>

<%
	if(session.isNew()){ //세션이 만료되서 새것이라면 == 세션이 비어있을때만 
		out.println("<script>alret('세션을 설정함!')</script>");
	session.setAttribute("user", "anna"); 
	session.setMaxInactiveInterval(5);
	// anna라는 사람이 user라는 변수명(이름)으로 등록됨
	// session단위로 등록됨!
	// == 브라우저가 종료되지 않는 한, 사라지지 않음!
	// session에는 시간개념이 있다. 
	// == 시간개념 30분(==1800초)
	}
%>
<%=session.getAttribute("user") %>님, 환영합니다!<br>
<%=session.getMaxInactiveInterval() %> 초동안 세션정보가 유지됩니다.<br>


</body>
</html>