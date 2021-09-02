<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.message.*,java.util.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" /> <!-- 컨트롤러가 건내주는 정보를 받아오는 역할 -->
<!-- id = 받아온 데이터 /  class = id의 타입  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 화면</title>
<script type="text/javascript">
	function check(mnum){
		writer =prompt("글 정보변경을 위해 작성자명을 입력하세요.");
		
		document.location.href="control.jsp?action=edit&mnum="+mnum+"&writer="+writer; //url이동에 관한 걸 담당하는 역할
		// 화면전환을 위해 documentS.location.herf= 를 사용. 
	}


</script>
</head>
<body>

<h2>게시글 목록</h2>
<hr>
<a href="form.jsp"><button>글쓰기</button></a>  <!--  form.jsp를 위해 사전 셋팅할 데이터가 없어서 바로 부름 -->
<hr>
<table border="1">
	<tr>
		<th>글 번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	</tr>
	<%
		for(MessageVO vo:(ArrayList<MessageVO>)datas){
	%>
		<tr>
			<%-- <td><a href="control.jsp?action=edit&mnum=<%=vo.getMnum()%>"><%=vo.getMnum()%></a></td><!-- 글 변경을 위한 비밀번호 등의 인증작업처리 필요! --> --%>
			<td><a href = "javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td> <!--  글변경을 위한 비밀번호인증  -->
			<td><%=vo.getTitle()%></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getWdate()%></td>
		</tr>
	<%
		}
	%>
</table>

</body>
</html>