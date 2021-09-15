<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<style type="text/css">
*{
  padding:10; 
  margin:10;
}

ul{
  width:800px; 
  border:3px solid #ccc; 
  border-radius:8px; 
  margin:10px 0 0 10px; 
  list-style:none;
}

ul li{
  padding:10px 0 0 10px; 
  border-top:1px dotted tomato; 
  margin-bottom:10px;
}

ul li:first-child{
  border:0 none;
}

ul li a{
  height:20px; 
  line-height:20px; 
  display:block; 
  text-decoration:none; 
  color:black;
}
ul li p{color:orange;}

</style>
<!-- 새창띄우기 -->
<script type="text/javascript">

function newWin(){
	var url = 'insertUser.jsp';
	var option = "top=10, left=10, width=800, height=200";
	window.open(url,'_blank',option);
}
function WinClose(){
  window.close();     
}

</script>

</head>
<body>

<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="main">		
	<input type="submit" value="전체목록보기">	
</form>	


 <c:choose>
<c:when test="${seUser eq null}">

<form action="control.jsp" method ="post" >
	<input type="hidden" name="action" value="login">
	<input type="hidden" name="mcnt" value="${mcnt}">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name ="userid" placeholder="아이디입력"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name ="userpw" placeholder="비밀번호입력"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="login"></td>
	</tr>
</table>
</form>
<button onclick="newWin()">회원가입</button>

</c:when>
<c:otherwise>
<hr color="pink">
<h3>${seUser}님 환영합니다(*￣3￣)╭</h3>

<form action="control.jsp" method="post" >	
	<input type="hidden" name="action" value="logout">
	<input type="submit" value="logout">
</form>
<a href="control.jsp?action=main&selUser=${seUser}">내글목록보기</a>
</c:otherwise>
</c:choose> 
<br>

<hr color="pink">


<!-- ----------------------------------------------------------------------------- -->


<hr color="tomato">
<h2>전체목록</h2>
<hr color="tomato">
<hr color="gold">
<c:if test="${selUser!=null}">
	<a href="control.jsp?action=main&mcnt=${mcnt+2}&selUser=${selUser}">내글 더보기+</a>
</c:if>
<c:if test="${selUser==null}">
	<a href="control.jsp?action=main&mcnt=${mcnt+3}">전체글 더보기+</a>
</c:if>
<hr color="gold">

  <ul>
<c:forEach var="v" items="${datas}">
	<c:set var="m" value="${v.m}"/>
  <li>
    <a href="#">[${m.userid} : ${m.msg}] [ ♥:${m.favcount} | 댓글:${m.replycount} | ${m.mdate}] </a>   
	<c:if test="${seUser != null and seUser == m.userid }"> <!-- selUser -->
	<form method="post" action="control.jsp">
			<input type="hidden" name="action" value="deleteMsg">
			<input type="hidden" name="mid" value="${m.mid}">
			<input type="hidden" name="mcnt" value="${mcnt}">
			<input type="hidden" name="userid" value="${seUser}">
			<input type="submit" value="Msg삭제">
	</form>
	</c:if>
	<c:if test="${seUser != null }">
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newreply">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="hidden" name="userid" value="${seUser}">
		<input type="hidden" name="mid" value="${m.mid}">
		<input type="text" name="rmsg">
		<input type="submit"value="Reply추가">
	</form>
		
		
	
</c:if>
<c:if test="${seUser == null }"> <!-- selUser -->
	<input type="text"size="30" disabled value="로그인 후 이용 가능합니다:D!">
</c:if>
  	<c:forEach var="r" items="${v.rlist}"> 
		<p>${r.userid}▶${r.rmsg} ${r.rdate}</p> 	
	<c:if test="${seUser!=null and seUser == r.userid}" >
		<form method="post" action="control.jsp">
			<input type="hidden" name="mcnt" value="${mcnt}">
			<input type="hidden" name="userid" value="${seUser}">
			<input type="hidden" name="rid" value="${r.rid}">
			<input type="hidden" name="action" value="deleteReply">
			<input type="submit" value="Reply삭제">
		</form>
	</c:if>
	</c:forEach>
  </li>
  
</c:forEach>
</ul>	

<hr color="orange">


<!-- -------------------------------------------------------------------------------------------- -->

<!-- -------------------------------------------------------------------------------------------- -->

<c:if test="${seUser != null }"> 
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newmsg">
		<input type="hidden" name="userid" value="${seUser}">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="text" name="msg">
		<input type="submit"value="Msg추가">
	</form>
</c:if>
<c:if test="${seUser == null }"> <!-- selUser -->
		<input type="text"size="30" disabled value="로그인 후 이용 가능합니다:D!">
</c:if>
<hr color="orange">
</body>
</html>
