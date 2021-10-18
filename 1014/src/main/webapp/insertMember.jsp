<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/total.css" />
</head>
<body>
<form action="joinMember.do">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" required="required"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="mname" required="required"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="tel" name="call" required="required"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="회원가입"></td>
		</tr>
	</table>
	<a href="index.jsp">로그인페이지로</a>
</form>
</body>
</html>