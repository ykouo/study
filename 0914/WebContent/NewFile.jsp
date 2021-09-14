<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
  padding:0; 
  margin:0;
}

ul{
  width:300px; 
  border:3px solid #ccc; 
  border-radius:8px; 
  margin:10px 0 0 10px; 
  list-style:none;
}

ul li{
  padding:10px 0 0 10px; 
  border-top:1px dotted #ccc; 
  margin-bottom:10px;
}

ul li:first-child{
  border:0 none;
}

ul li a{
  height:20px; 
  line-height:20px; 
  display:block; 
  text-decoration:none; 
  color:#000;
}
ul li p{color:#f00;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("p").hide();
		// $("ul > li:first-child a").next().show();
		$("ul li a").click(function() {
			$(this).next().slideToggle(300);
			// $(this).next().slideDown(300);
			$("ul li a").not(this).next().slideUp(300);
			return false;
		});
		$("ul li a").eq(0).trigger("click");
	});
</script>

</head>
<body>
<ul>
  <li>
    <a href="#">첫 번째 토글</a>
    <p>첫 번째 내용</p>
  </li>
  <li>
    <a href="#">두 번째 토글</a>
    <p>두 번째 내용</p>
  </li>
  <li>
    <a href="#">세 번째 토글</a>
    <p>세 번째 내용</p>
  </li>
</ul>
</body>
</html>