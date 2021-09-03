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
			String sql = "SELECT * FROM MEM WHERE MID=? AND MPW=?"; // 디비안에 아이디 패스워드 존재하는지 확인
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
				System.out.println("여기는 dao의 if문안" + mem);
			}rs.close();
		}catch(Exception e){
			System.out.println("여기는 DAO getMemInfo안입니다.");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return mem;
	}
	
	
	
	
}
