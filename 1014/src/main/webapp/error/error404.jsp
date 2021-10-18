<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404Error-존재하지않는 페이지</title>
</head>
<body>
<hr>
<h1>존재하지 않는 페이지입니다:o</h1>
<hr>
<h3>요청 처리 실패 :( 해당페이지는 존재하지 않습니다 (꾸벅)</h3>
실패 URl : ${pageContext.errorData.requestURI}
<hr>  
</body>
</html>