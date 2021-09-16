<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<!-- 외부 스타일시트 적용-->
<link rel="stylesheet" href="css/style.css">
<!-- 새창띄우기 -->
<script type="text/javascript">
function newWin(){
	var url = 'insertUser.jsp';
	var option = "top=10, left=10, width=500, height=200";
	window.open(url,'_blank',option);
}
</script>

</head>
<body>
<div class = "content">
<form action="control.jsp" method="post">
	<input type="hidden" name="action" value="main">		
	<input class="btn" type="submit" value="전체목록보기">	
</form>	

<mytag:login/>

<br>


<h3>총 게시물수 : ${userCnt} 현재게시물수:${cnt}</h3>
<h2>전체목록</h2>

<c:if test="${selUser!=null}">
	<c:if test="${cnt<userCnt}">
	<a class="plusbtn" href="control.jsp?action=main&mcnt=${mcnt+2}&selUser=${selUser}&cnt=${cnt+2}">${selUser}님글더보기+</a>
	</c:if>
</c:if>
<c:if test="${selUser==null}">
	<c:if test="${cnt<userCnt}">
	<a class="plusbtn" href="control.jsp?action=main&mcnt=${mcnt+2}&cnt=${cnt+2}">전체글 더보기+</a>
	</c:if>
</c:if>

 <ul class="list">
<c:forEach var="v" items="${datas}">
	<c:set var="m" value="${v.m}"/>
  <li>
    [${m.userid} ▹ ${m.msg}] <span><a href="control.jsp?action=updateMsg&selUser=${selUser}&mid=${m.mid}&mcnt=${mcnt}&cnt=${cnt+2}">♥</a></span>[ 좋아요 : ${m.favcount} | 댓글:${m.replycount} | ${m.mdate}]   
	
	<mytag:deleteMsg mid="${m.mid}" userid="${m.userid}"/> <!-- custom tag 교체  -->
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newreply">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="hidden" name="cnt" value="${cnt}">
		<input type="hidden" name="userid" value="${seUser}">
		<input type="hidden" name="mid" value="${m.mid}">
		<mytag:insert type="rmsg"/> <!-- custom tag 교체  -->
	</form>
		
  	<c:forEach var="r" items="${v.rlist}"> 
		<p>[${r.userid} ▸ ${r.rmsg}] [${r.rdate}]</p> 	
		<mytag:deleteReply mid="${r.mid}" rid="${r.rid}" userid="${r.userid}" /> <!-- custom tag 교체  -->
	</c:forEach>
  </li>
  
</c:forEach>
</ul>	


<br>
<c:if test="${seUser != null }"> 
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newmsg">
		<input type="hidden" name="userid" value="${seUser}">
		<input type="hidden" name="mcnt" value="${mcnt}">
		<input type="hidden" name="mid" value="${mid}">
		<input type="hidden" name="cnt" value="${cnt}">
		<mytag:insert type="msg"/> <!-- custom tag 교체  -->
	</form>
</c:if>

<h3>신규회원목록</h3>
<hr color="tomato">
<ol>
	<c:forEach var="u" items="${newUsers}">
		<li><a href="control.jsp?action=main&mcnt=${mcnt}&selUser=${u.userid}">${u.userid}</a>님 가입완료</li>
	</c:forEach>
</ol>
</div>
<!-- 광고 -->
<div class="ad">
	<ul>
		<li><a target="_blank" href="http://vinvle.com/"><img src="img/ad1.PNG" alt="vinvle" style="width:200px;height:200px;"></a></li>
		<li><a target="_blank" href="https://www.loveandpop.kr/"><img src="img/ad2.PNG" alt="Loveandpop" style="width:200px;height:200px;"></a></li>
		<li><a target="_blank" href="https://ba-on.com/"><img src="img/ad3.PNG" alt="Baon" style="width:200px;height:200px;"></a></li>
	</ul>

</div>


</body>
</html>
