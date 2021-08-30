<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글등록페이지</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8"); // 한글 받아옴
		
	String msg = request.getParameter("msg");	// 메세지를 받아온다.
	String id = (String)session.getAttribute("id");	//세션에 저장된 id값을 받아온다.
	ArrayList<String> msgs = (ArrayList<String>)application.getAttribute("msgs");
	if(msgs==null){
		// 최초등록
		msgs=new ArrayList<String>();
		application.setAttribute("msgs", msgs);
	}
	msgs.add(id+"님이 ["+msg+"]등록");
	
	response.sendRedirect("02_sns_Login.jsp");
%>



</body>
</html>