<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/total.css" />
</head>
<body>

<form action="goeditBoard.do" method="post">
	<input type="hidden" name="bid" value="${data.bid}">
	<input type="hidden" name="mid" value="${data.mid}">
	<input type="hidden" name="wdate" value="${data.wdate}">
	<input type="hidden" name="title" value="${data.title}">
	<input type="hidden" name="content" value="${data.content}">
	<table>
		<tr>
			<td>글번호</td>
			<td>${data.bid}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${data.mid}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${data.wdate}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${data.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${data.content}</td>
		</tr>	
		<c:if test="${data.mid eq mem}">
		<tr>
			<td colspan="2"><input type="submit" value="수정하기"></td>
		</tr>
		</c:if>		
	</table>
</form>
<hr color="salmon">
<c:if test="${data.mid eq mem}">
	<a href="deletepost.do?bid=${data.bid}&mid=${data.mid}">글삭제하기</a>
</c:if>

<hr color="salmon">
<a href="main.do">메인페이지로 이동하기</a>
</body>
</html>