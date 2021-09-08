<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="memList" class="java.util.ArrayList" scope="request"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
<h1>메인페이지입니다.</h1>

<%-- <% if(session.getAttribute("mem")==null){%> --%>
<c:if test="${mem==null}"> 
	<button onclick="location.href = 'login.jsp'">로그인</button>

	<button onclick="location.href = 'join.jsp'">회원가입</button>
</c:if>


<%-- <% if(session.getAttribute("mem")!=null){ --%>
<c:if test="${mem!=null}">
	 <mytag:logout/>
	 <mytag:mypage/>
</c:if>	
	
<hr>

<table border="1">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>비밀번호</th>
	</tr>

<c:if test="${memList.size()==0}">
	<tr>
		<td colspan="3">가입한 회원이 없습니다 ToT</td>
	</tr>
</c:if>
<c:if test="${memList.size()!=0}">	
	<c:forEach var="v" items="${memList}">
		<tr>
		<td>${v.getName()}</td>
		<td>${v.getMid()}</td>	
		<td>${v.getMpw()}</td>
		</tr>
	</c:forEach>
</c:if>
</table>


</body>
</html>