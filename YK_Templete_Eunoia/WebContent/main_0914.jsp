<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.post.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그라이브러리 달아야함 -->    


<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>main - 로그인 / 리스트 </title>

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
					
					<c:choose>
					<h3>로그인</h3>
						<c:when test="${selUser eq null}">
							<form action="control_0914.jsp" method="post">
								<input type="hidden" name="action" value="login">
								<table>
									<tr>
										<td>아이디</td>
										<td><input type="text" name="userid" placeholder="아이디입력"></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type="password" name="userpw"
											placeholder="비밀번호입력"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="login"></td>
									</tr>
								</table>
							</form>
							<button onclick="location.href='insertUser_0914.jsp'">회원가입</button>
						</c:when>
						<c:otherwise>
							<hr color="pink">
							<h3>${selUser}님환영합니다(*￣3￣)╭</h3>
							<a href="control_0914.jsp?action=main&selUser=${selUser}">내글목록보기</a>
							<form action="control_0914.jsp" method="post">
								<input type="hidden" name="action" value="logout"> 
								<input type="submit" value="logout">
							</form>
						</c:otherwise>
					</c:choose>
					<h4>게시물 리스트</h4>
					<a href="control_0914.jsp?action=main">전체목록보기</a>
					<hr>
					<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th>작성자</th>
											<th>내용</th>
											<th>♥</th>
											<th>조회수</th>
											<th>작성일</th>
										</tr>
									</thead>
								<tbody>

								<c:forEach var="v" items="${datas}">
									<c:set var="m" value="${v.m}" />
									<tr>
										<td>${m.userid}</td>
										<td><${m.msg}</td>
										<td>${m.favcount}</td>
										<td>${m.replycount}</td>
										<td>${m.mdate}</td>
									</tr>
								<ol>
								<c:forEach var="r" items="${v.rlist}"> 
								<li>${r.userid}▶ ${r.rmsg} ${r.rdate}</li> 
								</c:forEach>
								</ol>
								</c:forEach>
							</tbody>
							<tfoot>
							<a href="control_0914.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">more++</a>
								<tr>
									<td colspan="5"><c:if test="${selUser!=null}">
											<form action="control_0914.jsp" method="post">
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