<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*,java.util.*"%>
<jsp:useBean id="dao" class="member.memberDAO" scope="application"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<!--  
DB 분할시 중요한 부분 : 순서 정하기
★★★ 일 처리의 순서 
1번 방법) View ==> M , C
2번 방법) M,C ==> View 
 -->

<h3>DB에 저장된 데이터 목록</h3>
<hr>
<%
	ArrayList<memberVO> datas=dao.select();
	for(memberVO v:datas){
		out.println(v+"<br>");
	}
%>
<hr>
<a href="04_reg.html">☞회원가입하러가기</a> <br>
<a href="04_login.html">☞로그인하러가기</a> <br>

</body>
</html>