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

<form action="updatepost.do" method="post">
	<table>
		<tr>
			<td>글번호</td>
			<td><input type="hidden" name="bid" value="${data.bid}">${data.bid}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="hidden" name="mid" value="${data.mid}">${data.mid}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><input type="hidden" name="wdate" value="${data.wdate}">${data.wdate}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${data.title}" required="required"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" value="${data.content}" required="required"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" value="수정하기"></td>
		</tr>
	</table>

</form>



</body>
</html>