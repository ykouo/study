<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- id/password 체크 -->
<% 
	// 순수 자바코드 
	request.setCharacterEncoding("UTF-8"); //내장객체이므로 request바로 사용가능
	
	String id = request.getParameter("id");
	System.out.println("도착한데이터["+request.getParameter("id")+"]");
	
	String pw = request.getParameter("pw");	
	System.out.println("도착한데이터["+request.getParameter("pw")+"]");
	
	if(id.equals("")){	// 만약 id 
		//login
		out.println("<script>alert('id입력하세요');history.go(-1);</script>");
	}else if(pw.equals("")){	
		//pw
		out.println("<script>alert('password 입력하세요');history.go(-1);</script>");
	}else{
		// 
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		// 세션에 정보가 저장되어 있어 리다이렉팅 사용하여도 정보가 남아있음 
		// 화면전환 Redirect 사용
		// forwarding 사용도 가능하나 현재 스크립트릿 안에 있기때문에 redirect사용
		response.sendRedirect("main.jsp");
	}

%>