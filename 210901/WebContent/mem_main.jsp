<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* ,model.message.*"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>로그인, 회원등록 페이지</title>

</head>
<body>
<% if(session.getAttribute("mem") == null){ %>
	<form action="mem_control.jsp" method="post" name="form1">
	<input type="hidden" name= "action" value="login">
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
			<td colspan="2"><input type="submit" value="login"></td> <!-- 1)login버튼을 누르면  -->
		</tr>	
	</table>
</form>
	<hr>
	<a href = "mem_mem.jsp"><button>SignIn</button></a>
<% }else{
%>	
	<form action="mem_control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="logout">
		<input type="submit" value="logout">
	</form>
<%} %>
