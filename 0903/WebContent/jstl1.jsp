<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h1>&lt; c:forEach &gt;실습</h1>
<hr>

<table border="1"> 
	<c:forEach var="v" items="${members}" >     <!-- for(String v : 집합명)  itmes == 집합명-->
	
	<tr>
		<td>${v.name}</td>
		<!-- 유의 : c:out은 무언가 출력할때 사용하는 태그인데  아래처럼 특정정보가 없을때 사용한다 -->
		<!-- email정보없음 을 빨간글씨로 출력하고 싶다면 c:out에 escapeXml="false"속성을 넣어줘야한다 -->
		<td><c:out value="${v.email}" escapeXml="false"><font color="red">email정보없음"</font></c:out></td>
	</tr>
	</c:forEach>

</table>

</body>
</html>