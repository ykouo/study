<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.board.*"%>
<jsp:useBean id="freevo" class = "model.board.FreeBoVO" scope="request" />
<jsp:useBean id="freedao" class ="model.board.FreeBoDAO"/>
<jsp:setProperty property="*" name="freevo"/> 


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
		 System.out.println("showPost페이지 : " + request.getAttribute("freevo")); // 요기로 안들어와요
	%>  
	<form action="control.jsp" method="post">
		<input type="hidden" name ="action" value="editPost">
		<input type="hidden" name="pnum" value="<%=freevo.getPnum()%>" >
		<table>
			<tr>
				<td>번호</td>
				<td><%=freevo.getPnum()%></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><%=freevo.getPcontent()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=freevo.getPtitle()%></td>
			</tr>
			<tr>
				<td>회원닉네임</td>
				<td><%=freevo.getMname()%></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><%=freevo.getMid()%></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><%=freevo.getPdate()%></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><%=freevo.getCnt()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%=freevo.getPcontent()%></td>
			</tr>
		
			<tr>
				<td colspan="2"><input type="submit" value="수정">

			</td>			
			</tr>
		</table>
		</form>
	<hr>

	<hr>
	<form action="control.jsp" method="post" >
		<input type="hidden" name="action" value="main" >
		<input type="submit" value="메인으로 돌아가기">
	</form>

</body>
</html>