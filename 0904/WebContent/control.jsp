<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.post.*,model.mem.*,java.util.*" errorPage="error.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%><!-- 한국어 인코딩 -->
<%-- 객체생성 / setter 매핑 --%>
<jsp:useBean id="memvo" class="model.mem.MemVO" />
<jsp:useBean id="memdao" class="model.mem.MemDAO" />
<jsp:useBean id="postvo" class="model.post.PostVO" />
<jsp:useBean id="postdao" class="model.post.PostDAO" />

<jsp:setProperty property="*" name="memvo" />
<jsp:setProperty property="*" name="postvo" />

<%
	String action = request.getParameter("action");

	System.out.println("액션파라미터값 = " + action); // action파라미터 확인
	// 메인 화면 로딩
	if(action.equals("main")){
		ArrayList<PostVO> postList = postdao.getPostList();
		request.setAttribute("postList", postList); 
		pageContext.forward("main.jsp");
	}
	// 로그인
	else if(action.equals("login")){
		MemVO user = memdao.getUserData(memvo);
		if(user!=null){
			session.setAttribute("user", user);
			response.sendRedirect("control.jsp?action=main"); // 로그인 완료되면 메인페이지로 
		}else{
	out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
		}
	}
	// 로그아웃
	else if(action.equals("logout")){
		session.invalidate();
		response.sendRedirect("control.jsp?action=main"); // 로그아웃 완료되면 메인페이지로 
	}
	// 회원가입
	else if(action.equals("join")){
		if(memdao.insertUser(memvo)){
			response.sendRedirect("login.jsp"); // 회원가입 완료되면 메인 페이지로 
		}else{
			throw new Exception(" ※※※ 회원가입 오류 발생 ※※※ ");
		}
	}
	// 새게시글 작성 페이지 이동
	else if(action.equals("posting")){
		pageContext.forward("posting.jsp");
	}
	// 새게시글 작성 
	else if(action.equals("insertPost")){
		if(postdao.insertPost(postvo)){	
			response.sendRedirect("control.jsp?action=main");
		}else {
			throw new Exception(" ※※※ 새 게시글 작성 오류 발생 ※※※ ");
		}
	
	}
	// 마이페이지 보기 
	else if(action.equals("myPage")){	
			MemVO user = memdao.getUserData(memvo);
			request.setAttribute("user", user);	
			response.sendRedirect("mypage.jsp");
		}
	// 회원정보변경
	else if(action.equals("editUserInfo")){
		MemVO user = memdao.getUserData(memvo);
		session.setAttribute("user", user);
		if(memdao.updateUser(memvo)){
			response.sendRedirect("control.jsp?action=logout");
		}else{
			throw new Exception(" ※※※ 회원정보변경오류 발생 ※※※ ");
		}
	}
	// 게시글 수정 페이지로 가기  
	else if(action.equals("editPost")){
		PostVO post = postdao.getPostOne(postvo);
		System.out.println("action editPost: "+ post); //콘솔확인
		request.setAttribute("post", post);
		pageContext.forward("editPost.jsp");
	}
	// 게시글 상세보기 셋팅 
	else if(action.equals("showpost")){
		PostVO post = postdao.getPostOne(postvo);
		System.out.println("action showpost: "+ post); //여기까지 잘 들어옴 
		request.setAttribute("post",post); 	// 셋팅도 됬나?
		System.out.println("action showpost2: "+ post); // 됐으.. 근데 왜 안넘어가지.. 값이?? 		 여기까지는 잘 들어오거든요
		pageContext.forward("showPost.jsp"); // 우왕... sendRedirect가 새로운값을 셋팅할때...	
	}
	// 게시글 수정  
	else if(action.equals("updatePost")){
		if(postdao.updatePost(postvo)){
			response.sendRedirect("control.jsp?action=main");
		}else{
			throw new Exception(" ※※※ 게시글 수정 오류 발생 ※※※ ");
		}
	}
	
	// 검색 
	else if(action.equals("search")){ 
		String condition = request.getParameter("condition");
		String content = request.getParameter("content"); 
		System.out.println("condition : "+ condition);
		System.out.println("content : "+ content);
	
		ArrayList<PostVO> searchList = postdao.searchPostList(condition, content);
		
		/* System.out.println("searchList : " + searchList); */
		request.setAttribute("postList", searchList); 
		pageContext.forward("main.jsp");
	}
	// 회원탈퇴
	else if(action.equals("deleteUser")){		
		MemVO vo = (MemVO)session.getAttribute("user");
		System.out.println("deleteUser() : " + vo);
		if(memdao.deleteUser(vo)){
			session.invalidate();
			response.sendRedirect("control.jsp?action=main");
		}else{
			throw new Exception(" ※※※ 회원탈퇴 오류발생 ※※※ ");
		}
	}else if(action.equals("deletePost")){
		System.out.println("control deletePost :" + postvo.getPnum() );
		
		if(postdao.deletePost(postvo)){
			response.sendRedirect("control.jsp?action=main");
		}else{
			throw new Exception(" ※※※ 게시글 삭제 오류발생 ※※※ ");
		}
	}else{
		
	}
%>
