<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request 결과 페이지</title>
</head>
<body>

이름: <%= request.getParameter("username") %> <br>
학년: <%= request.getParameter("grade") %> <br>
수강하는 과목<br> 
<%
 	// 스크립트 릿
 	
 	String data[] = request.getParameterValues("subject");	// 배열생성
 	if(data==null){
 		out.println("수강하는 과목이 없습니다. <br>");
 	}else{
 		for(String v : data){
 			out.println(v+"<br>");
 		} 		
 	}
/*  	
 	for(int i=0;i<data.length;i++){
 		out.println(data[i]+"<br>");
 	}
	
  	for (String v : data) {
 		out.println(v + "<br>");
 	} */
 %> <br>

</body>
</html>