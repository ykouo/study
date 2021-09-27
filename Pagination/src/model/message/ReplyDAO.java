package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.common.DBCP;

public class ReplyDAO {
	Connection conn= null;
	PreparedStatement pstmt=null;
	
	public boolean insertRe(ReplyVO vo) {
		conn = DBCP.connect();
		boolean res = false;
		String sql ="INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),?,?,SYSDATE,?)";
		try {
			conn.setAutoCommit(false); // 오토커밋 해제
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
			pstmt.setString(2, vo.getUserid());
			pstmt.setString(3, vo.getRmsg());
			pstmt.executeUpdate();
			
			String sql2 = "UPDATE MESSAGE SET REPLYCOUNT=REPLYCOUNT+1 WHERE MID=?";
			
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();
			res=true;
			
			if (res) {
				conn.commit();
			} else {			
				conn.rollback();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return true;
	}
	
	
	public boolean deleteRe(ReplyVO vo) {
		
		conn = DBCP.connect();
		boolean res= false;
		String sql ="DELETE FROM REPLY WHERE RID=?"; // 대댓글 삭제를 위해 대댓글의 PK값인 RID를 받아온다 
		try {
			conn.setAutoCommit(false); // 오토커밋 해제
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRid());
			pstmt.executeUpdate();
			
			String sql2 = "UPDATE MESSAGE SET REPLYCOUNT=REPLYCOUNT-1 WHERE MID=?";
			
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();
			
			res=true;			
			if (res) {
				conn.commit();
			} else {			
				conn.rollback();
			}
		}
		catch(Exception e) {
			e.printStackTrace();			
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}
	
}
