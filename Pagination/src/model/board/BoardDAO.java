package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;
import model.message.MessageVO;

public class BoardDAO {
	
	// 메시지 테이블 전체 게시글 개수 
	public int getTotalCount() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		int total = 0;
		try {
			conn = DBCP.connect();

			String sql = "SELECT COUNT(*) FROM MESSAGE";
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("getTotalCount 에러 발생");
				e.printStackTrace();
			}
			System.out.println("getTotalCount 퇴장");

		}
		return total;
	}
	
	// 한페이지에 게시글리스트를 보여줄 메서드 
	public ArrayList<MessageVO> getList(int startRow, int endRow){
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<MessageVO> list = new ArrayList<MessageVO>();
		try {
			String sql ="SELECT * FROM (SELECT ROWNUM AS MID,USERID,MSG,FAVCOUNT,REPLYCOUNT,MDATE FROM MESSAGE ORDER BY MID) WHERE MID BETWEEN "+startRow+" AND "+endRow;
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO m = new MessageVO();
				m.setMid(rs.getInt("mid"));
				m.setUserid(rs.getString("userid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setReplycount(rs.getInt("replycount"));
				m.setMdate(rs.getDate("mdate"));
				list.add(m);
			}
			System.out.println("MessageVO의List="+list);
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return list;
	}
}
