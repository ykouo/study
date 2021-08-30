<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 vs 리다이렉팅</title>
</head>
<body>
<form action="forward.jsp" method ="post">
	<input type="text" name="username">
	<input type="submit" value="페이지이동">
</form>
<hr>
<form action="response_sendRedirect.jsp" method ="post">
	<input type="text" name="username">
	<input type="submit" value="페이지이동">
</form>


<!-- 
response객체를 주체로한 리다이렉팅 방식은 jsp액션태그와 다르게, 
페이지를 전환/이동 할때에 request, response객체를 매번 새로 생성함 

리다이렉팅 방식을 사용하게 되면 다음페이지를 위한 request, response를 또 만든다.

 -->

</body>
</html>