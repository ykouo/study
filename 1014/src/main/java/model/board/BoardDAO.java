package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import model.common.JDBC;

// DAO-> 드라이버, CP, MyBatis, JPA, ...
// Service에서 DAO객체를 이용하여 CRUD기능을 제공할 예정!
// 폰Service <-> 시계DAO
@Repository("boardDAO")
public class BoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// SQL문
	private final String insertBoardSQL = "INSERT INTO BOARD (BID,MID,TITLE,CONTENT) VALUES ((SELECT NVL(MAX(BID),0)+1 FROM BOARD),?,?,?)"; 
	private final String updateBoardSQL = "UPDATE BOARD SET TITLE=?,CONTENT=? WHERE BID=?";
	private final String deleteBoardSQL = "DELETE FROM BOARD WHERE BID=? AND MID=?";
	private final String selectAllBoardSQL = "SELECT * FROM BOARD ORDER BY BID DESC";
	private final String selectOneBoardSQL = "SELECT * FROM BOARD WHERE BID=?";
	private final String getBoardCntSQL = "SELECT COUNT(*) FROM BOARD";
	//private final String getBoardPagingSQL = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.BID,A.MID,A.TITLE,A.CONTENT,A.WDATE FROM (SELECT * FROM BOARD ORDER BY BID DESC) A) WHERE RNUM BETWEEN "+startRow+" AND "+endRow;
	//private final String searchBoardSQL = "SELECT * FROM BOARD WHERE TITLE LIKE ? ORDER BY BID DESC";

	
	public boolean insertBoard(BoardVO vo) {
		System.out.println("dao로 insert");
		//insertBoardSQL = "INSERT INTO BOARD (BID,MID,TITLE,CONTENT) VALUES ((SELECT NVL(MAX(BID),0)+1 FROM BOARD),?,?,?)"; 
		boolean res = false;
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(insertBoardSQL);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			res=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt);
		}
		return res;
	}
	public void updateBoard(BoardVO vo) {
		System.out.println("dao로 update");
		//  updateBoardSQL = "UPDATE BOARD SET TITLE=?,CONTENT=? WHERE BID=?";
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(updateBoardSQL);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt);
		}
	}
	public void deleteBoard(BoardVO vo) {
		System.out.println("dao로 delete");
		// deleteBoardSQL = "DELETE FROM BOARD WHERE BID=? AND MID=?";
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(deleteBoardSQL);
			pstmt.setInt(1, vo.getBid());
			pstmt.setString(2, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt);
		}
	}
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("dao로 getList");
		// selectAllBoardSQL = "SELECT * FROM BOARD ORDER BY BID DESC";
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(selectAllBoardSQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardVO data=new BoardVO();
				data.setBid(rs.getInt("bid"));
				data.setTitle(rs.getString("title"));
				data.setMid(rs.getString("mid"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getDate("wdate"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt,rs);
		}
		return datas;
	}
	public BoardVO getBoard(BoardVO vo) {
		//System.out.println("dao로 get");
		// selectOneBoardSQL = "SELECT * FROM BOARD WHERE BID=?";
		BoardVO data=null;
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(selectOneBoardSQL);
			pstmt.setInt(1, vo.getBid());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new BoardVO();
				data.setBid(rs.getInt("bid"));
				data.setTitle(rs.getString("title"));
				data.setMid(rs.getString("mid"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getDate("wdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt, rs);
		}
		return data;
	}
	// 게시판 전체글수를 카운팅하는 메서드 
	public int getBoardCnt() {
		int total = 0;
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(getBoardCntSQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt, rs);
		}
		System.out.println(total);
		return total;
	}
	// pagenation을 위한 getList
	public List<BoardVO> getBoardList(int startRow, int endRow) {
		System.out.println("dao로 getList");
		String getBoardPagingSQL = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.BID,A.MID,A.TITLE,A.CONTENT,A.WDATE FROM (SELECT * FROM BOARD ORDER BY BID DESC) A) WHERE RNUM BETWEEN "+startRow+" AND "+endRow;
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			conn=JDBC.getConnection();
			pstmt=conn.prepareStatement(getBoardPagingSQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardVO data=new BoardVO();
				data.setBid(rs.getInt("bid"));
				data.setTitle(rs.getString("title"));
				data.setMid(rs.getString("mid"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getDate("wdate"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			JDBC.close(conn, pstmt,rs);
		}
		return datas;
	}
	
	
}
