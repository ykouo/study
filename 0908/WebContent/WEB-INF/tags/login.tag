<%@ tag language="java" pageEncoding="UTF-8"%>
<form method="post" action="control.jsp">
	<input type="hidden" name="action" value="login">
	<table border="1">
		<tr>
			<td>ID</td>
			<td><input type="text" name="mid" required="required" placeholder="아이디입력"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="mpw" required="required" placeholder="비밀번호 입력"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>	
	</table>
</form>