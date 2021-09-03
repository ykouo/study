package model.mem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.common.JDBC;

public class MemDAO {
	// select one
	public MemVO getMemInfo(MemVO vo){
		Connection conn = JDBC.connect();
		MemVO mem = null;
		PreparedStatement pstmt =null;
		try {
			String sql = "SELECT * FROM MEM WHERE MID=? AND MPW=?"; // ���ȿ� ���̵� �н����� �����ϴ��� Ȯ��
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			System.out.println(rs);
			if(rs.next()) {
				mem = new MemVO();
				mem.setMnum(rs.getInt("mnum"));
				mem.setMid(rs.getString("mid"));
				mem.setMpw(rs.getString("mpw"));
				System.out.println("����� dao�� if����" + mem);
			}rs.close();
		}catch(Exception e){
			System.out.println("����� DAO getMemInfo���Դϴ�.");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return mem;
	}
	
	
	
	
}
