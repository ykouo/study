<%@page import="com.sun.corba.se.impl.orbutil.GetPropertyAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 완료(main) 페이지 </title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8"); //내장객체이므로 request바로 사용가능
	session.setAttribute("id", request.getParameter("id"));
	// 회원이 로그인 했기때문에 세션이 유지되어야한다. 
	// 1, 같은 의미, 같은 값을 가지고 있다면 유지보수성을 위해 변수명은 동일하게 설정한다. 
	// 2, 변수명 정의, 주석 등의 팀회의, 커뮤니케이션이 중요!
	// 3, 마이페이지 이동, 아이디 인증정보를 유지하기 위한 수단으로 forward는 사용하지 않는다. ==> session사용
	// 로그인한 정보를 유지 하기 위해 session.setAttribute한것
	System.out.println("도착한데이터["+request.getParameter("id")+"]");
%>

<h2>=====상품목록======</h2>
<%=session.getAttribute("id") %>님 반갑습니다:D<br>
<%-- == <%out.println(session.getAttribute("id")) %> --%>
<form action="addProduct.jsp" name="form1" method="post">
	<select name="product">
		<option selected>셔츠</option>
		<option>블라우스</option>
		<option>반팔티</option>
		<option>청바지</option>
		<option>운동화</option>
	</select>
<input type="submit" value="장바구니에상품추가하기">
</form>

<hr>
<a href="buy.jsp">구매하기</a>

<%=session.getMaxInactiveInterval()%>초 동안 세션정보가 유지됩니다.<br>

<%
	int cnt =(Integer)application.getAttribute("cnt");// 애플리케이션 객체에 저장된 값;을 받아와서
	cnt++;
	application.setAttribute("cnt", cnt);
%>
<h3>투데이 방문자 수: <%=cnt %></h3>



</body>
</html>