<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/total.css" />
</head>
<body>
<form action="login.do">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" required="required"></td>
		</tr>
		<tr class="loginBtn" >
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
	<a href="insertMember.jsp" >회원가입</a>
</form>
</body>
</html>