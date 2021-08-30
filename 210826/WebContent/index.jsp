<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인
페이지</title>
</head>
<body>
<h1>로그인</h1>
<hr>
<%
	session.invalidate(); // 세션정보해제
	if(application.getAttribute("cnt")==null){
		application.setAttribute("cnt",0);
	}
%>
<form method="post" action="check.jsp" name="form1">
	 아이디 <input type="text" name="id" required placeholder="아이디입력">
	<input type = "submit" value="로그인" name = "btn1">
</form>
<hr>

</body>
</html>