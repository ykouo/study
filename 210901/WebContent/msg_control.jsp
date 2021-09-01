<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.message.*" errorPage="error.jsp"%>

<% 
request.setCharacterEncoding("UTF-8"); 

String condition = request.getParameter("condition");
String content = request.getParameter("content");
/* System.out.println(condition+" "+content); */

%>  <%-- 한국어 인코딩 --%>  
<%-- 객체 생성과 setter매핑 --%>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO"/> <%--  messageDAO 객체 생성 --%>    
<jsp:useBean id="messageVO" class="model.message.MessageVO"/>  <%--  messageVO 객체 생성 --%> 
<jsp:setProperty property="*" name="messageVO"/> <!-- messageVO의멤버변수setter 매핑 -->
<!-- 문제가 되는건 아니고 그냥 궁금해서 그러는건데욥 여기에 usebean 하고나서 저 page쪽에 model들을 import하는 이유가 궁금해서
아하  그러면 아래에 data 변수를  MessageVO로 받기 위해서 임포트 하는것!넵!   -->
<%
	

	String action = request.getParameter("action"); 
	
	System.out.println(action);  
	
	if(action.equals("list")){
		// list페이지에서 DB목록을 보여준다. 
		ArrayList<MessageVO> datas = messageDAO.getMsgList();
		request.setAttribute("datas", datas);
		pageContext.forward("msg_list.jsp");
	}else if(action.equals("insert")){
		if(messageDAO.insertMsg(messageVO)){
			response.sendRedirect("msg_control.jsp?action=list");
		}else{
			throw new Exception("!!! 데이터 추가 오류 발생 !!!");
		}		
	}else if(action.equals("edit")){
		if(request.getParameter("writer").equals("root")){
			MessageVO data = messageDAO.getMsgData(messageVO);
			request.setAttribute("data", data);
			pageContext.forward("msg_edit.jsp");
		}else{
			out.println("<script>alert('해당게시물의 작성자가 아닙니다!');history.go(-1)</script>");
		}
	}else if(action.equals("delete")){
		// 해당 삭제 기능은 edit 페이지에서 일어난다.
		if(messageDAO.deleteMsg(messageVO)){
			response.sendRedirect("msg_control.jsp?action=list");
		}else{
			throw new Exception("!!! 데이터 삭제 오류 발생 !!!");
		}
	}else if(action.equals("update")){
		// 해당 수정 기능은 edit 페이지에서 일어난다.
		if(messageDAO.updateMsg(messageVO)){
			response.sendRedirect("msg_control.jsp?action=list");
		}else{
			throw new Exception("!!! 데이터 변경 오류 발생 !!!");
		}
	}else if(action.equals("search")){
		System.out.println(request.getParameter("condition"));
		System.out.println(request.getParameter("content"));
		ArrayList<MessageVO> datas = messageDAO.searchTitle(condition, content);
		request.setAttribute("datas", datas);
		pageContext.forward("msg_list.jsp");
	}
	else{
		out.println("<script>alert('파라미터를 확인해주세요 ╯︿╰');history.go(-1)</script>");
	}


%>
 
