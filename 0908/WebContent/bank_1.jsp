<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 컨트롤러 역할을 하기위해  -->
<jsp:useBean id="b1" class = "bank.Bank1"/>
<jsp:useBean id="b1" class = "bank.Bank2"/>
<% 
// setter를 사용하고 있지 않기 떄문에 b1.trans(Integer.parseInt(request.getParameter("bal"))) 이 형태 사용
	if(request.getMethod().equals("POST")){
		if(b1.trans(Integer.parseInt(request.getParameter("bal")))){ //수행 결과가 실행 불가능 상태라면       // dao,vo가 분리되면 --> dao.trans(vo)
		
			out.println("<script>alert('가능!');</script>");
		}else{
			out.println("<script>alert('불가능!');</script>");
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>