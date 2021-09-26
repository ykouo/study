<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="post" class="model.board.FreeBoVO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정/삭제 페이지 </title>
<script type="text/javascript">
	function del(){
		result=confirm("정말로 삭제하시겠습니까?");
		if(result==true){
			document.form1.action.value="deletePost";
			document.form1.submit();
		}
		else{
			return;
		}
	}

		
	
</script>
</head>
<body>
<h1>글 수정/삭제 페이지 </h1>
<hr>	
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="updatePost">
		<input type="hidden" name="pnum" value="<%=post.getPnum() %>" >
		<input type="hidden" name="mid" value="<%=post.getMid()%>" >
		<table>
			<tr>
				<td>번호</td>
				<td><%=post.getPnum()%></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><%=post.getCategory()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name ="ptitle" placeholder="제목작성" value="<%= post.getPtitle()%>"></td>
			</tr>
			<tr>
				<td>회원닉네임</td>
				<td><%=post.getMname()%></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><%=post.getMid()%></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><%=post.getPdate()%></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><%=post.getCnt()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name ="pcontent" style="width:200px; height: 200px;" value="<%=post.getPcontent()%>"></td>
			</tr>
		
			<tr>
				<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" onclick="del()" value="삭제">
				</td>			
			</tr>
		</table>
	</form>

<hr>
<%-- 	<form action ="control.jsp" method="post">
		<input type="hidden" name="action" value="deletePost" >
		<input type="hidden" name="pnum" value="<%=post.getPnum() %>" >
		<input type="submit" value="삭제">
	</form>
 --%>




</body>
</html>