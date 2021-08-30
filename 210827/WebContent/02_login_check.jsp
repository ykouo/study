<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class = "member.memberDAO" scope="application"/>
<jsp:useBean id="vo" class="member.memberVO" />
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 </title>
</head>
<body>


<%
	int result=memberDAO.login();
	System.out.println(result);
%>


</body>
</html> --%>