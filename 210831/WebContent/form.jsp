<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 페이지</title>
<style type="text/css">
table{
	border: 1px solid gray;
}
</style>

</head>
<body>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action" value="insert">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="작성자"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="제목을입력하세요"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" value="내용을입력하세요"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" value="등록"></td>
		</tr>
	</table>
</form>



</body>
</html>