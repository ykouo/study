<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>

<form action="control.jsp" method ="post" id="form1" name="form1">
	<input type="hidden" name="action" value="login">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name ="mid" placeholder="아이디입력"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name ="mpw" placeholder="아이디입력"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="login"></td>
	</tr>
</table>
</form>