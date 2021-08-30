<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>

<!-- <%-- <%@ page %>    --%>페이지 지시어 
 속성 : import 
 	  errorPage="해당페이지" 현재 페이지에서 에러가 발생한다면 "해당페이지로 보내세요 " 라는 속성
 	  ex) 404에러가 디폴트 에러 페이지가 아닌 이미지적용, 스타일적용이 되어있는 페이지는 에러페이지 속성을 사용한것.
    -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지 실습 </title>
</head>
<body>
<%
String str="test";
int i=Integer.parseInt(str);
%>

</body>
</html>