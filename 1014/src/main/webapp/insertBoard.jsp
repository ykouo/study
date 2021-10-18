<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 페이지</title>
<link rel="stylesheet" href="css/total.css" />
</head>
<body>

<form action="newpost.do" method="post">
	<input type="hidden" name="mid" value="${mem}" >
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" required="required"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" required="required"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" value="글작성하기"></td>
		</tr>
	</table>

</form>



</body>
</html>