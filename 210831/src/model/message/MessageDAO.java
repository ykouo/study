package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;

public class MessageDAO {
	
	// SELECT ALL
	public ArrayList<MessageVO> getDBList() {
		Connection conn = JDBC.connect();
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt=null;
		try {
			String sql = "SELECT * FROM MESSAGE ORDER BY MNUM DESC"; // �ֱ� �Խñ� ��� ��ġ�� ���� �������� ����
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {	// �о���� DB�����Ͱ� ������ while�� ���� ������ �����ϴµ� 
				MessageVO vo =new MessageVO(); // �̶� �޾ƿ� ������ MessageVO�� �⺻�����ڿ� �����Ͽ� �޾ƿ´�. 
				vo.setMnum(rs.getInt("mnum"));
				vo.setWriter(rs.getString("writer"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWdate(rs.getDate("wdate"));
				datas.add(vo); // datas arraylist�� vo��ü�� ��´�. 
			}rs.close();
		}catch(Exception e) {
			System.out.println("getDBList()Ȯ��!");
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return datas;
	}
	// SELECT ONE
	public MessageVO getDBData(MessageVO vo) {
		Connection conn = JDBC.connect();
		MessageVO data = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT * FROM MESSAGE WHERE MNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data= new MessageVO();
				data.setMnum(rs.getInt("mnum"));
				data.setWriter(rs.getString("writer"));
				data.setTitle(rs.getString("title"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getDate("wdate"));
			}rs.close();
		}catch(Exception e) {
			System.out.println("getDBData()Ȯ��");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}
		return data;
	}
	// INSERT 
	public boolean insertDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt =null;
		try {
			String sql = "INSERT INTO MESSAGE VALUES ((SELECT NVL(MAX(MNUM),0)+1 FROM MESSAGE),?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			res = true;
		}catch(Exception e) {
			System.out.println("insertDB()Ȯ��");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(conn, pstmt);
		}
		return res;
	}
	// DELETE
	public boolean deleteDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt =null;
		try {
			String sql = "DELETE FROM MESSAGE WHERE MNUM=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.executeUpdate();
			res = true;
		}catch(Exception e) {
			System.out.println("deleteDB()Ȯ��");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(conn, pstmt);
		}
		return res;
		
	}
	// UPDATE
	public boolean updateDB(MessageVO vo) {
		Connection conn = JDBC.connect();
		boolean res = false;
		PreparedStatement pstmt =null;
		try {
			String sql = "UPDATE MESSAGE SET WRITER=?,TITLE=?,CONTENT=?,WDATE=SYSDATE WHERE MNUM=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getMnum());
			pstmt.executeUpdate();
			res = true;
		}catch(Exception e) {
			System.out.println("updateDB()Ȯ��");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(conn, pstmt);
		}
		return res;		
		
	}
}
