<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>전체목록</h2>

<c:if test="${selUser!=null}">
	<a class="plusbtn" href="control.jsp?action=main&mcnt=${mcnt+2}&selUser=${selUser}">${selUser}님글더보기+</a>
</c:if>
<c:if test="${selUser==null}">
	<a class="plusbtn" href="control.jsp?action=main&mcnt=${mcnt+2}">전체글 더보기+</a>
</c:if>

 <ul class="list">
<c:forEach var="v" items="${datas}">
	<c:set var="m" value="${v.m}"/>
  <li>
    [${m.userid} ▹ ${m.msg}] <span><a href="control.jsp?action=updateMsg&mid=${m.mid}&mcnt=${mcnt}">♥</a></span>[ 좋아요 : ${m.favcount} | 댓글:${m.replycount} | ${m.mdate}]   
	
	<mytag:deleteMsg mid="${m.mid}" userid="${m.userid}"/> <!-- custom tag 교체  -->
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="newreply">
		<input type="hidden" name="mcnt" value="${mcnt}">
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


확인!!!
</body>
</html>