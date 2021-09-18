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
<!-- 새창띄우기 스크립트 -->
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
<!-- 전체목록보기 -->
<form action="main.do" method="post">		
	<input class="btn" type="submit" value="전체목록보기">	
</form>	

<!-- 로그인  -->
<mytag:login/>

<br>

<!-- 총게시물수 & 현재 게시물수 확인하는 부분 -->
<%-- <h3>총 게시물수 : ${userCnt} 현재게시물수:${cnt}</h3>  --%> 
<!-- userCnt = getCnt 한 값 즉 , Message 테이블의 총 개수  -->
<!-- cnt = 더보기를 눌러서 증가한 값  -->
<!-- 전체목록 시작 -->
<h2>전체목록</h2>

<!-- 더보기 버튼  -->
<c:if test="${selUser!=null}">
 <%-- 	<c:if test="${cnt<userCnt}">  &cnt=${cnt+2} --%>
	<a class="plusbtn" href="main.do?&mcnt=${mcnt+2}&selUser=${selUser}">더보기+</a>

</c:if>
<c:if test="${selUser==null}">
 <%-- 	<c:if test="${cnt<userCnt}">  --%>
	<a class="plusbtn" href="main.do?&mcnt=${mcnt+2}">더보기+</a>

</c:if>
<!-- 게시글 리스트 시작  -->
 <ul class="list">
<c:forEach var="v" items="${datas}">
	<c:set var="m" value="${v.m}"/>
  <li>
    [${m.userid} ▹ ${m.msg}] | [ 좋아요 : ${m.favcount} | 댓글:${m.replycount} | ${m.mdate}] <a href="updatemsg.do?&selUser=${selUser}&mid=${m.mid}&mcnt=${mcnt}">♥</a> <!-- &cnt=${cnt} -->   
	
	<!--  메시지 삭제 태그  -->
	<mytag:deleteMsg mid="${m.mid}" userid="${m.userid}"/> <!-- custom tag 교체  -->
	<!--  댓글 등록 태그  -->
	<mytag:insert mid="${m.mid}"  type="rmsg"/> <!-- custom tag 교체  -->

		
  	<c:forEach var="r" items="${v.rlist}"> 
		<p>[${r.userid} ▸ ${r.rmsg}] [${r.rdate}]</p> 	
	<!--  댓글 삭제 태그  -->	
		<mytag:deleteReply mid="${r.mid}" rid="${r.rid}" userid="${r.userid}" /> <!-- custom tag 교체  -->
	</c:forEach>
  </li>
  
</c:forEach>
</ul>	


<br>
<c:if test="${seUser != null }"> 
	<!--  메시지 등록 태그  -->
	<mytag:insert type="msg"/> <!-- custom tag 교체  -->
</c:if>

<h3>신규회원목록</h3>
<hr color="tomato">
<ol>
	<c:forEach var="u" items="${newUsers}">
		<li><a href="main.do?&mcnt=${mcnt}&selUser=${u.userid}">${u.userid}</a>님 가입완료</li>
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
