<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
</head>
<body>
	<form action="mem_control.jsp" method="post" name="form1">
	<input type="hidden" name= "action" value="join">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name = "mid"></td>
		</tr>
		<tr>
			<td>Password</td> 
			<td><input type="text" name = "mpw"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" value="가입하기"></td> S
		</tr>	
	</table>
</form>
</body>
</html>