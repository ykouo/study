<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* ,model.message.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" /> <!-- 글목록을 보여줄 MessageDB데이터를 담은 ArrayList -->

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>로그인, 회원등록 페이지</title>
<script type="text/javascript">
	function check(mnum){
		pw = prompt("글정보변경을 위해 비밀번호를 입력하세요:D");
		document.location.href="member_cotrol.jsp?action=edit&mnum="+mnum+"&pw="+pw;
	}
</script>

<style type="text/css">
a {
	text-decoration: none;
	color: salmon;
	font-weight: bold;
}

h2 {
	background: gold;
	color: salmon;
	width: 600px;
	height: 50px;
}

table {
	text-align: center;
}

td, th {
	border: 1px solid salmon;
}

th {
	background: salmon;
	color: white;
}

button {
	background: salmon;
}
</style>

</head>
<body>
<% if(session.getAttribute("mem") == null){ %>
	<form action="member_control.jsp" method="post" name="form1"> <!-- 2)member_control.jsp페이지로 넘어간다 -->
	<input type="hidden" name= "action" value="login">	<!-- 3)이때 action=login값을 가지고 간다. -->
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name = "mid"></td>
		</tr>
		<tr>
			<td>Password</td> 
			<td><input type="text" name = "mpw"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" value="login"></td> <!-- 1)login버튼을 누르면  -->
		</tr>	
	</table>
</form>
	<hr>
	<a href = "member_mem.jsp"><button>SignIn</button></a>
<% }else{
%>	
	<form action="member_control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="logout">
		<input type="submit" value="logout">
	</form>
<%} %>


	<hr>
	
	
	<h2>게시글 List</h2>
	<hr>
	<table>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>s
		</tr>
		<%
			for (MessageVO vo : (ArrayList<MessageVO>)datas) {
		%>
		<tr>
			<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getTitle()%></td>
			<td><%=vo.getContent()%></td>
			<td><%=vo.getWdate()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<hr>
	<a href="form.jsp"><button>글쓰기</button></a>
</body>
</html>