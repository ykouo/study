package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;
import model.message.MessageVO;

public class BoardDAO {
	
	// �޽��� ���̺� ��ü �Խñ� ���� 
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
				System.out.println("getTotalCount ���� �߻�");
				e.printStackTrace();
			}
			System.out.println("getTotalCount ����");

		}
		return total;
	}
	
	// ���������� �Խñ۸���Ʈ�� ������ �޼��� 
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
			System.out.println("MessageVO��List="+list);
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return list;
	}
}
