<%@page import="java.util.ArrayList"%> <!-- 어레이리스트 임포트  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(장바구니)상품을 구매예정목록에 추가하는 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); // 
	String product = request.getParameter("product");
	//세션에게 배열을 설정 
	// -> "배열" : 크기를 알아야함! ==> 배열리스트(컬렉션)사용 
	//ArrayList<String> list = new ArrayList();
	// 이건 상품이 추가 될때마다 새로운 리스트를 생성하는 것 	
	ArrayList<String> list = (ArrayList)session.getAttribute("list");
	//최초로 상품이 추가 됬을떄 만 리스트가 생성되어야함
	if(list==null){
		list=new ArrayList<String>();
		session.setAttribute("list", list);
	}
	// if문을 거치지 않은경우 이미 만들어지 list가 있는 것이므로 상품 추가 
	list.add(product);
%>

<script type="text/javascript">
	alert("<%=product%>(이)가 추가되었습니다.");
	history.go(-1); //뒤로가기
</script>


<!-- 
<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.product.ProductVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품을 구매예정목록에 추가하는 페이지</title>
</head>
<body>

<%
   request.setCharacterEncoding("UTF-8");
   String product=request.getParameter("product");
   int cnt=Integer.parseInt(request.getParameter("cnt"));
   // C: 사용자가 입력한 값들을 Java로 가져오는 작업
   
   int price=20000; // M: DB에서 값을 가져오는 작업
   int total=price*cnt; // C: DB에서 가져온 값 x 사용자가 입력한 값
   
   // 세션에게 배열을 설정
   // -> 배열 => 배열리스트(컬렉션)
   ArrayList<ProductVO> list=(ArrayList)session.getAttribute("list");
   if(list==null){
      list=new ArrayList<ProductVO>();
      session.setAttribute("list", list);
   }
   list.add(product);
%>

<script type="text/javascript">
   alert("<%=product%>(이)가 추가되었습니다!");
   history.go(-1);
</script>

</body>
</html>

 --%>
 -->

</body>
</html>


