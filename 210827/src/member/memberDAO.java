
package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class memberDAO {
	Connection conn;
	PreparedStatement pstmt;
	// 연결
	public void connect() {
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
		try{
			Class.forName(jdbc_driver);
			conn=DriverManager.getConnection(jdbc_url,"kim","1234");
		}
		catch(Exception e){
			System.out.println("connect()에서 출력");
			e.printStackTrace();
		}
	}
	// 연결끊기
	public void disconnect() {
		try{
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("disconnect()에서 출력");
			e.printStackTrace();
		}
	}
	// select all
	public ArrayList<memberVO> select() {
		ArrayList<memberVO> datas=new ArrayList();
		try{
			connect();
			String sql="select * from member";
			pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				memberVO vo=new memberVO();
				vo.setPk(rs.getInt("pk"));
				vo.setUserName(rs.getString("userName"));
				vo.setUserID(rs.getString("userID"));
				vo.setUserPW(rs.getString("userPW"));
				datas.add(vo);
			}
			rs.close();
		}
		catch(Exception e){
			System.out.println("select()에서 출력");
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	// insert 
	public void insert(memberVO vo) {
		try{
			connect();
			String sql="insert into member values((select nvl(max(pk),0)+1 from member),?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserID());
			pstmt.setString(2, vo.getUserPW());
			pstmt.setString(3, vo.getUserName());
			pstmt.executeUpdate();
		}
		catch(Exception e){
			System.out.println("insert()에서 출력");
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	// select one
	 public memberVO login(memberVO vo) { // selectOne()
	      memberVO data=null;
	      try{
	         connect();
	         String sql="select * from member where userID=? and userPW=?"; // ☆
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, vo.getUserID());
	         pstmt.setString(2, vo.getUserPW());
	         ResultSet rs=pstmt.executeQuery();
	         if(rs.next()){
	            data=new memberVO();
	            data.setPk(rs.getInt("pk"));
	            data.setUserName(rs.getString("userName"));
	            data.setUserID(rs.getString("userID"));
	            data.setUserPW(rs.getString("userPW"));
	         }
	         rs.close();
	      }
	      catch(Exception e){
	         System.out.println("login()에서 출력");
	         e.printStackTrace();
	      }
	      finally {
	         disconnect();
	      }
	      return data;
	   }

}





























/*package member;

import java.util.ArrayList;

public class memberDAO {
	ArrayList<memberVO>datas = new ArrayList<memberVO>();

	public ArrayList<memberVO> getDatas() {
		return datas;
	}

	public void addMember(memberVO vo) {
		datas.add(vo);
	}
	
	public int login(memberVO vo) {
		
		for(memberVO data : datas) {
			if(data.getUserId().equals(vo.getUserId())) {
				if(data.getUserPw().equals(vo.getUserPw())) {
					return 1; // 로그인 성공하면 리턴 1
				}else {
					return -1; // 아이디는 같으나 비밀번호가 불일치
				}	
			}	
		}
		return 0; // 해당아이디 없음
	}
	
}
*/