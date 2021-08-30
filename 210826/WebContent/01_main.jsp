<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<h2>SNS 로그인</h2>
<form action="02_sns_Login.jsp" method="post" name="form1">
	<table id="loginform">
		<tr>
			<td>아이디</td>
			<td><input name="id" type="text" placeholder="아이디입력"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>