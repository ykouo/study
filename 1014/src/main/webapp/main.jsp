<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/total.css" />

</head>
<body>
<h3><a href="logout.do">로그아웃</a></h3>


<h1>글목록</h1>
<hr color="salmon">
<table>
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
	</tr>
	<c:forEach var="v" items="${blist}">
		<tr>
			<td><a href="showpost.do?bid=${v.bid}">${v.bid}</a></td>
			<td>${v.title}</td>
			<td>${v.mid}</td>
			<td>${v.wdate}</td>
		</tr>
	</c:forEach>
</table>
	<!-- pagination -->
		<div id="paging">
			<ul class="pagenation">
					<c:if test="${paging.pageNum==paging.firstPageNum}">
						<li>
						<a href="main.do?page=${paging.prevPageNum}">이전</a>
						</li>
					</c:if>
					<c:if test="${paging.pageNum!=paging.firstPageNum}">
						<li><a
							href="main.do?page=${paging.prevPageNum}">이전</a></li>
					</c:if>

					<c:forEach var="i" begin="${paging.startPageNum}"
						end="${paging.endPageNum}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNum}">
								<li><a class="page">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="main.do?page=${i}"class="page">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${paging.pageNum==paging.finalPageNum}">
						<li>
							<a href="main.do?page=${paging.nextPageNum}"class="button disabled">다음</a>
						</li>
					</c:if>
					<c:if test="${paging.pageNum!=paging.finalPageNum}">
						<li>
							<a href="main.do?page=${paging.nextPageNum}"class="button">next</a>
						</li>
					</c:if>
			</ul>
		</div>

<hr color="salmon">
<a href="insertBoard.jsp">글작성</a>

</body>
</html>