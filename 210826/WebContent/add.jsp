<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 상품을 구매예정 목록에 추가 하는 페이지 </title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String product = request.getParameter("product");	
		int orderCnt = Integer.parseInt(request.getParameter("orderCnt"));

		ArrayList<String> list =(ArrayList<String>)session.getAttribute("list"); 
		ArrayList<Integer> orderCntlist = (ArrayList<Integer>)session.getAttribute("orderCntlist"); 
		if(list==null){ 
			list=new ArrayList<String>();
			session.setAttribute("list", list);
		}
		if(orderCntlist==null){ 
			orderCntlist=new ArrayList<Integer>();
			session.setAttribute("orderCntlist", orderCntlist);
		}
		list.add(product);
		orderCntlist.add(orderCnt);
	%>
	
	
<script type="text/javascript">
	alert("<%=product%>(이)가 <%=orderCnt%>개 추가되었습니다.");
	history.go(-1); //뒤로가기
</script>




</body>
</html>