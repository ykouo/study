<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , model.board.*"%>
<!-- 한국어encoding -->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- vo -->
<jsp:useBean id="freevo" class ="model.board.FreeBoVO"/>
<jsp:useBean id="studyvo" class ="model.board.StudyBoVO"/>
<jsp:useBean id="noticevo" class ="model.board.NoticeBoVO"/>
<!-- dao -->
<jsp:useBean id="freedao" class ="model.board.FreeBoDAO"/>
<jsp:useBean id="studydao" class ="model.board.StudyBoDAO"/>
<jsp:useBean id="noticedao" class ="model.board.NoticeBoDAO"/>
<jsp:useBean id="paging" class ="model.common.Paging"/>
<!-- setter매핑 -->
<jsp:setProperty property="*" name="freevo"/>
<jsp:setProperty property="*" name="studyvo"/>
<jsp:setProperty property="*" name="noticevo"/>


<% 
	String action = request.getParameter("action");

	if(action.equals("main")){
		ArrayList<FreeBoVO> fpList = freedao.getFreePostList();
		request.setAttribute("fpList", fpList);
		pageContext.forward("Test.jsp");
		int blockStartNum = paging.getBlockStartNum();
		int blockLastNum = paging.getBlockLastNum();
		int lastPageNum = paging.getLastPageNum();
	
	}
	// 게시글 상세보기 
	else if(action.equals("showpost")){
		FreeBoVO freepost = freedao.getFreePost(freevo); // select one 1
		request.setAttribute("freepost",freepost); 	// 셋팅
		System.out.println("action showpost2: "+ freepost); //
		pageContext.forward("showPost.jsp"); // 
	}
	// 새게시글 작성 페이지 이동
		else if(action.equals("posting")){
			pageContext.forward("posting.jsp");
		}
		// 새게시글 작성 
		else if(action.equals("insertPost")){
			if(freedao.insertFreePost(freevo)){	
				response.sendRedirect("control.jsp?action=main");
			}else {
				throw new Exception(" ※※※ 새 게시글 작성 오류 발생 ※※※ ");
			}
		
		}

	// 게시글 수정 페이지로 가기  
	else if(action.equals("editPost")){
		FreeBoVO post = freedao.getFreePost(freevo); // 수정 : selectone 
		System.out.println("action editPost: "+ post); //콘솔확인
		request.setAttribute("post", post);
		pageContext.forward("editPost.jsp");
	}
	
	// 게시글 수정  
	else if(action.equals("updatePost")){
		if(freedao.editFreePost(freevo)){
			response.sendRedirect("control.jsp?action=main");
		}else{
			throw new Exception(" ※※※ 게시글 수정 오류 발생 ※※※ ");
		}
	}
	// 게시글 삭제
	else if(action.equals("deletePost")){
		System.out.println("control deletePost :" + freevo.getPnum() + freevo.getMid());
		
		if(freedao.delFreePost(freevo)){
			response.sendRedirect("control.jsp?action=main");
		}else{
			throw new Exception(" ※※※ 게시글 삭제 오류발생 ※※※ ");
		}
	}
	
%>