package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {
	
	// select All 
	public  ArrayList<MessageVO> getDBList() {	
		Connection conn = JDBC.connect(); // 연결
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt =null;
		try{
			String sql="select * from message order by mnum desc";// 최근 게시글 상단 배치 
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
			System.out.println("getDBList()에서 출력");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return datas;
		
		
	}
	public MessageVO getDBData(MessageVO vo) {	// 유지보수를 위해 인자로는 vo를 받는다. 
		Connection conn = JDBC.connect(); // 연결
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
			System.out.println("getDBData()에서 출력");
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
