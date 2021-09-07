<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="post" class="model.post.PostVO" scope="request"/>
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
		<table>
		
			<tr>
				<td>Title</td>
				<td><input type="text" name ="ptitle" placeholder="제목작성" value="<%= post.getPtitle()%>"></td> <!-- name까먹지말자... -->
			</tr>
			<tr>
				<td>작성자</td>
				<td name="pwriter"><%= post.getPwriter()%></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><%= post.getPdate()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name ="pcontent" style="width:200px; height: 200px;" value="<%=post.getPcontent()%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"> <input type="button" onclick="del()" value="삭제"></td>
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