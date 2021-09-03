<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>

<form method="post" action="control.jsp" name="form1">
	<input type="hidden" name="action" value="login">
	<table border="${border}" bgcolor="${bgcolor}" >
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" placeholder="아이디입력"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" placeholder="비밀번호입력"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>