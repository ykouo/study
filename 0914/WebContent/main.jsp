<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<style type="text/css">
*{
  padding:0; 
  margin:0;
}

ul{
  width:500px; 
  border:3px solid #ccc; 
  border-radius:8px; 
  margin:10px 0 0 10px; 
  list-style:none;
}

ul li{
  padding:10px 0 0 10px; 
  border-top:1px dotted #ccc; 
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
  color:#000;
}
ul li p{color:#f00;}

</style>
</head>
<body>

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
<button onclick="location.href='insertUser.jsp'">회원가입</button>
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

	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="main">		
		<input type="submit" value="전체목록보기">	
	</form>	

<hr color="tomato">
<h2>전체목록</h2>
<hr color="tomato">
<hr color="gold">
<c:if test="${selUser!=null}">
	<a href="control.jsp?action=main&mcnt=${mcnt+2}&selUser=${selUser}">more++</a>
</c:if>
<c:if test="${selUser==null}">
	<a href="control.jsp?action=main&mcnt=${mcnt+3}">more+</a>
</c:if>
<hr color="gold">

  <ul>
<c:forEach var="v" items="${datas}">
	<c:set var="m" value="${v.m}"/>
  <li>
    <a href="#">[${m.userid} : ${m.msg}] [ ♥:${m.favcount} | 댓글:${m.replycount} | ${m.mdate}] </a>   
	<c:if test="${seUser != null }"> <!-- selUser -->
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newreply">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="hidden" name="userid" value="${seUser}">
		<input type="hidden" name="mid" value="${m.mid}">
		<input type="text" name="rmsg">
		<input type="submit"value="댓글추가">
	</form>
</c:if>
<c:if test="${seUser == null }"> <!-- selUser -->
		<input type="text"size="30" disabled value="로그인 후 이용 가능합니다:D!">
</c:if>
    <c:forEach var="r" items="${v.rlist}"> 
		<p>${r.userid}▶${r.rmsg} ${r.rdate}</p> 	
	</c:forEach>
  </li>
</c:forEach>
</ul>	

<hr color="orange">


<!-- -------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
$(document).ready(function(){
	  $("p").hide();
	  // $("ul > li:first-child a").next().show();
	  $("ul li a").click(function(){
	    $(this).next().slideToggle(300);
	    // $(this).next().slideDown(300);
	    $("ul li a").not(this).next().slideUp(300);
	    return false;
	  });
	  $("ul li a").eq(0).trigger("click");
	});
</script>
<!-- -------------------------------------------------------------------------------------------- -->

<c:if test="${seUser != null }"> 
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newmsg">
		<input type="hidden" name="userid" value="${seUser}">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="text" name="msg">
		<input type="submit"value="댓글추가">
	</form>
</c:if>
<c:if test="${seUser == null }"> <!-- selUser -->
		<input type="text"size="30" disabled value="로그인 후 이용 가능합니다:D!">
</c:if>
<hr color="orange">
</body>
</html>
