<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP2</title>
</head>
<body>

<%
//아래에서 사용하기 위해 미리 connection객체 만들어놓음 / 이거 나중에 모델로 분리해야함
   Connection conn=null;
   PreparedStatement pstmt=null;
   try{
      Context initContext=new InitialContext();
   	  // context.xml 파일을 받아온다.
      Context envContext=(Context)initContext.lookup("java:/comp/env");
      DataSource ds=(DataSource)envContext.lookup("jdbc/orcl"); 
   	  //lookup : jndl 사용시 orcl 이라는 이름의 페이지를 찾아서 
      // 프로그래머가 지향하는 "★★★★★★★ 낮은 결합도 / 높은 응집도 ★★★★★★★★"!
      // == 프로그램이 유연해진다 라는 표현을 사용한다. 
      conn=ds.getConnection();
      String sql="insert into test values(?,?)";
      if(request.getParameter("name")!=null){
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, request.getParameter("name"));
         pstmt.setString(2, request.getParameter("email"));
         pstmt.executeUpdate();
      }
   }
   catch(Exception e){
      e.printStackTrace();
   }
%>

<form method="post">
   <input type="text" name="name">
   <input type="text" name="email">
   <input type="submit" value="추가하기">
</form>

<hr>

<%
   try{
      String sql="select * from test";
      pstmt=conn.prepareStatement(sql);
      ResultSet rs=pstmt.executeQuery();
      while(rs.next()){
         out.println(rs.getString("name")+"님 이메일주소는 "+rs.getString("email")+" <br>");
      }
      rs.close();
      pstmt.close();
      conn.close();
   }
   catch(Exception e){
      System.out.println(e);
   }
%>

</body>
</html>