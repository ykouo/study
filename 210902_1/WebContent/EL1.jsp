<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL1</title>
</head>
<body>
	
	<form action="EL2.jsp" method="post">
		<jsp:useBean id="dataBean" class="model.DataBean" scope="session"/>
		<!-- for문에서 사용할 dataBean을 위해 form태그 안에서 jspuseBean을 선언 -->
		<select name="data">
			<%
				for(String v : dataBean.getDataList()){
			%>
				<option><%=v%></option>
			<%
				} 
			%>
			
			<!--  스크립트 릿을 쪼개기 어렵다면 -->
			<%-- <%
			for(String v: dataBean.getDataList()){
				out.println("<option>"+v+"</option>");
			} 
			%> --%>
			<input type="submit" value="전송">
		</select>
	
	</form>
</body>
</html>