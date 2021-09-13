// 1.0.0 
package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.common.DBCP;


public class FreeBoDAO {
	
	// C R U D

	// R - Select All ( 게시글 목록 보기 )
	public ArrayList<FreeBoVO> getFreePostList() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoVO> fpList= new ArrayList<>();
		try {
			System.out.println("getFreePostList() 수행");
			String sql ="SELECT * FROM FREEBOARD ORDER BY PNUM DESC";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
	//PNUM / PTITLE / PCONTENT / PDATE / MNAME / MID / CNT / CATEGORY
				FreeBoVO post = new FreeBoVO();
				post.setPnum(rs.getInt("pnum"));
				post.setPtitle(rs.getString("ptitle"));
				post.setPcontent(rs.getString("pcontent"));
				post.setPdate(rs.getDate("pdate"));
				post.setMname(rs.getString("mname"));
				post.setMid(rs.getString("mid"));
				post.setCnt(rs.getInt("cnt"));
				post.setCategory(rs.getString("category"));
				fpList.add(post);
			}rs.close();
		}catch(Exception e) {
			System.out.println("[Exception발생] getFreePostList() 확인!");
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}		
		// System.out.println("getFreePostList() : "+fpList);
		return fpList;
	}
	
	// R - Select One ( 게시글 상세 보기 )
	public FreeBoVO getFreePost(FreeBoVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		FreeBoVO post = null;
		try {
			System.out.println("getFreePost() 수행");
			String sql = "UPDATE FREEBOARD SET CNT=CNT+1 WHERE PNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPnum());
			pstmt.executeUpdate();

			String sql1 ="SELECT * FROM FREEBOARD WHERE PNUM = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo.getPnum());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
	//PNUM / PTITLE / PCONTENT / PDATE / MNAME / MID / CNT / CATEGORY	
				post = new FreeBoVO();	
				post.setPnum(rs.getInt("pnum"));
				post.setPtitle(rs.getString("ptitle"));
				post.setPcontent(rs.getString("pcontent"));
				post.setPdate(rs.getDate("pdate"));
				post.setMname(rs.getString("mname"));
				post.setMid(rs.getString("mid"));
				post.setCnt(rs.getInt("cnt"));
				post.setCategory(rs.getString("category"));
			}rs.close();
		}catch(Exception e) {
			System.out.println("[Exception발생] getFreePost() 확인!");
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}		
		// System.out.println("getFreePost() : "+post);
		return post;
	}
	// C - Insert (게시글 작성)
	public boolean insertFreePost(FreeBoVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		boolean res=false;
		try {
			String sql ="INSERT INTO FREEBOARD (PNUM,PTITLE,PCONTENT,MNAME,MID) VALUES ((SELECT NVL(MAX(PNUM),0)+1 FROM FREEBOARD),?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2,vo.getPcontent());
			pstmt.setString(3, vo.getMname());
			pstmt.setString(4, vo.getMid());
			pstmt.executeUpdate();
			res = true;			
		}catch(Exception e) {
			System.out.println("[Exception발생] insertFreePost() 확인!");
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}			
		return res;
	}
	// U - Update ( 게시글 수정  )
	public boolean editFreePost(FreeBoVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		boolean res= false;
		try {
			String sql ="UPDATE FREEBOARD SET PTITLE=? ,PCONTENT=?,CNT=CNT-1 WHERE PNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2, vo.getPcontent());
			pstmt.setInt(3, vo.getPnum());
			pstmt.executeUpdate();
			res=true;
		}catch(Exception e) {
			System.out.println("[Exception발생] editFreePost() 확인!");
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}		
		return res;
	}
	
	// D - Delete (게시글 삭제)
	
	public boolean delFreePost(FreeBoVO vo) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		boolean res =false;
		try {
			System.out.println("getFreePostList() 수행");
			String sql ="DELETE FROM FREEBOARD WHERE PNUM =? AND MID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPnum());
			pstmt.setString(2,vo.getMid());
			pstmt.executeUpdate();
			res=true;
		}catch(Exception e) {
			System.out.println("getPostList() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}		
		return res;
	}
	
	
	
}
