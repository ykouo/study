<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
</head>
<body>

<form action="control.jsp" method ="post" >
	<input type="hidden" name="action" value="login">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name ="userid" placeholder="아이디입력"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name ="userpw" placeholder="비밀번호입력"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="login"></td>
	</tr>
</table>
</form>

<button onclick="location.href='insertUser.jsp'">회원가입</button>



<ol>
	<li><a href="control.jsp?action=main">전체목록보기</a></li>
</ol>

<hr color="tomato">
<h2>전체목록</h2>
<hr color="tomato">

<c:forEach var="v" items="${datas}">
	<c:set var="m" value="${v.m}"/>
	<h3>[${m.userid} ${m.msg} / [ ♥:${m.favcount} | 댓글:${m.replycount} | ${m.mdate}]</h3>
	<ol><c:forEach var="r" items="${v.rlist}"> <!-- 여기를 ${} el식 쓰는거 까먹음 -->
		<li>${r.userid}▶${r.rmsg} ${r.rdate}</li> <!-- 여기 userid였음..  -->
	</c:forEach></ol>
</c:forEach>
</body>
</html>
