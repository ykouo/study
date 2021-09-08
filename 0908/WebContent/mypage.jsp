<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="model.member.MemberVO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<h1>마이페이지</h1>
<hr>
<h3>${mem.name}님의 회원정보 수정 페이지 입니다. </h3>
<%--  <%=mem.getName()%>  --%>
<form method="post" action="control.jsp">
	<input type="hidden" name="action" value="updateMemInfo">
	<input type="hidden" name="mid" value="${mem.mid}">
	<table>
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" value="${mem.name}"></td>
		</tr>
		
		<tr>
			<td>Password</td>
			<td><input type="password" name="mpw" value="${mem.mpw}"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="정보변경"></td>
		</tr>
		
	</table>
</form>

<hr>
<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="signOut">
	<input type="submit" value="회원탈퇴">
</form>



</body>
</html>