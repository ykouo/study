<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1~10출력</title>
<style type="text/css">
#odd{
	color: red;
}
#even{
	color: blue;
}

</style>
</head>
<body>

<h1>1~10출력</h1>
<%
for(int i=1;i<=10;i++){
	if(i%2 == 0){ 
		out.println("<h2 id="+"even"+">"); // 글씨 색상을 주기 위해 Id값을 넣었따. 
		out.println(i);
		out.println("<br>");
		out.println("</h2>");	
	}else{
		out.println("<h2 id="+"odd"+">");
		out.println(i);
		out.println("<br>");
		out.println("</h2>");
	}
}
%>




<%-- 
<h2 name ="odd" id="odd"><% 
for(int i=1;i<=10;i++){
	if(i%2==0){
		out.println(i);
	}}%></h2> 
<h2 name = "even" id="even"><% 
for(int i=1;i<=10;i++){
	if(i%2!=0){
		out.println(i);
	}}%></h2> 


 --%>
</body>
</html>