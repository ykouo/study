<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.forward("control.jsp?action=list");
	// index.jsp를 실행하면 list.jsp페이지를 보여줘 라는 의미 
	// pageContext :  같은 JSP 페이지 내에서는 서로 값을 공유, 
	//			   	  주요 기능은 다른 기본객체들을 구할때 사용하거나 페이지 흐름을 제어할 때 사용	
	// <메서드>
	// 		forward(String relativeUrlPath)  : 지정한 경로로 이동 
	// 		include(String relativeUrlPath) 
%> 