<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL실습1</title>
</head>
<body>
<h2>선택한 물건은 ${param.pname}이며 주문하신 수량은 ${param.cnt}입니다.</h2> <br>
<h3>결제하실 금액은 ${prbean.totalPrice(param.pname,param.cnt)}입니다.</hS2> 
</body>
</html>