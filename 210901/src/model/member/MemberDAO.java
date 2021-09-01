package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.common.JDBC;

public class MemberDAO {

	// select one
	public MemberVO getMemData(MemberVO vo){
		Connection conn = JDBC.connect();
		MemberVO mem=null;
		PreparedStatement pstmt=null;
		try{
			String sql ="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				mem = new MemberVO();
				mem.setMnum(rs.getInt("mnum"));
				mem.setMid(rs.getString("mid"));
				mem.setMpw(rs.getString("mpw"));
			}rs.close();
		}catch(Exception e) {
			System.out.println("gtMemData()확인");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return mem;
	}
	// insert
	public boolean insertMember(MemberVO vo) {
		Connection conn = JDBC.connect();
		boolean res= false;
		PreparedStatement pstmt=null;
		try{
			String sql = "INSERT INTO MEMBER VALUES ((SELECT NVL(MAX(MNUM),0)+1 FROM MEMBER),?,?)";
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
	
	
	
}
