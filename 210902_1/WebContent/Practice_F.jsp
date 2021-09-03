<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String action=request.getParameter("action");
if (action.equals("login")) {
	session.setAttribute("mem", request.getParameter("mid"));
	pageContext.forward("Practice_E.jsp");
} else if (action.equals("logout")) {
	session.invalidate();
	pageContext.forward("Practice_E.jsp");
}
%>