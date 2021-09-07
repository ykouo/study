<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.post.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->    

<jsp:useBean id="post" class="model.post.PostVO" scope="request" />
<jsp:useBean id="postList" class="java.util.ArrayList" scope="request" />  


<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>main - 로그인 / 리스트 </title>
<script type="text/javascript">
function check(pnum){	
	console.log("여기 들어왔니???"); 
	document.location.href="control.jsp?action=showpost&pnum="+pnum;
}
</script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>Eunoia</strong></a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1>MAIN</h1>
					</header>
					
					<h4>로그인</h4>
					<c:if test="${user==null}">
						<hr>
						<button onclick="location.href='login.jsp'">로그인</button>
						<br>
						<button onclick="location.href='join.jsp'">회원가입</button>
						<hr>
					</c:if>
					<c:if test="${user!=null}">

						<mytag:logout />

					</c:if>
					<h4>게시물 리스트</h4>
					<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>내용</th>
											<th>작성일</th>
										</tr>
									</thead>
								<tbody>
									<c:if test="${postList.size()==0}">
										<tr>
											<td cospan="5">게시글 목록이 텅!비어있습니다:0</td>
										</tr>
									</c:if>
									<c:if test="${postList.size()!=0}">
											<c:forEach var="vo" items="${postList}">
										<tr>
											<td>${vo.getPnum()}</td>
											<td><a href="javascript:check(${vo.getPnum()})">${vo.getPtitle()}</a></td>
											<td>${vo.getPwriter()}</td>
											<td>${vo.getPcontent()}</td>
											<td>${vo.getPdate()}</td>
										</tr>
										</c:forEach>
									</c:if>
								</tbody>
							<tfoot>
								<tr>
									<td colspan="5"><c:if test="${user!=null}">
											<form action="control.jsp" method="post">
												<input type="hidden" name="action" value="posting">
												<input type="submit" value="글쓰기">
											</form>
										</c:if></td>
								</tr>
							</tfoot>
						</table>
					</div>
					
				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

			
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="index.html">Homepage</a></li>
						<li><a href="generic.html">Generic</a></li>
						<li><a href="elements.html">Elements</a></li>
						<li><span class="opener">실습</span>
							<ul>
								<li><a href="index.jsp">0907</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Etiam Dolore</a></li>
						<li><a href="#">Adipiscing</a></li>
						<li><span class="opener">Another Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Maximus Erat</a></li>
						<li><a href="#">Sapien Mauris</a></li>
						<li><a href="#">Amet Lacinia</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Ante interdum</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore aliquam.</p>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore aliquam.</p>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore aliquam.</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">More</a></li>
					</ul>
				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Get in touch</h2>
					</header>
					<p>Sed varius enim lorem ullamcorper dolore aliquam aenean
						ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
						sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
						tempus aliquam.</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
						<li class="icon solid fa-phone">(000) 000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
							Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>