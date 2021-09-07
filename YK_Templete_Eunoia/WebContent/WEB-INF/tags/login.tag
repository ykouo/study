<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>



<form action="control.jsp" method="post" id="form1" name="form1">
	<input type="hidden" name="action" value="login">
	<div class="row gtr-uniform">
		<div class="col-6 col-12-xsmall">
			<input type="text" name="mid" id="demo-name" placeholder="아이디입력" />
		</div>
		<div class="col-6 col-12-xsmall">
			<input type="password" name="mpw" id="demo-email" placeholder="비밀번호입력" />
		</div>
		<div class="col-6 col-12-xsmall">
			<input type="submit" value="login">
		</div>
	
</form>
