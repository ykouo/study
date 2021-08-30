<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인 완료페이지 </title>
</head>
<body>
<h2><%=session.getAttribute("id") %>님 환영합니다 :D</h2>
<hr>
<h4>****** 상품목록 *****</h4>
<form action="add.jsp" name="form1" method="post">
	<h4>비즈목걸이 : 10,000원  / 비즈팔찌 : 5,000원  / 비즈반지: 2,000원</h4>
	<select name="product">
		<option selected>비즈목걸이</option> 
		<option>비즈팔찌</option>
		<option>비즈반지</option>
	</select>

	<p>수량선택</p>
	<input type="number" name="orderCnt" value="1" min="1" max="10">
	
<input type="submit" value="상품추가하기">
</form>

 <a href = "buy.jsp"><button>결제하기</button></a> 


<!-- <form action="buy.jsp" name="form2" method="post">
	<input type="submit" value="결제">
</form>
 -->

</body>
</html>