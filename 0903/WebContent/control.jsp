<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.mem.*"%>
<jsp:useBean id="memdao" class="model.mem.MemDAO"/>
<jsp:useBean id="memvo" class="model.mem.MemVO"/>
<<jsp:setProperty property="*" name="memvo"/>
<% request.setCharacterEncoding("UTF-8");%> 

<% 
	String action= request.getParameter("action");
	
	if(action.equals("login")){
		System.out.println("컨트롤러 로그인 안");
		MemVO user = memdao.getMemInfo(memvo);
		System.out.println(user);
		if(user!=null){
			System.out.println("여기까지 와줭...ㅜㅜ");
			session.setAttribute("user", user); // 여기서 mem==DAO에서 리턴하는 mem
			response.sendRedirect("completeLogin.jsp"); //로그인완료페이지로 보낼꺼
		}else{
			out.println("<script>alert('로그인실패!');history.go(-1)</script>");
		}
				
	}else if(action.equals("logout")){
		System.out.println("컨트롤러 로그아웃 안");
		session.invalidate();
		response.sendRedirect("CustomTag2.jsp"); 
	}



%>