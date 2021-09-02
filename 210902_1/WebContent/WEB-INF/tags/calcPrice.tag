<%@ tag language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<h2>상품명 : ${param.pname} / 수량 : ${param.cnt} </h2> <br>
<h3>전체금액 : ${prBean.calc(param.pname,param.cnt)}원</h2> 
