<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:import url="jstl1.jsp" var="innerURL"/>
<c:out value="${innerURL}" escapeXml="false"/>

<hr>
<!-- 페이지 소스 관리할때 사용된다.  -->
<c:import url="https://www.naver.com/" var="outerURL"/>
<c:out value="${outerURL}" escapeXml="false"/>
</body>
</html>