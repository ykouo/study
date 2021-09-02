<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정/삭제 화면</title>
<script type="text/javascript">
	function del(){
		result=confirm("정말로 삭제하시겠습니까?");
		if(result==true){
			document.form1.action.value="delete"; // 전체페이지에 form1이 잇는데 이 action의 값을 delete로 하겠다.
			document.form1.submit();
		}
		else{
			return;
		}
	}
</script>
</head>
<body>

<a href="control.jsp?action=list">메인으로 돌아가기</a>
<hr>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action" value="update"> <!-- submit을 하기 위해  -->
<input type="hidden" name="mnum" value="<%=data.getMnum()%>"> <!-- 사용자가 pk값인 mnum을 건들지 못하도록 -->
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="<%=data.getWriter()%>"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="<%=data.getTitle()%>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="content" value="<%=data.getContent()%>"></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><input type="date" name="date" value="<%=data.getWdate()%>"></td>
	</tr>
	<tr>
		<td colspan='2'><input type="submit" value="수정">
		<input type="button" value="삭제" onClick="del()"></td>
	</tr>
</table>
</form>

</body>
</html> 
