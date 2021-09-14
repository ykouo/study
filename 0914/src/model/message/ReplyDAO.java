package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.common.DBCP;

public class ReplyDAO {
	Connection conn= null;
	PreparedStatement pstmt=null;
	
	public boolean insertRe(ReplyVO vo) {
		conn = DBCP.connect();
		String sql ="INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),?,?,SYSDATE,?)";
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
			pstmt.setString(2, vo.getUserid());
			pstmt.setString(3, vo.getRmsg());
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return true;
	}
	
	
/*	public boolean updateRe(ReplyVO vo) {
		conn = DBCP.connect();
		try {
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		
	}
	*/
	public boolean deleteRe(ReplyVO vo) {
		conn = DBCP.connect();
		String sql ="DELETE FROM REPLY WHERE RID=?";
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRid());
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return true;
	}
	
}
