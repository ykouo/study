package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {
	
	// select All 
	public  ArrayList<MessageVO> getDBList() {	
		Connection conn = JDBC.connect(); // ����
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt =null;
		try{
			String sql="select * from message order by mnum desc";// �ֱ� �Խñ� ��� ��ġ 
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setContent(rs.getString("content"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setWriter(rs.getString("writer"));
				datas.add(vo);
			}
			rs.close();
			
		}catch(Exception e) {
			System.out.println("getDBList()���� ���");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return datas;
		
		
	}
	public MessageVO getDBData(MessageVO vo) {	// ���������� ���� ���ڷδ� vo�� �޴´�. 
		Connection conn = JDBC.connect(); // ����
		MessageVO data = null;
		PreparedStatement pstmt =null;
		try{
			String sql = "select * from message where mnum=?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data = new MessageVO();
				data.setContent(rs.getString("content"));
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setWdate(rs.getDate("wdate"));
				data.setWriter(rs.getString("writer"));
			}
			rs.close();
		}catch(Exception e) {
			System.out.println("getDBData()���� ���");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return data;
	}
	public void insertDB(MessageVO vo) {	
	}
	public void Update(MessageVO vo) {	
	}
	public void delete(MessageVO vo) {	
	}
	
	
	
}
