<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,model.message.*"%>
<jsp:useBean id="datas" class = "java.util.ArrayList" scope="request"/> 
<%-- <jsp:useBean id="mem" class = "model.member.MemberVO" scope ="session"/> --%>  
<% request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록/등록 페이지</title>
<script type="text/javascript">
	function check(mnum){
			pw=prompt("글 정보 변경을 위해 비밀번호를 입력하시오.");
			document.location.href="msg_control.jsp?action=edit&mnum="+mnum+"&pw="+pw;
<%-- 		mem= <%=session.getAttribute("mem")%> ;
		//event1= prompt('');
		System.out.println("check 함수 실행은됨");
		if(mem == null){
			System.out.println("여기는check 함수안");
			prompt('로그인후 이용 가능합니다.');
			
		}else{
			System.out.println("여기는check else안");
			document.location.href="msg_control.jsp?action=edit&mnum="+mnum;
		} --%>
	}
	
// 만약 로그인을 했다면 
// 내가 작성한 글만 보여준다. 
	
	
</script>

</head>
<body>


<form action="msg_control.jsp" method="post" name="form1">
	<input type="hidden" name="action" value="list"> 
	<input type="submit" value="글목록">
</form>
<form action="mem_control.jsp" method="post" name="form1">
	<input type="hidden" name="action" value="main"> 
	<input type="submit" value="main">
</form>

<hr>
<hr>
<!-- 검색기능 버튼 -->
 <form action="msg_control.jsp" method="post">
<input type="hidden" name="action" value="search">
<select name="condition">
	<option selected value="title">제목</option>
	<option value="writer">작성자</option>
</select> 
<input type="text" name="content">
<input type="submit" value="검색">
</form>
<hr> 

<a href="msg_form.jsp"><button>글쓰기</button></a>
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
		<td><%=vo.getTitle()%></td>
		<td><%=vo.getContent() %></td>
		<td><%=vo.getWdate() %></td>
		</tr>
	<%		
		}
	%>


</table>


</body>
</html>