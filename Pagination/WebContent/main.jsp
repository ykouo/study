<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>

<script type="text/javascript">
function test(){
	console.log("확인");
	
}

function PageMove(page){
	location.href="main.do?page="+page;
}

/* function newWin(){
	var url = 'insertUser.jsp'; 
	var option = "top=10, left=10, width=500, height=200";
	window.open(url,'_blank',option);
} */
</script>
<!-- 외부 스타일시트 적용-->
<!-- <link rel="stylesheet" href="css/style.css"> -->
<!-- 새창띄우기 스크립트 -->


</head>
<body>
<div class = "content">
<!-- 전체목록보기 -->
	<a href="main.do"><img alt="Logo" width="50" height="50" src="img/sunflower3.png"></a>


<!-- 로그인  -->
<mytag:login/>

<br>


<h2>전체목록</h2>



<table>

<tr>
	<th>작성자</th>
	<th>내용</th>
	<th>좋아요</th>
	<th>댓글</th>
	<th>작성일자</th>
</tr>

<c:forEach var="m" items="${list}">
<tr>
	<td>${m.userid}</td>
	<td>${m.msg}</td>
	<td>${m.favcount}</td>
	<td>${m.replycount}</td>
	<td>${m.mdate}</td>
</tr>
</c:forEach>
</table>

<%--   <li>
    [${m.userid} ▹ ${m.msg}] | [ 좋아요 : ${m.favcount} | 댓글:${m.replycount} | ${m.mdate}] <a href="updatemsg.do?&mcnt=${mcnt}&selUser=${selUser}&mid=${m.mid}&cnt=${cnt}">♥</a> <!--&mcnt=${mcnt} &cnt=${cnt} -->   
	 --%>
	<!--  메시지 삭제 태그  -->
	<mytag:deleteMsg mid="${m.mid}" userid="${m.userid}"/> <!-- custom tag 교체  -->
	<!--  댓글 등록 태그  -->
	<mytag:insert mid="${m.mid}"  type="rmsg"/> <!-- custom tag 교체  -->

		
  	<c:forEach var="r" items="${v.rlist}"> 
		<p>[${r.userid} ▸ ${r.rmsg}] [${r.rdate}]</p> 	
	<!--  댓글 삭제 태그  -->	
		<mytag:deleteReply mid="${r.mid}" rid="${r.rid}" userid="${r.userid}" /> <!-- custom tag 교체  -->
	</c:forEach>
	


<br>
<c:if test="${seUser != null }"> 
	<!--  메시지 등록 태그  -->
	<mytag:insert type="msg"/> <!-- custom tag 교체  -->
</c:if>

<!-- 페이징네이션 -->
  <a href="javascript:test()">TEST</a>
  
  
   <div class="toolbar-bottom">
         <div class="toolbar mt-lg">
            <div class="sorter">
               <a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a> 
               <a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a>

               <c:forEach var="i" begin="${paging.startPageNo}"
                  end="${paging.endPageNo}" step="1">
                  <c:choose>
                     <c:when test="${i eq paging.pageNo}">
                        <a href="javascript:PageMove(${i})">${i}</a>
                     </c:when>
                     <c:otherwise>
                        <a href="javascript:PageMove(${i})">${i}</a>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>

               <a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a> <a
                  href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a>

            </div>
         </div>
      </div>

<h3>신규회원목록</h3>
<hr color="tomato">
<ol>
	<c:forEach var="u" items="${newUsers}"> 
		<li><a href="main.do?&selUser=${u.userid}">${u.userid}</a>님 가입완료</li> <!-- &mcnt=${mcnt} -->
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

페이지 출력 : ${paging.pageNo}

</body>
</html>

