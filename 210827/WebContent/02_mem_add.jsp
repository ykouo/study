<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberVO" class="member.memberVO"/>
<jsp:setProperty property="*" name="memberVO"/>
<jsp:useBean id="memberDAO" class = "member.memberDAO" scope="application"/>

<%
	memberDAO.addMember(memberVO);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	
		<table border="1">
			<tr>
				<td>이름</td>
				<td><%=memberVO.getUserName()%></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><%=memberVO.getUserId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=memberVO.getUserPw()%></td>
			</tr>
		
		</table>
	<a href = "02_mem_main.jsp">처음으로 돌아가기</a>
</body>
</html>