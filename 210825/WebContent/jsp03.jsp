<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include지시어 </title> <!-- 자주 바뀌는  -->
<style type="text/css">
#box1{
	border : 1px solid tomato;
}
#box2{
	border : 1px solid gold;
}
</style>
</head>
<body>
<!-- 자주 바뀌지 않는건 이거 사용 -->
<%@ include file="menu.jsp" %>  <!-- include지시어가 file에 작성된 내용을 긁어와서 보여준다. -->
<hr>
<div id ="box1">
<%@ include file="news.jsp" %>
</div>
<div id ="box2">
<%@ include file="shopping.jsp" %>
</div>



</body>
</html>