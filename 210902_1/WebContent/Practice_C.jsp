<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀태그 실습 </title>
</head>
<body>

<form action="Practice_D.jsp" method="post">
	<mytag:printProductName name="pname">실습1</mytag:printProductName>
		<input type = "number" name="cnt" value="1" min="1" max="10">
		<input type = "submit" value="전송">
</form>

</body>
</html>