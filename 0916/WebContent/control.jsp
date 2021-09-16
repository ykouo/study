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
	int mcnt = 2;
	
	// 이전 페이지에서 받아온 정보를 저장하는 역할
	if(mcnt1!=null){
		mcnt = Integer.parseInt(mcnt1); // 받아온 mcnt1이 String 타입이기 때문에 Int타입으로 형변환 캐스팅 
	}
	url = url+"&mcnt="+mcnt;
	String selUser = request.getParameter("selUser"); //이전 페이지에서 selUser 로 받아온 파라미터 
	
	if(selUser!=null){ 
		url=url+"&selUser="+selUser;
	}
	
	int cnt = 2;	
	//중요! 
	String cnt1 = request.getParameter("cnt");
	System.out.println("cnt값 : "+cnt1);
	if(cnt1!=null){
		cnt= Integer.parseInt(cnt1);
		url=url+"&cnt="+cnt;
	}
	
	// ==================================================
			
	if(action.equals("main")){
		ArrayList<MessageSet> datas = mDAO.selectAll(selUser, mcnt); // selectAll 의 첫번쨰 인자로 활용되는 selUser
		ArrayList<UserVO> newUsers = uDAO.selectAll();	
		int userCnt = mDAO.getCnt(selUser);
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		request.setAttribute("userCnt",userCnt);
		request.setAttribute("cnt", cnt);
		pageContext.forward("main.jsp");
		
	}
	// 로그인
	else if(action.equals("login")){
		if(uDAO.login(uVO)){
			session.setAttribute("seUser", uVO.getUserid()); // 
			response.sendRedirect(url);
		}else{
			out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
		}
		
	}
	// 로그아웃
	else if(action.equals("logout")){
			session.invalidate();
			response.sendRedirect("control.jsp?action=main");		
	}
	// 댓글등록	
	else if(action.equals("newmsg")){
		if(mDAO.insert(mVO)){
			System.out.println("게시글등록 성공");
		}else{
			System.out.println("게시글등록 실패");
		}
		response.sendRedirect(url); //"control.jsp?action=main&mid&"+mVO.getMid()+"&selUser="+selUser+"&mcnt="+mcnt+"&cnt="+(cnt+2)
	}
	// 대댓글등록
	else if(action.equals("newreply")){
		if(rDAO.insertRe(rVO)){
			System.out.println("댓글등록 성공");
		}else{
			System.out.println("댓글등록 실패");
		}
		response.sendRedirect(url);		
	}
	// 회원가입
	else if(action.equals("join")){
		if(uDAO.insert(uVO)){
			out.println("<script>alert('회원가입성공!');window.close();</script>");
			System.out.println("회원가입 성공");
			//response.sendRedirect("control.jsp?action=main");	
		}else{
			out.println("<script>alert('회원가입 실패!');history.go(-1)</script>");
			System.out.println("회원가입 실패");
		}
	}
	else if(action.equals("updateMsg")){
		mDAO.update(mVO);
		System.out.println("update"); 
		System.out.println("selUser=" +selUser); //null --- why??? 
		response.sendRedirect(url);	}
	// msg삭제
	else if(action.equals("deleteMsg")){
		System.out.println("msg삭제 : " + selUser);	
		if(mDAO.delete(mVO)){
			System.out.println("msg삭제 성공");	
		}else{
			System.out.println("msg삭제 실패");
		}
		response.sendRedirect(url);	}
	// reply삭제
	else if(action.equals("deleteReply")){
		System.out.println("deleteReply : " + rVO);
		if(rDAO.deleteRe(rVO)){
			System.out.println("대댓글 삭제 성공");			
		}else{
			System.out.println("대댓글 삭제 실패");
		}
		response.sendRedirect(url);
	}
%>