package model.mem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.common.JDBC;

public class MemDAO {
	
	// select one - �α���, ȸ����������� ������ ���� ���� 
	public MemVO getUserData(MemVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		MemVO user = null;
		try {
			System.out.println("getUserData() ����");
			String sql ="SELECT * FROM MEM WHERE MID=? AND MPW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				user = new MemVO();
				user.setMnum(rs.getInt("mnum"));
				user.setMid(rs.getString("mid"));
				user.setMname(rs.getString("mname"));	
				user.setMpw(rs.getString("mpw"));
			}rs.close();
		}catch(Exception e) {
			System.out.println("getUserData() �̼��� �߻�!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}	
		return user;
	}
	// insert - ȸ������  C 
	public boolean insertUser(MemVO vo) {
		System.out.println("insertUser�Ѱ����� �� :"+vo);
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		boolean res = false;
		try {
			System.out.println("insertUser() ����");
			String sql ="INSERT INTO MEM VALUES ((SELECT NVL(MAX(MNUM),0)+1 FROM MEM),?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getMpw());
			pstmt.executeUpdate();
			res = true;
		}catch(Exception e) {
			System.out.println("insertUser() �̼��� �߻�!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}	
		return res;
	}
	// Update  - ȸ������ ���� U
	public boolean updateUser(MemVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		boolean res = false;
		try {
			System.out.println("updateUser() ����");
			String sql ="UPDATE MEM SET MID=?, MNAME=?, MPW=? WHERE MNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3,vo.getMpw());
			pstmt.setInt(4, vo.getMnum());
			pstmt.executeUpdate();
			res=true;
		}catch(Exception e) {
			System.out.println("updateUser() �̼��� �߻�!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}	
		System.out.println("updateUser()������ ������ :" + res);
		return res;
	}
	// delete  - ȸ��Ż��  D
	public boolean deleteUser(MemVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		System.out.println("deldeteUser() : " + vo.getMid() + vo.getMpw());
		boolean res = false;
		try {
			System.out.println("deleteUser() ����");
			String sql ="DELETE FROM MEM WHERE MID=? AND MPW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.executeUpdate();
			res=true;
		}catch(Exception e) {
			System.out.println("deleteUser() �̼��� �߻�!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}	
		return res;
	}

}
