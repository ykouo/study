<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	id = id.toLowerCase(); //사용자가 대문자를 섞어서 입력할수도 있으니까 
	//System.out.println(id+"확인1");
	session.setAttribute("id", id);
	if(id.equals("관리자") || id.equals("admin")){
		response.sendRedirect("admin.jsp");
	}else if(id!=""){
		response.sendRedirect("user.jsp");
	}else{
		out.println("<script>alert('아이디를 입력하세요');history.go(-1);</script>");
	}

%>