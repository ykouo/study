
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="post" class = "model.board.FreeBoVO" scope="request"/>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성페이지 </title>
</head>
<body>
<h1>글 작성 페이지 </h1>
<hr>	
	

	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value = "insertPost">
		<table>
			<tr>
				<td>번호</td>
				<td><%=post.getPnum()%></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><%=post.getPcontent()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name ="ptitle" placeholder="제목작성"></td>
			</tr>
			<tr>
				<td>회원닉네임</td>
				<td><input type="text" name ="mname" placeholder="회원닉네임"></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><input type="text" name ="mid" placeholder="회원아이디"></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td>작성일자--자동입력됨</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>자동입력됨</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name ="pcontent" style="width:200px; height: 200px;"></td>
			</tr>
			<tr>
				<td><input type="submit" value="글올리기"></td>
			</tr>
		</table>
	</form>





</body>
</html>