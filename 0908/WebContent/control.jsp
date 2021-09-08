<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.member.*" errorPage="error.jsp" %>
<jsp:useBean id="memvo" class = "model.member.MemberVO"/>
<jsp:useBean id="memdao" class = "model.member.MemberDAO"/>
<jsp:setProperty property="*" name="memvo"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String action = request.getParameter("action");
	

	if(action.equals("showMemList")){	//R selectAll
		ArrayList<MemberVO> memList = memdao.memberList();
		request.setAttribute("memList", memList);
		pageContext.forward("memberList.jsp");
	}
	else if(action.equals("login")){
		MemberVO mem = memdao.getMemInfo(memvo);
		if(mem!=null){
			session.setAttribute("mem", mem);
			response.sendRedirect("control.jsp?action=showMemList");
		}else{
			out.println("<script>alert('로그인 실패');history.go(-1);</script>");
		}
	}
	else if(action.equals("logout")){
	
		session.invalidate();
		response.sendRedirect("control.jsp?action=showMemList");
	
	}else if(action.equals("signIn")){	//C
		if(memdao.insertMem(memvo)){
			response.sendRedirect("login.jsp");
		}else{
			throw new Exception("회원가입실패!");
		}
	}else if(action.equals("signOut")){	//D
		MemberVO vo = (MemberVO)session.getAttribute("mem");
		System.out.println("signout="+vo);
		if(memdao.deleteMem(vo)){
			session.invalidate(); // 세션정보 초기화 한 후 
			response.sendRedirect("control.jsp?action=showMemList");
		}else{
			throw new Exception("회원탈퇴실패!");
		}
	}else if(action.equals("mypage")){
		
		response.sendRedirect("mypage.jsp");
	
	}else if(action.equals("updateMemInfo")){	//R selectOne
		System.out.println("updateMemInfo="+memvo);
		if(memdao.updateMem(memvo)){
			out.println("<script>alert('회원정보변경완료! 재로그인 부탁드립니다.');history.go(-1);</script>");
			response.sendRedirect("control.jsp?action=logout");
		}else{
			throw new Exception("회원정보 수정 실패!");
		}
	}


%>