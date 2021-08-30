<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 완료된 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); // 한글데이터를 받아올수있기때문에 설정
	String id = request.getParameter("id"); // main.jsp 페이지에서 입력받은 id값을 받아 id변수에 저장한다.
	System.out.println(id);		
	// 메인에서 아이디값이 넘어올때만 등록 되도록
	if(id !=null){
		session.setAttribute("id", id);	
	}	
%>
<h1>현재 페이지</h1>
<form action="03_sns_add.jsp" method = "post">
	[<%=session.getAttribute("id") %>] <input type="text" name="msg"><input type="submit" value="보내기">
</form>
<hr>
<ol>
<%
	ArrayList<String> msgs=(ArrayList<String>)application.getAttribute("msgs");
	//무언가를 getAttribute를 하려면 setAttribute를 했어야했는데
	// 최초로 메세지가 등록되는 곳에서 한다.
	// 이때 setAttribute는 03_sns_add.jsp 페이지에서한다.
	if(msgs!=null){
		for(String v:msgs){
			out.println("<li>"+v+"</li>");
		}
	}
%>
</ol>
</body>
</html>