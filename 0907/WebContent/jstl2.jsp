<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - if</title>
</head>
<body>
<!-- ------------------------------------------------------------- -->
<!-- if문 사용 -->
<c:set var="msg" value="test"/>			<!-- == String msg = "test"; -->
<c:if test="${msg=='test'}" var ="res"> <!-- if문에서 test결과를 var에 담는 구조 -->
	1) 결과는 [${res}]입니다.				<!-- 바디태그안에 출력내용을 입력 -->
										<!--  else를 지원하지 않는다. -->
</c:if>
	${res}								<!-- 바디태그 밖에서도 사용가능  -->
<c:if test="${msg!='test'}" var ="res">
	2) 결과는 [${res}]입니다.
</c:if>
<!-- ------------------------------------------------------------- -->



</body>
</html>