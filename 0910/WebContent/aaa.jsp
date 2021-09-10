<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listener & Filter 실습</title>
</head>
<body>

	<form action="bbb.jsp" method="post">
		<select name="coffee">
			<c:forEach var="v" items="${coffeeList}">
				<option>${v.name}</option>
			</c:forEach>
		</select> <input type="submit" value="보내기">
	</form>



</body>
</html>