<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
<hr>
<h1>오류발생 :o</h1>
<hr>
<h3>요청 처리 실패 :( 해당페이지는 존재하지 않습니다 (꾸벅)</h3>
<hr>
예외유형 : ${pageContext.errorData.throwable}<br>
상태코드 : ${pageContext.errorData.statusCode}<br>
실패 URl : ${pageContext.errorData.requestURI}<br>
<hr>  
</body>
</html>