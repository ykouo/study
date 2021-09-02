<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL2</title>
</head>
<body>

<h2>선택한 데이터는 ${param.data}입니다.</h2> <br>
<!-- 여기서 data 는 EL1페이지의 	<select name="data"> 이다 -->

<!-- 여기서 dataBean을 위에 임포트 하지 않고 사용가능한이유는 
EL1페이지 form태그안에 jspUseBean으로 Session단위의 스코프로 설정되었기 떄문에 -->
${dataBean.data1} <br>
${dataBean.data2} <br>
${dataBean.data1 + dataBean.data2} <br>
${dataBean.data1 gt dataBean.data2} <br>




</body>
</html>