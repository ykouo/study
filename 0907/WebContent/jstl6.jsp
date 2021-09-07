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


<!-- delims-->로 구분  -->
<c:forTokens var="v" items="홍길동,아무개,임꺽정,심청이,춘향이" delims=",">
	<li> ${v} </li>
</c:forTokens>

<hr>
<c:forEach var="v" items="${member}" begin="0" end="3" varStatus="vs">
	${vs.index} /${vs.count} <br>
	${v.name}/${v.email} <hr>

</c:forEach>


</body>
</html>