<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="bgcolor" %>
<%
	if(session.getAttribute("mem")==null){
%>
		<form action="Practice_F.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="login">
		<table border="1" bgcolor="${bgcolor}">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="mpw"></td>
			</tr>
			<tr>
				<td colspan='2'><input type="submit" value="로그인"></td>
			</tr>
		</table>
		</form>
<%
	}
	else{
%>
	${mem}님, 환영합니다! <hr>
	<form action="Practice_F.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="logout">
		<input type="submit" value="로그아웃">
	</form>
<%
	}
%>