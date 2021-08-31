<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,model.member.*,model.message.*" %>

<% request.setCharacterEncoding("UTF-8"); %> <!-- 한국어  -->

<!-- 객체생성  -->
<jsp:useBean id="messageDAO" class = "model.message.MessageDAO"/> 
<jsp:useBean id="messageVO" class = "model.message.MessageVO"/> 
<jsp:useBean id="memberDAO" class = "model.member.MemberDAO"/>
<jsp:useBean id="memberVO" class = "model.member.MemberVO"/>
<!--  setter매핑 -->
<jsp:setProperty property="*" name="memberVO"/>

<%
	String action = request.getParameter("action");
	
	if(action.equals("main")){
		ArrayList<MessageVO> datas=messageDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("member_main.jsp");
		
	}else if(action.equals("login")){
		MemberVO mem = memberDAO.getMemData(memberVO);
		if(mem!=null){
			session.setAttribute("mem",mem);			
			response.sendRedirect("member_control.jsp?action=main");
		}else{
			out.println("<script>alert('로그인fail');history.go(-1)</script>");
		}
	}else if(action.equals("logout")){
		session.invalidate(); // 세션정보 초기화
		response.sendRedirect("member_control.jsp?action=main");
		
	}else if(action.equals("edit")){
		if(session.getAttribute("mem") == null){
			out.println("<script>alert('로그인하세요');history.go(-1)</script>");		
		}else{
			MemberVO vo=(MemberVO)session.getAttribute("mem");
	         if(vo.getMpw().equals(request.getParameter("pw"))){
	        	// message-writer == 세션에 등록된 mem의 mid가 동일하다면 
	            MessageVO data=messageDAO.getDBData(messageVO);
	            request.setAttribute("data", data);
	            pageContext.forward("edit.jsp");
	            }else{
	            	System.out.println("확인1");
	            }
		}
	}else{
		
	}

%>
