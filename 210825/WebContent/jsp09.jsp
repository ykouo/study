<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 리다이렉팅 실습</title>
</head>
<body>
<form name="form1" method = "post" action="forward2.jsp">
	<table border = "1">
		<tr>
			<td>이름</td>
			<td><input type = "text" name="username"></td>
		</tr>
	<tr>
			<td>학년</td>
			<td><select name ="grade">
				<option selected>1학년</option>
				<option>2학년</option>
				<option>3학년</option>
			</select></td>
		</tr>
		<tr>
			<td>수강하는 과목</td>
			<td><input type="checkbox" name="subject" value="C언어">C언어
			<input type="checkbox" name="subject" value="Java">Java
			<input type="checkbox" name="subject" value="HTML">HTML
			<input type="checkbox" name="subject" value="JSP">C언어
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type = "submit" value="제출하기"></td>
		</tr>
	</table>
</form>
<hr>
<form name="form1" method = "post" action="response_sendRedirect2.jsp">
	<table border = "1">
		<tr>
			<td>이름</td>
			<td><input type = "text" name="username"></td>
		</tr>
	<tr>
			<td>학년</td>
			<td><select name ="grade">
				<option selected>1학년</option>
				<option>2학년</option>
				<option>3학년</option>
			</select></td>
		</tr>
		<tr>
			<td>수강하는 과목</td>
			<td><input type="checkbox" name="subject" value="C언어">C언어
			<input type="checkbox" name="subject" value="Java">Java
			<input type="checkbox" name="subject" value="HTML">HTML
			<input type="checkbox" name="subject" value="JSP">C언어
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type = "submit" value="제출하기"></td>
		</tr>
	</table>
</form>







</body>
</html>