<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - 실습 </title>
</head>
<body>
<% 
	ArrayList<String> datas = new ArrayList<String>();
	datas.add("안녕");
	datas.add("오타야");
	datas.add("제발");
	datas.add("그만");
	datas.add("나와");
	datas.add("ㅎㅎ");
	System.out.println(datas);
	pageContext.setAttribute("datas", datas); //현페이지에서 사용하기 위해 setAttribute한다.
%>

<c:forEach var="v" items="${datas}"> 
	${v}<br>
</c:forEach> 
</body>
</html>