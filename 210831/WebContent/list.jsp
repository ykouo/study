<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,model.message.*"%>
<jsp:useBean id="datas" class = "java.util.ArrayList" scope="request"/>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록/등록 페이지</title>
<script type="text/javascript">
	function check(mnum){
		writer = prompt("글 정보변경을 위해 작성자명을 입력해주세요:D");
		document.location.href="control.jsp?action=edit&mnum="+mnum+"&writer="+writer;
	}
</script>
<style type="text/css">
a{
	text-decoration: none;
	color: salmon;
	font-weight: bold;
}
h2{
	background: gold;
	color: salmon;
	width: 600px;
	height: 50px;
}
table{
	text-align: center;
}
td, th{
	border: 1px solid salmon;
}
th{
	background: salmon;
	color: white;
}
button{
	background: salmon;
}
</style>
</head>
<body>

<a href="form.jsp"><button>글쓰기</button></a>
<hr>
<h2>게시글 List</h2>
<hr>
<table>
	<tr>
		<th>번호</th><th>작성자</th><th>제목</th><th>내용</th><th>작성일</th>
	</tr>
	<%
		for(MessageVO vo : (ArrayList<MessageVO>)datas){
	%>
		<tr>
		<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
		<td><%=vo.getWriter() %></td>
		<td><%=vo.getTitle() %></td>
		<td><%=vo.getContent() %></td>
		<td><%=vo.getWdate() %></td>
		</tr>
	<%		
		}
	%>


</table>


</body>
</html>