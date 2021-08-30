<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage ="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 액션태그 : forward</title>
</head>
<body>
<h2>jsp05.jsp 페이지입니다.</h2>
<hr>

<jsp:forward page="footer.jsp">
	<jsp:param value="abcdefg@abcdefg.abc" name="email"/>
	<jsp:param value="010-1234-5678" name="tel"/>
</jsp:forward> <!-- 띄어쓰기 주의  -->

</body>
</html>