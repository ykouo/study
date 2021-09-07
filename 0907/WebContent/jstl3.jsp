<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - choose</title>
</head>

<body>

<form >
	<select name="test">
		<option>-</option>
		<option ${param.test=='a'?'selected':''}>a</option>
		<option ${param.test=='b'?'selected':''}>b</option>
		<option ${param.test=='c'?'selected':''}>c</option>
	</select>
	<input type="submit" value="선택완료">
</form>
<hr>

[${param.test}]을 선택했습니다.

 <!-- test인자 파라미터를 받아오는거기 때문에 param에서 test값을 받아와야한다. -->
<!-- switch문  -->
<!-- switch --> <!-- if문에서 else를 별도 지원하지 않기 떄문에 switch문을 지원 -->
<!-- case : -->
<!--default / else역할 -->

<c:choose>
   <c:when test="${param.test=='a'}">
      a를 선택했습니다.
   </c:when>
   <c:when test="${param.test=='b'}">
      b를 선택했습니다.
   </c:when>
   <c:otherwise>
      c를 선택했습니다.
   </c:otherwise>
</c:choose>




</body>
</html>