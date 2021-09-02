<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.message.*" errorPage="error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO" />
<jsp:useBean id="messageVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="messageVO"/> <!-- MessageVO 에서 setter를 호출  -->
<%
	// 컨트롤러를 호출했을때의 요청 파라미터를 분석
	String action=request.getParameter("action");
	System.out.println(action);
	if(action.equals("list")){
		// list.jsp
		ArrayList<MessageVO> datas=messageDAO.getDBList();
		// DB테이블에 있는 모든 내용을 ArrayList datas안에 모두 집어넣는다.
		request.setAttribute("datas", datas); //뷰한테 정보를 보내주는 작업
		// 1. 왜 set을 했는가? : datas의 정보를 다음페이지에서 보여줘야하니까
		// 2. 왜 request를 했는가? : 페이지간의 이동을 하기위해 control페이지를 지나가기 때문에 request를 사용하여도 정보를 주고 받을수 있기때문이다.	
		pageContext.forward("list.jsp");
	}
	else if(action.equals("insert")){
		// dao.insert()
		System.out.println(action);
		if(messageDAO.insertDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}else{
			throw new Exception("DB데이터추가오류발생!!!");
		}
	}
	else if(action.equals("delete")){
		if(messageDAO.deleteDB(messageVO)){
			// delete완료
			// 전체화면으로 돌아오기 
			response.sendRedirect("control.jsp?action=list");
		}else{
			throw new Exception("DB삭제오류발생!!!");
		}
	}
	else if(action.equals("update")){
		System.out.println(messageVO);
		if(messageDAO.updateDB(messageVO)){
			// update완료
			// 전체화면으로 돌아오기 
			response.sendRedirect("control.jsp?action=list");
		}else{
			throw new Exception("DB변경오류발생!!!");
		}
	}
	else if(action.equals("edit")){
		// 비밀번호 체크 과정 // 현재는 작성자가 같을때에만
		if(request.getParameter("writer").equals("root")){
			MessageVO data=messageDAO.getDBData(messageVO);
			request.setAttribute("data", data);
			pageContext.forward("edit.jsp");
		}else{
			out.println("<script>alert('관리자가 아닙니다!');history.go(-1)</script>");
		}
		
		
		//list.jsp에서 a 태그로 control.jsp?action=edit 을 했기 때문에 여기로 이동한다.
		// 내가 변경할 페이지 한개를 봐야하는데 getDBData()메서드를 사용해야하는 파트 
		// 검색했을때 잘못 나오는경우 --> 뷰에서 제공하는 버튼으로는 잘못된 입력을 하는 경우가 없다. 
		// 						 사용자가 잘못된 mnum을 url에 직접 입력할수 있기 때문에  
		// 						 => 오류 페이지로 처리한다.
		/* MessageVO data=messageDAO.getDBData(messageVO);
		request.setAttribute("data", data);
		pageContext.forward("edit.jsp"); */
		// 사용자가 잘못된 mnum를 건네는 경우는 없다!
		// -> 오류페이지로 처리!
	}
	else{
		// 에러페이지 연결해도 되고 
		// 파라미터를 확인하도록 안내해도 된다
		/* out.println("파라미터 확인!"); */
		out.println("<script>alert('파라미터확인');history.go(-1)</script>");
		//throw new Exception("파라미터 확인!");
	}
%>













<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러</title>
</head>
<body>

</body>
</html> 
