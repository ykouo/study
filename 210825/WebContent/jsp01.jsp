<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%> 
    <%@ page %>    <!--  페이지 지시어  -->   
	
<!DOCTYPE html>



<html>
<head>
<meta charset="UTF-8">
<title>Day02_01 </title>
</head>
<body>
<h2><%= new Date() %></h2> 
<!-- JSP표현식 => 서블릿파일로 변환되었을때, 
jsp01.java안에서 표현식 부분은 out.println(new Date());처럼 표현된다. -->

<h2>계산기</h2>
<hr>
<form method = "post" name = "form1" id = "form1" action="">								  <!-- 유지보수를 위해 Id속성도 함께 넣어준다.(프론트 배려) -->
	<input type = "text" name = "num1" id="num1"> <!-- name속성 == id속성과 비슷한 느낌 -->
		<select name ="op">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type = "text" name = "num2" id = "num2">
		<input type = "submit" value = "계산하기" name = "btn1">
		<input type = "reset" value = "다시입력" name = "btn2">
</form>
<hr>

<h3>계산결과 : <%-- <%= result %> --%></h3> <!-- out.println(result) -->















</body>
</html>