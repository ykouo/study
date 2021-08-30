<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 입력화면</title>
</head>
<body>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action" value="insert">
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="<%=data.getWriter()%>"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="<%=data.getTitle()%>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="content" value="<%=data.getContent()%>"></td>
	</tr>
	<tr>
		<td colspan='2'><input type="submit" value="등록"></td>
	</tr>
</table>
</form>
	
</body>
</html>