<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*" errorPage ="error.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="messageDAO" class = "model.message.MessageDAO"/> <%-- messageDAO 선언 --%> 
<jsp:useBean id="messageVO" class = "model.message.MessageVO"/>
<jsp:setProperty property="*" name="messageVO"/>

<% 
	// 컨트롤러를 호출했을때의 요청 파라미터를 분석
	String action = request.getParameter("action");
	System.out.println(action);
	
	if(action.equals("list")){
		// list.jsp
		ArrayList<MessageVO> datas = messageDAO.getDBList(); 
		// DB테이블에 있는 모든 내용을 ArrayList datas안에 모두 집어넣는다.
		request.setAttribute("datas", datas); // 뷰한테 정보를 보내주는 작업
		// 1. 왜 set을 했는가? : datas의 정보를 다음페이지에서 보여줘야하니까
		// 2. 왜 request를 했는가? : 페이지간의 이동을 하기위해 control페이지를 지나가기 때문에 request를 사용하여도 정보를 주고 받을수 있기때문이다.		
		pageContext.forward("list.jsp");
	
	
	}else if(action.equals("insert")){
		// dao.insert
		
	}else if(action.equals("delete")){
		// list.jsp
		
	}else if(action.equals("update")){
		System.out.println(messageVO);
		
	}else if(action.equals("edit")){ //list.jsp에서 a 태그로 control.jsp?action=edit 을 했기 때문에 여기로 이동한다.
		// 내가 변경할 페이지 한개를 봐야하는데 getDBData()메서드를 사용해야하는 파트 
		// 검색했을때 잘못 나오는경우 --> 뷰에서 제공하는 버튼으로는 잘못된 입력을 하는 경우가 없다. 
		// 						 사용자가 잘못된 mnum을 url에 직접 입력할수 있기 때문에  
		// 						 => 오류 페이지로 처리한다.
		// 검색했을때 잘 나오는 경우 
		MessageVO data = messageDAO.getDBData(messageVO);
		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
			
	}else{
		// 에러페이지 연결해도 되고 
		// 파라미터를 확인하도록 안내해도 된다
		out.println("파라미터 확인요망!");
	}


%>














<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러 페이지</title>
</head>
<body>

</body>
</html>