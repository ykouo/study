<%@page import="join.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보 등록 페이지 </title>
</head>
<body>

<%	
	request.setCharacterEncoding("UTF-8");
	
	// 사용자가 입력받은 이름, 아이디, 비밀번호 정보를 getParameter해서 받아와 변수에 저장한다.
	String userName = request.getParameter("userName");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	// MemberVO객체인 memvo를 생성 하여 MemberVO생성자에 위에서 받아온 정보를 세팅한다.
	MemberVO memvo = new MemberVO(userName,userId,userPw);;
	
	// 이 정보를 담을 ArrayList 를 생성하여 이 리스트는 session 스코프를 가질수 있도록 설정한다. 
	ArrayList<MemberVO> memList =(ArrayList<MemberVO>)application.getAttribute("memList"); //"memList"
	// 만역 memList가 없을경우 
	if(memList == null){
		// 초기 멤버리스트를 생성
		memList= new ArrayList<MemberVO>();
		application.setAttribute("memList", memList);
	}
	// 존재했었다면 추가한다 memvo를
	memList.add(memvo);
%>
<script>
	alert("<%=userName%>님의 <%=userId%>가 생성되었습니다.");
	history.go(-1);	
</script>

</body>
</html>