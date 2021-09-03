package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;

public class MemberDAO {
	// select all
/*	public ArrayList<MemberVO> getMemList() {
		Connection conn = JDBC.connect();
		ArrayList<MemberVO> members = new ArrayList<>();
		PreparedStatement pstmt=null;
		try{
			String sql ="SELECT * FROM MEMBER  "
			
		}catch(Exception e) {
			
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		
		return members;
	}*/
	
	// select one
	public MemberVO getMemData(MemberVO vo) {
		Connection conn = JDBC.connect();
		MemberVO member = null;
		PreparedStatement pstmt=null;
		try{
			String sql ="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				member.setMnum(rs.getInt("mnum"));
				member.setMid(rs.getString("mid"));
				member.setMpw(rs.getString("mpw"));
			}rs.close();
		}catch(Exception e) {
			System.out.println("gtMemData()확인");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return member;
	}

	public boolean insertMember(MemberVO vo) {
		Connection conn = JDBC.connect();
		boolean res= false;
		PreparedStatement pstmt=null;
		try{
			String sql = "INSERT INTO MEMBER (MID,MPW) VALUES (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.executeUpdate();
			res =true;
		}catch(Exception e) {
			System.out.println("insertMember()확인");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return res;
	}

/*	public void deleteMember() {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt=null;
		try{
			
			
		}catch(Exception e) {
			
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
	}*/

/*	public void updateMember() {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt=null;
		try{
			
			
		}catch(Exception e) {
			
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
	}*/
}
