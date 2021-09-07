<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> jstl - redirect</title>
</head>
<body>
<c:redirect url = "jstl3.jsp">
	<c:param name="test">a</c:param>
</c:redirect>
</body>
</html>