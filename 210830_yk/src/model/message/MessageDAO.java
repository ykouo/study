package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {
	
	public ArrayList<MessageVO> getDBList(){
		Connection conn = JDBC.connect(); // 연결
		ArrayList<MessageVO> datas = new ArrayList<>();
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT * FROM MESSAGE ORDER BY MNUM DESC";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setWdate(rs.getDate("wdate"));
				datas.add(vo);
			}rs.close();
		}catch(Exception e) {
			System.out.println("getDBList()에서 출력");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public MessageVO getDBData(MessageVO vo) {
		Connection conn = JDBC.connect();
		MessageVO data = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql ="SELECT * FROM MESSAGE WHERE MNUM=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data=new MessageVO();
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setContent(rs.getString("content"));
				data.setWriter(rs.getString("writer"));
				data.setWdate(rs.getDate("wdate"));
			}rs.close();
			
		}catch(Exception e) {
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return data;
	}
	public boolean insertDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt =null;
		try {
			String sql = "INSERT INTO MESSAGE VALUES((SELECT NVL(MAX(MNUM),0)+1 FROM MESSAGE),?,?,?,SYSDATE)";
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate(); 
			res=true;
		}catch(Exception e) {
			System.out.println("insertDB()에서 출력");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
		
	}
	public void deleteDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt =null;
		try {
			String sql = "DELETE FROM MESSAGE WHERE MNUM=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("deleteDB()에서 출력");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		
	}
	public boolean updateDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
 		PreparedStatement pstmt = null;
		try {
			String sql ="UPDATE MESSAGE SET WRITER=?,TITLE=?,CONTENT=?,WDATE=SYSDATE WHERE MNUM=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getMnum());
			pstmt.executeUpdate();
			res=true;
		}catch(Exception e) {
			System.out.println("updateDB()에서 출력");
			e.printStackTrace();
			// res = false;
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return res;
	}

}
