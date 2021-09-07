package model.post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.common.JDBC;


public class PostDAO {

	// select All - 전체 게시글 보여주기  R
	public ArrayList<PostVO> getPostList() {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		ArrayList<PostVO> pLists = new ArrayList<>();
		try {
			System.out.println("getPostList() 수행");
			String sql ="SELECT * FROM POST ORDER BY PNUM DESC";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				PostVO post = new PostVO();
				post.setPnum(rs.getInt("pnum"));
				post.setPtitle(rs.getString("ptitle"));
				post.setPwriter(rs.getString("pwriter"));
				post.setPcontent(rs.getString("pcontent"));
				post.setPdate(rs.getDate("pdate"));
				pLists.add(post);
			}rs.close();
		}catch(Exception e) {
			System.out.println("getPostList() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}		
		return pLists;
	}
	// select All - 검색 게시글 보여주기 R
	public ArrayList<PostVO> searchPostList(String condition , String content) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		ArrayList<PostVO> postList = new ArrayList<>();
		try {
			System.out.println("searchPostList() 수행");
			String sql ="SELECT * FROM POST WHERE "+condition+" LIKE '%"+content+"%' ORDER BY PNUM DESC";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				PostVO post = new PostVO();
				post.setPnum(rs.getInt("pnum"));
				post.setPtitle(rs.getString("ptitle"));
				post.setPwriter(rs.getString("pwriter"));
				post.setPcontent(rs.getString("pcontent"));
				post.setPdate(rs.getDate("pdate"));
				postList.add(post);
			}rs.close();
		}catch(Exception e) {
			System.out.println("searchPostList() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			System.out.println(postList);
			JDBC.disconnect(conn, pstmt);
		}		
		return postList;
	}
	
	// select One - 게시글 상세보기  R
	public PostVO getPostOne(PostVO vo) {
		Connection conn = JDBC.connect();
		PostVO post = null;
		PreparedStatement pstmt = null;
		System.out.println("여기는 getPostOne() 안 받아온 Pnum: " +vo.getPnum());
		try {
			System.out.println("getPostOne() 수행");
			String sql ="SELECT * FROM POST WHERE PNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPnum());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				post = new PostVO();
				post.setPnum(rs.getInt("pnum"));
				post.setPtitle(rs.getString("ptitle"));
				post.setPwriter(rs.getString("pwriter"));
				post.setPcontent(rs.getString("pcontent"));
				post.setPdate(rs.getDate("pdate"));
			}rs.close();
		}catch(Exception e) {
			System.out.println("getPostOne() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			System.out.println("PostOne의 post : " + post);
			JDBC.disconnect(conn, pstmt);
		}	
		return post;
		
	}
	
	// insert - 게시글 작성 C
	public boolean insertPost(PostVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		boolean res=false;
		try {
			System.out.println("insertPost() 수행");
			String sql ="INSERT INTO POST VALUES ((SELECT NVL(MAX(PNUM),0)+1 FROM POST),?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPtitle());
			pstmt.setString(2,vo.getPwriter());
			pstmt.setString(3, vo.getPcontent());
			pstmt.executeUpdate();
			res = true;			
		}catch(Exception e) {
			System.out.println("insertPost() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			System.out.println(vo);
			JDBC.disconnect(conn, pstmt);
		}	
		return res;
	}

	// update - 게시글 수정 U 
	public boolean updatePost(PostVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		boolean res= false;
		try {
			System.out.println("updatePost() 수행");
			String sql ="UPDATE POST SET PTITLE=?,PCONTENT=? WHERE PNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPtitle());
			pstmt.setString(2, vo.getPcontent());
			pstmt.setInt(3, vo.getPnum());
			pstmt.executeUpdate();
			res=true;
			
		}catch(Exception e) {
			System.out.println("updatePost() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}	
		return res;
	}
	// delete -  게시글 삭제 D
	public boolean deletePost(PostVO vo) {
		Connection conn = JDBC.connect();
		PreparedStatement pstmt = null;
		boolean res= false;
		try {
			System.out.println("deletePost() 수행");
			String sql ="DELETE FROM POST WHERE PNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPnum());
			pstmt.executeUpdate();
			res= true;
		}catch(Exception e) {
			System.out.println("deletePost() 이셉션 발생!");
			e.printStackTrace();
		}finally {
			JDBC.disconnect(conn, pstmt);
		}	
		return res;
	}	


	
	
}
