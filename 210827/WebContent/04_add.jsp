<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //한국어 셋팅
%>
<jsp:useBean id="memberVO" class="member.memberVO" scope = "application"/>
<jsp:useBean id="memberDAO" class="member.memberDAO" scope = "application"/>
<jsp:setProperty property="*" name="memberVO"/>
<%
	memberDAO.insert(memberVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버추가 페이지</title>
</head>
<body>
<h2> 등록하실 아이디 / 비밀번호 </h2>
<hr>
<h4>
[ 이름 ] : <%=memberVO.getUserName() %>
[ ID ] : <%=memberVO.getUserID() %>
[ Password ] : <%=memberVO.getUserPW() %><br>
</h4>
<hr>
<a href = "04_main.jsp"><button>회원가입페이지로</button></a>


</body>
</html>