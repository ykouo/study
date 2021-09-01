<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	pageContext.forward("mem_control.jsp?action=main");
	//처음으로 클릭시 로그인 화면이 먼저 보여야한다 --> mem_index.jsp를 실행하면 mem_control.jsp를 거쳐 mem_main으로 넘어간다.
%>