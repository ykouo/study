<%@page import="model.message.*"%>
<%@page import="model.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%><!--  한글인코딩 -->
 <jsp:useBean id="memvo" class="model.member.MemberVO"/>
 <jsp:useBean id="memdao" class="model.member.MemberDAO"/>
 <jsp:useBean id="msgvo" class="model.message.MessageVO"/>
 <jsp:useBean id="msgdao" class="model.message.MessageDAO"/>
 <jsp:setProperty property="*" name="msgvo"/>
 <jsp:setProperty property="*" name="memvo"/>
<%
	String action = request.getParameter("action");
	if(action.equals("main")){	 // mem_index.jsp가 실행이되면 해당 if문으로 들어오는데 
		pageContext.forward("mem_main.jsp"); 
	}else if(action.equals("login")){
		MemberVO member = memdao.getMemData(memvo);
		if(member!=null){
			session.setAttribute("mem", member);
			response.sendRedirect("msg_control.jsp?action=list");
		}else{
			out.println("<script>alert('로그인실패!');history.go(-1)</script>");
		}
	}else if(action.equals("logout")){
		session.invalidate();
		response.sendRedirect("mem_control.jsp?action=main");		
	}else if(action.equals("edit")){
		if(session.getAttribute("mem")==null){
			out.println("<script>alert('로그인 후 이용가능합니다(꾸벅)');history.go(-1)</script>");
		}else{
			MemberVO vo = (MemberVO)session.getAttribute("mem"); 
			if(vo.getMpw().equals(request.getParameter("pw"))){
				MessageVO message = msgdao.getMsgData(msgvo);
				request.setAttribute("msg", message);
				pageContext.forward("msg_edit.jsp");
			}else{
				System.out.println("확인1");
			}
		}		
	}else if(action.equals("join")){
		if(memdao.insertMember(memvo)){
			response.sendRedirect("mem_control.jsp?action=main");
		}else{
			throw new Exception("!!! 데이터 추가 오류 발생 !!!");
		}
		
	}else{
		System.out.println("확인2");	
	}
	
%>