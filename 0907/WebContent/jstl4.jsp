<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - 실습 </title>
</head>
<body>

<form  >
	<input type="number" name = "num" value="0" min="0" >
	<input type="submit" value="짝홀?">
</form>

<c:set var="num" value="${param.num}"/> 

<c:if test="${num%2==0}" >
	<h2 style="color:'red'" >결과는 [짝수] 입니다.</h2>
</c:if>
<c:if test="${num%2!=0}">
	<h2 style="color:'blue'" >결과는 [홀수] 입니다.</h2>
</c:if>


</body>
</html>