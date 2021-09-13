<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<form action="control.jsp" method="post" >
<input type="hidden" name="action" value="join">	
	<table>
		<tr>
			<td>아이디 *</td>
			<td><input type="text" name="userid" placeholder="아이디입력" required="required"></td>
			
		</tr>
		<tr>
			<td>닉네임 *</td>
			<td><input type="text" name="username" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호*</td>
			<td><input type="password" name="mpw" placeholder="비밀번호입력" required="required"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="회원가입하기"></td>
		</tr>
	</table>
</form>

</body>
</html>