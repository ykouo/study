<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp액션태그</title>
</head>
<body>
<h2>jsp04.jsp 페이지입니다.</h2>
<hr>
<!--  우리는 이미 3개의 액션태그를 배웠다. --> 
<!-- jsp:useBean,jsp:setProperty,jsp:getProperty -->


<!-- 내용이 자주 바뀌는건 이거 사용 -->
<jsp:include page="footer.jsp">
	<jsp:param value="abcdefg@abcdefg.abc" name="email"/>
	<jsp:param value="010-1234-5678" name="tel"/>
</jsp:include> <!-- 띄어쓰기 주의  -->
<!--  태그바디가 존재한다 : 태그바디안에 있는 인자를 넘길수 있다. 
-->
</body>
</html>