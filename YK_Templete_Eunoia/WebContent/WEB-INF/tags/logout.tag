<%@ tag language="java" pageEncoding="UTF-8"%>
<form method="post" action="control.jsp" name="form1">
	<input type="hidden" name="action" value="logout"> 
	<input type="submit" value="로그아웃">
</form>
<form action="control.jsp" method="post">
		<input type="hidden" name = "action" value="myPage">
		<input type="submit" value="마이페이지">
	</form>