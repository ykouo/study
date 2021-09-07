<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - c:set </title>
</head>
<body>

<hr>
<!-- ----------------------------------------------------------------------- -->
<!--  에러 캐치 -->
<c:catch var="errMsg">	<!-- 에러메시지를 담을수있다. -->
	<%= 10/0 %>
</c:catch>
${errMsg}<br>	<!-- 에러가 발생하지 않으면 출력되지 않음 -->
<hr>
<!-- ----------------------------------------------------------------------- -->
<!-- 변수선언 -->
<c:set var="msg" value="hello! nice to meet you!" /> <!-- 스코프 설정은 가능하지만 간단한 변수를 많이 사용하기 때문에 page스코프(디폴트)값으로 냅두는 경우가 많다. --> 
<c:remove var="msg"/>
<h1>${msg}</h1> <!-- EL식을 더 자주사용한다. c:out보다 -->
<%=pageContext.getAttribute("msg") %> <!-- 12==13 -->
<!-- ------------------------------------------------------------------------ -->
<!-- 값세팅 -->
<c:set target="${member}" property="email" value = "aaaa@naver.com"/> <!-- 객체의 값을 변경할때 -->
${member.name}<br>
${member.email}



</body>
</html>