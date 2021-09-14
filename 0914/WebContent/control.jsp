<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,model.message.*,model.user.*"%>
<jsp:useBean id="mDAO" class="model.message.MessageDAO" />
<jsp:useBean id="mVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="mVO" />
<jsp:useBean id="rDAO" class="model.message.ReplyDAO" />
<jsp:useBean id="rVO" class="model.message.ReplyVO" />
<jsp:setProperty property="*" name="rVO" />
<jsp:useBean id="uDAO" class="model.user.UserDAO" />
<jsp:useBean id="uVO" class="model.user.UserVO" />
<jsp:setProperty property="*" name="uVO" />

<%
	String action= request.getParameter("action");
	String url = "control.jsp?action=main";
	String mcnt1 = request.getParameter("mcnt");	// 페이징 처리를 위해 사용하는 mcnt변수 
	int mcnt = 0;

	// 이전 페이지에서 받아온 정보를 저장하는 역할
	if(mcnt1!=null){
		mcnt = Integer.parseInt(mcnt1); // 받아온 mcnt1이 String 타입이기 때문에 Int타입으로 형변환 캐스팅 
	}
	url = url+"&mcnt="+mcnt;
	String selUser = request.getParameter("selUser"); //이전 페이지에서 selUser 로 받아온 파라미터 
	
	if(selUser!=null){
		url=url+"&selUser="+selUser;
	} 
	// ==================================================
			
	if(action.equals("main")){
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt); // selectAll 의 첫번쨰 인자로 활용되는 selUser
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		pageContext.forward("main.jsp");
		
	}else if(action.equals("login")){
		if(uDAO.login(uVO)){
			session.setAttribute("seUser", uVO.getUserid()); // 
			response.sendRedirect(url);
		}else{
			out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
		}
		
	}else if(action.equals("logout")){
			session.invalidate();
			response.sendRedirect("control.jsp?action=main");		
	}
	
	else if(action.equals("newmsg")){
		if(mDAO.insert(mVO)){
			System.out.println("게시글등록 성공");
		}else{
			System.out.println("게시글등록 실패");
		}
		response.sendRedirect(url);
	}
	
	else if(action.equals("showMsg")){
		System.out.println("확인"+mVO.getMid());
		MessageSet data = mDAO.selectOne(mVO);
		request.setAttribute("data", data);
		System.out.println(data);
		pageContext.forward("showMsg.jsp");
	
	}else if(action.equals("newreply")){
		if(rDAO.insertRe(rVO)){
			System.out.println("댓글등록 성공");
		}else{
			System.out.println("댓글등록 실패");
		}
		response.sendRedirect(url);
		
	}else if(action.equals("join")){
		if(uDAO.insert(uVO)){
			out.println("<script>alert('회원가입 완료!');</script>");
			System.out.println("회원가입 성공");
			response.sendRedirect("control.jsp?action=main");	
		}else{
			out.println("<script>alert('회원가입 실패!');history.go(-1)</script>");
			System.out.println("회원가입 실패");
		}
	}
%>