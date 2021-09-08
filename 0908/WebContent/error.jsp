<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error페이지</title>
</head>
<body>
<h1>Error발생</h1>
<hr>
<h3>에러 코드를 확인하세요</h3>
${exception}
<hr>
<form action="control.jsp" method="post">
	<input type="hidden" name ="action" value="showMemList">
	<input type="submit" value="메인">
</form>

</body>
</html>