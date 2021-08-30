<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, join.* "%>
<%--    <jsp:userBean id="mem" class = "join.MemberVO"/>
   <jsp:setProperty property="*" name="mem"/>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 보기</title>
</head>
<body>
<h1> 등록된 회원 목록 </h1>
<hr>
<%

ArrayList<MemberVO> memList =(ArrayList<MemberVO>)application.getAttribute("memList");
if(memList==null){
	out.println("가입한 멤버가 없습니다.<br><hr>");
}else{
	for(MemberVO vo : memList){
		out.println("[ 이름 ] " + vo.getUserName()+" ");
		out.println("[ 아이디 ] " + vo.getUserId()+" ");
		out.println("[ 패스워드 ] " + vo.getUserPw()+" <br><hr>");
	}
}

%>
	<a href= "01_join.jsp" ><button>회원가입페이지로</button></a>
	
</body>
</html>