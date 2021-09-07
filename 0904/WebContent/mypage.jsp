<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="model.mem.MemVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원정보변경/탈퇴</title>
</head>
<body>
<h1>마이페이지</h1>
<hr>
<h3><%=user.getMid()%>님의 회원정보 수정 페이지 입니다. </h3>
<hr>
<form action="control.jsp" method="post">
	<input type ="hidden" name="action" value="editUserInfo"> 
	<input type="hidden" name="mnum" value="<%=user.getMnum() %>">
	<table>
		<tr>
			<td>아이디 *</td>
			<td><input type="text" name="mid"  value="<%=user.getMid() %>" ></td>
		</tr>
		<tr>
			<td>닉네임 *</td>
			<td ><input type="text" name="mname" value="<%=user.getMname() %>"  ></td>
		</tr>
		<tr>
			<td>비밀번호*</td>
			<td><input type="password" name="mpw" value="<%=user.getMpw() %>"></td>
		</tr>

		<tr>
			<td colspan="2" align="right" ><input type="submit" value="정보변경"></td>
		</tr>
	</table>
</form>
<hr>
<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="deleteUser">
	<input type="submit" value="회원탈퇴">
</form>

</body>
</html>