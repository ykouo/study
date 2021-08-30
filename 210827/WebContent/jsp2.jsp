<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
   String jdbc_driver="oracle.jdbc.driver.OracleDriver";
   String jdbc_url="jdbc:oracle:thin:@localhost:1521:xe";
	// 상단에 배치하는 이유 : 아래에서 close하기 위해 scope를 맞춘다.
   Connection conn=null;   
   PreparedStatement pstmt=null;
  
   try{ 
      Class.forName(jdbc_driver);
      conn=DriverManager.getConnection(jdbc_url,"kim","1234");
   	// sql문 
      String sql="insert into test values(?,?)";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("a"));
      pstmt.setInt(2,Integer.parseInt(request.getParameter("b")));
      if(request.getParameter("a")!=null){
         pstmt.executeUpdate(); // ★★★  if문을 거치지 않고 실행시 null값이 들어갈 위험이 있기때문에
			// 받아올 값이 있는지 꼭 확인하는 과정을 거친다.
      }
   }
   catch(Exception e){
      System.out.println(e);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="jsp2.jsp" method="post">
   문자열 a: <input type="text" name="a"> <br>
   정수 b: <input type="text" name="b"> <br>
   <input type="submit" value="DB에 데이터 추가하기">
</form>

<hr>

<h3>DB에 저장된 데이터 목록</h3>
<% 
//ResultSet 을 하여 보여준다.
   ResultSet rs=null;
   try{
      String sql="select * from test";
      pstmt=conn.prepareStatement(sql);
      rs=pstmt.executeQuery();
      int i=1;
      while(rs.next()){
         out.println(i+". "+rs.getString("a")+" "+rs.getInt("b")+"<br>");
         i++;
      }
   }
   catch(Exception e){
      System.out.println(e);
   }
   finally{
      rs.close();
      pstmt.close();
      conn.close();
   }

%>

</body>
</html>