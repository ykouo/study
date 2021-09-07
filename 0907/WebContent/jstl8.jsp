<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - url</title>
</head>
<body>

<c:url value="jstl3.jsp" var="testURL"> <!-- 해당 파일에 내용을 넣기위해 사용-->
	<c:param name="test">b</c:param>
</c:url>

<a href="${testURL}">눌러보세요❤</a> <!--  get방식  -->
</body>
</html>