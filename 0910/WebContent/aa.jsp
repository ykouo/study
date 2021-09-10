<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복습</title>
</head>
<body>
	<form action="bb.jsp" method="post">
			<p>[ 견종 ]</p>
 		<select name="dog">
			<c:forEach var="v" items="${dogList}">
				<option>${v.type}</option>
			</c:forEach>
		</select> <input type="submit" value="보내기">
	</form>

</body>
</html>