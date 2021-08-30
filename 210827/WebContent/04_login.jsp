<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="member.memberDAO" scope="application"/>
<jsp:useBean id="vo" class="member.memberVO" />
<jsp:setProperty property="*" name="vo"/>
<%
   memberVO res=dao.login(vo);
   if(res!=null){ // 세션 scope로 로그인 인증정보를 저장!
      out.println("로그인 성공!<br>");
   }
   else{
      out.println("로그인 실패!<br>");
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 페이지 </title>
</head>
<body>

<hr>
<a href="04_main.jsp">처음으로</a>

</body>
</html>