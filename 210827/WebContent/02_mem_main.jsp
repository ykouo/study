<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.*"%>
    <jsp:useBean id="memberDAO" class = "member.memberDAO" scope="application"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>**페이지 오신것을 환영</title>
</head>
<body>

<a href = "02_mem_join.jsp">회원가입하러가기</a>
<a href = "02_mem_login.jsp">로그인하러가기</a>
<br>
<table border="1">
	<tr>
		<th>이름</th><th>ID</th><th>Password</th>
	</tr>
	<%
		for(memberVO vo :memberDAO.getDatas()){
	%>
	<tr>
		<td><%=vo.getUserName() %></td><td><%=vo.getUserId() %></td><td><%=vo.getUserPw() %></td>
	</tr>
	<%
		}
	%>

</table>




</body>
</html>