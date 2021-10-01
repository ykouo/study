<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<form action="sendMail.jsp" method="post">
			<input type="hidden" name="to" value="YourGmailAddress"/>
			<input type="hidden" name="from" value="YourGmailAddress"/>
		<table>
			
			<tr><th colspan="2">JSP 메일 보내기 </th></tr>

			<tr>
				<td>제목</td>
				<td><input type="text" name="subject"/></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><input type="text" name="content"/></td>
			</tr>	
			<tr><td colspan="2"><input type="submit" value="Send"></td></tr>	
		</table>
	
	
	</form>

</div>


</body>
</html>