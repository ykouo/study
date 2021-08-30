<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 리다이렉팅 실습 결과페이지</title>
</head>
<body>
<h1>포워딩/리다이렉팅</h1>
<h3>이름 : <%=request.getParameter("username")%></h3>
<h3>학년 : <%=request.getParameter("grade")%></h3>
<h3>수강하는 과목</h3> 
<h4><%
	// 스크립트 릿
	String data[] = request.getParameterValues("subject");	// 배열생성
	if(data==null){
		out.println("수강하는 과목이 없습니다. <br>");
	}else{
		for(String v : data){
			out.println(v+"<br>");
		} 		
	}
%>
</body>
</html>