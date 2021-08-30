<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage = "true"%> <!-- isErrorPage = 이페이지가 에러페이지 처리하는 페이지임을 명시 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러처리 페이지</title>
<style type="text/css">
#er{
	color: tomato;
}
</style>
</head>
<body>

<h2>발생에러 : <span id ="er"><%=exception%></span></h2>

<!-- 에러 잡아야할 때 봐야할것 

	탭 타이틀 / url

 -->
</body>
</html>