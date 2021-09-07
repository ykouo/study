
<%@page import="model.mem.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="post" class = "model.post.PostVO" scope="request"/>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성페이지 </title>
</head>
<body>
<h1>글 작성 페이지 </h1>
<hr>	
	<% MemVO user = (MemVO) session.getAttribute("user"); %>

	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value = "insertPost">
		<input type="hidden" name="pwriter" value = "<%=user.getMname()%>">
		
		<input type="hidden" name="action" value = "insertPost">
		<table>

			<tr>
				<td>Title</td>
				<td><input type="text" name="ptitle" placeholder="제목작성"></td>
			</tr>	
			<tr>
				<td>내용</td>
				<td><input type="text" name="pcontent" style="width:200px; height: 200px;" placeholder="내용작성"></td>
			</tr>
			<tr>
				<td><input type="submit" value="글올리기"></td>
			</tr>
		</table>
	</form>





</body>
</html>