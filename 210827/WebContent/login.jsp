<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="lb" class="login.LoginBean"/> <!-- 스코프는 따로 설정하지 않으면 page이다 -->
<%-- <%
    LoginBean lb = new LoginBean(); // new 기본생성자 를 선언하는것을  <jsp:useBean id="">이 대체한다.
    lb.setUserID(); // setter
    lb.check(); // 기능사용    
    %> --%>
    <jsp:setProperty property="*" name="lb"/> 
    <%
    	if(lb.check()){
    		out.println("<h1>로그인성공oVo!</h1>");
    	}else{
    		out.println("<h1>로그인실패T-T</h1>");
    	}
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 페이지</title>
</head>
<body>
입력한 아이디 : <jsp:getProperty property="userID" name="lb"/>
입력한 패스워드: <jsp:getProperty property="userPW" name="lb"/>
<%-- <%
	lb.get(); 
%> --%>
</body>
</html>