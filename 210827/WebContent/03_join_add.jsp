<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //한국어 셋팅
%>
<jsp:useBean id="memVO" class="join3.memVO"/> 
<%--
	memVO memvo = application.get("memvo");
	if(memvo == null){
		memvo = new memVO();
		application.set("memvo");
	}
--%>
<jsp:setProperty property="*" name="memVO"/>
<%-- 자바 클래스의 setter 메서드를 사용하기 위해/ 즉 데이터의 값을 설정할떄 사용 
	<jsp:useBean id="memVO" class="join3.memVO"/> 
	<jsp:setProperty property="*" name="memVO"/>이면 
	name="memVO" 값  == 앞서 선언된 <jsp:useBean>의 id 값이다. 
	이때 id는 join3.memVO 클래스를 받는데 setProperty에서 랩핑되는 setter는 
	memVO의 setter메서드 이다.  
 --%>
 
<jsp:useBean id="memDAO" class="join3.memDAO" scope = "application"/>
<%
	memDAO.addMem(memVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버추가 페이지</title>
</head>
<body>
<h2> 등록하실 아이디 / 비밀번호 </h2>
<hr>
<h4>
[ 이름 ] : <%=memVO.getUserName() %>
[ ID ] : <%=memVO.getUserId() %>
[ Password ] : <%=memVO.getUserPw() %><br>
</h4>
<hr>
<a href = "03_join.jsp"><button>회원가입페이지로</button></a>
<a href = "03_show_member.jsp"><button>회원목록페이지로</button></a>


</body>
</html>