<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 실습 </title>
</head>
<body>
<jsp:forward page="result2.jsp"/> <!-- 태그바디를 만들경우 jsp:param입력이 없으면 오류가 발생한다. -->

</body>
</html>