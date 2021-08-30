<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.message.*, java.util.*" %>

<jsp:useBean id="datas" class = "java.util.ArrayList" scope="request"/> <!-- 컨트롤러가 건내주는 정보를 받아오는 역할 -->
<!-- id = 받아온 데이터 /  class = id의 타입  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록 화면</title>
</head>
<body>

<h2>게시글목록</h2>
<hr>
<a href = "form.jsp">글등록</a> <!--  form.jsp를 위해 사전 셋팅할 데이터가 없어서 바로 불름 -->
<hr>
<table border="1">
	<tr>
		<th>글 번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	</tr>
	<%
		for(MessageVO vo:(ArrayList<MessageVO>)datas){
	%>
		<tr>
			<td><a href="control.jsp?action=edit&mnum=<%=vo.getMnum()%>"><%=vo.getMnum()%></a></td><!-- 글 변경을 위한 비밀번호 등의 인증작업처리 필요! -->
			<td><%=vo.getTitle()%></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getWdate()%></td>
		</tr>
	<%
		}
	%>
</table>


<!-- ArrayList<MessageVO> datas = dao.select(); -->

</body>
</html>