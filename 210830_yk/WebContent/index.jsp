<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 인덱스 페이지 지만 보여지지는 않는 페이지  --%>
<% 
	pageContext.forward("control.jsp?action=list");
	//  컨트롤러 페이지에게 list.jsp를 보여달라 요청 
%>