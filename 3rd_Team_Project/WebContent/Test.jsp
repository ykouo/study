<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<jsp:useBean id="freevo" class="model.board.FreeBoVO" scope="request" />
<jsp:useBean id="fpList" class="java.util.ArrayList" scope="request" />

<!-- c태그 사용을 위한 import -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 태그라이브러리 달아야함 -->


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
	<hr color="tomato">
	<h1>메인화면입니다.</h1>
	<hr color="tomato">
	<br>

	<h3>[게시글 보기]</h3>
	<hr color="orange">


	<table>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>

		<c:if test="${fpList.size()==0}">
			<tr>
				<td colspan="7">게시글 목록이 텅!비어있습니다:0</td>
			</tr>
		</c:if>
		<c:if test="${fpList.size()!=0}">
			<c:forEach var="vo" items="${fpList}">
				<tr>
					<td>${vo.getPnum()}</td>
					<td>${vo.getCategory()}</td>
					<td><a href="javascript:check(${vo.getPnum()})">${vo.getPtitle()}</a></td>
					<td>${vo.getMname()}</td>
					<td>${vo.getPcontent()}</td>
					<td>${vo.getCnt()}</td>
					<td>${vo.getPdate()}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<hr>
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="posting"> 
		<input	type="submit" value="글쓰기">
	</form>


</body>
</html>