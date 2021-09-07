<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.post.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->    

<jsp:useBean id="post" class="model.post.PostVO" scope="request" />
<jsp:useBean id="postList" class="java.util.ArrayList" scope="request" />  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script type="text/javascript">
function check(pnum){	
	console.log("여기 들어왔니???"); // log출력이 안되는데 이동함...;;;; 
	document.location.href="control.jsp?action=showpost&pnum="+pnum;
}

</script>
</head>
<body>

<h1>메인화면입니다.</h1>


<c:if test="${user==null}">
<hr>
	<button onclick="location.href='login.jsp'">로그인</button>
<br>
	<button onclick="location.href='join.jsp'">회원가입</button>
<hr>
</c:if>
<c:if test="${user!=null}">

	<mytag:logout/>
	
</c:if>
<h3>게시글 보기</h3>

<hr>

<form action="control.jsp" method="post">
<input type="hidden" name="action" value="search">
<select name = "condition">
	<option value="pwriter" selected>작성자</option>
	<option value="ptitle">제목</option>
</select>
<input name ="content" type="text" placeholder="검색내용입력">
<input type="submit" value="검색">
</form>

<hr>

<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>작성일</th>
	</tr>

	<c:if test="${postList.size()==0}">
			<tr><td cospan = "5"> 게시글 목록이 텅!비어있습니다:0 </td></tr>
	</c:if>
	<c:if test="${postList.size()!=0}">
		<c:forEach var="vo" items="${postList}"> 
			<tr>
				<td>${vo.getPnum()}</td>
				<td><a href="javascript:check(${vo.getPnum()})">${vo.getPtitle()}</a></td>
				<td>${vo.getPwriter()}</td>
				<td>${vo.getPcontent()}</td>
				<td>${vo.getPdate()}</td>  
			</tr>
		</c:forEach>
	</c:if>
</table>	

<hr>

<c:if test="${user!=null}">
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="posting">
		<input type="submit" value="글쓰기">
	</form>
</c:if>
</body>
</html>