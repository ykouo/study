<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*" errorPage="error.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>  <%-- 한국어 인코딩 --%>  
<%-- 객체 생성과 setter매핑 --%>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO"/> <%--  messageDAO 객체 생성 --%>    
<jsp:useBean id="messageVO" class="model.message.MessageVO"/>  <%--  messageVO 객체 생성 --%> 
<jsp:setProperty property="*" name="messageVO"/> <!-- messageVO의멤버변수setter 매핑 -->

<%
	String action = request.getParameter("action"); 
	//이때 action이라는 속성이 설정되어 있어야 받아올수있으므로 해당수행이 필요한 버튼, submit에는 action속성을 넣자. 
	// action변수에 앞으로 요청받을 파라미터를 담는다.
	System.out.println(action);  // 로그 확인 / 각각 어떤 action값이 출력되는지 확인한다. 
	
	if(action.equals("list")){
		// list페이지에서 DB목록을 보여준다. 
		ArrayList<MessageVO> datas = messageDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("list.jsp");
	}else if(action.equals("insert")){
		if(messageDAO.insertDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}else{
			throw new Exception("!!! 데이터 추가 오류 발생 !!!");
		}		
	}else if(action.equals("edit")){
		if(request.getParameter("writer").equals("root")){
			MessageVO data = messageDAO.getDBData(messageVO);
			request.setAttribute("data", data);
			pageContext.forward("edit.jsp");
		}else{
			out.println("<script>alert('해당게시물의 작성자가 아닙니다!');history.go(-1)</script>");
		}
	}else if(action.equals("delete")){
		// 해당 삭제 기능은 edit 페이지에서 일어난다.
		if(messageDAO.deleteDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}else{
			throw new Exception("!!! 데이터 삭제 오류 발생 !!!");
		}
	}else if(action.equals("update")){
		// 해당 수정 기능은 edit 페이지에서 일어난다.
		if(messageDAO.updateDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}else{
			throw new Exception("!!! 데이터 변경 오류 발생 !!!");
		}
	}else{
		out.println("<script>alert('파라미터를 확인해주세요 ╯︿╰');history.go(-1)</script>");
	}


%>



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤 페이지</title>
</head>
<body>

</body>
</html>