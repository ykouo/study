<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.bank.*, java.util.*"%>
<%-- <jsp:useBean id="voList" class="java.util.ArrayList" scope="request"/> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 계좌이체 실습 ]</title>
<style type="text/css">
	.fc1{
		color: tomato;
	}
</style>
</head>
<body>
	<h1>[ 계좌이체 실습 ]</h1>
	<hr>
	<h3>은행</h3>
	
	
	<c:forEach var="vo" items="${voList}"> 
	<table border="1">
		<tr>
			<td>계좌주</td>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<td>잔액</td>
			<td>${vo.balance}</td>
		</tr>
	</table>
	<br>
	</c:forEach>

	
	<hr color="red" />
	<br>
	<p class="fc1">${str}</p>
	<br>
	<hr color="red" />
	<form action="control.jsp" method="post">
		<input type="hidden" name ="action" value="bal">
		<table>
			<tr>
				<td>
					<select name="output">
						<option selected="selected" >1001</option>
						<option >2001</option>
					</select>
				</td>
				<td>에서</td>
			</tr>
			<tr>
				<td>
					<select name="input">
						<option selected="selected">1001</option>
						<option >2001</option>
					</select>
				</td>
				<td>에게</td>
			</tr>
			<tr>
			<td colspan ="2">
			<input type="text" name="balance" >
			<input type="submit" value="이체">
			</td>
			</tr>
		</table>
	</form>



</body>
</html>