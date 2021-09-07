<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.post.*,model.mem.*" %>

<jsp:useBean id="post" class = "model.post.PostVO" scope="request" />
<jsp:useBean id="postdao" class ="model.post.PostDAO"/>
<jsp:setProperty property="*" name="post"/> 


<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기 페이지</title>
</head>
<body>

<h1>게시글 상세보기</h1>
<hr>
	<% 
		 System.out.println("showPost페이지 : " + request.getAttribute("post")); // 요기로 안들어와요
		/* System.out.println("postdao: " + postdao.getPostOne(post)); */
	%> 
	<form action="control.jsp" method="post">
		<input type="hidden" name ="action" value="editPost">
		<input type="hidden" name="pnum" value="<%=post.getPnum()%>" >
		<table>
			<tr>
				<td>Title</td>
				<td><%=post.getPtitle()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=post.getPwriter()%></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><%=post.getPdate()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%=post.getPcontent()%></td>
			</tr>
	<%if(session.getAttribute("user") != null){ %>	
			<tr>
				<td colspan="2"><input type="submit" value="수정">
			</td>			
			</tr>
		</table>
		</form>
	<hr>

	<%} else{%>
		</table>
		</form>
	<%} %>
	<hr>
	<form action="control.jsp" method="post" >
		<input type="hidden" name="action" value="main" >
		<input type="submit" value="메인으로 돌아가기">
	</form>

</body>
</html>