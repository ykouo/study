<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매페이지 </title>
</head>
<body>
<h2>장바구니</h2>
<hr>
<%
	int total =0;
	int price =0;
	ArrayList<String> list = (ArrayList)session.getAttribute("list");
	ArrayList<Integer> orderCntlist = (ArrayList<Integer>)session.getAttribute("orderCntlist");
	if(list==null){
		out.println("<script>alert('장바구니가 텅! 비어있어요:O');history.go(-1);</script>");
	}else{
		for(int i=0;i<list.size();i++){
			out.println("상품 : " + list.get(i)+" 수량: " + orderCntlist.get(i)+"개 <br>");
		if(list.get(i).equals("비즈목걸이")){
			price = 10000 * orderCntlist.get(i);
		}else if(list.get(i).equals("비즈팔찌")){
			price = 5000*orderCntlist.get(i);
		}else if(list.get(i).equals("비즈반지")){
			price = 2000 * orderCntlist.get(i);
		}
		total+=price;
	}
		
	}	


%>

<hr>
<h4>총합계: <%=total %></h4>

<hr>
<a href= "index.jsp"><button>로그인페이지</button></a>


</body>
</html>