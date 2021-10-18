<%-- <%@page import="model.mem.MemDAO"%>
<%@page import="model.mem.MemVO"%> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.mem.*"%>
<%
	//아이디값
// 비밀번호값

//vo에 해당하는 값들을 set

//dao로 getMember()수행
String mid = request.getParameter("mid");
String mpw=request.getParameter("mpw");

MemVO vo = new MemVO();
vo.setMid(mid);
vo.setMpw(mpw);

MemDAO dao=new MemDAO();
MemVO data = dao.getMem(vo);
if(data != null){
	response.sendRedirect("main.jsp");
}else{
	response.sendRedirect("index.jsp");
}
%> --%>