package model.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.board.NoticeBoVO;
import model.common.DBCP;

public class ConcermDAO {
	// C R U D

			// R - Select All ( 관심글 목록 보기 )
			public ArrayList<ConcermVO> getConcermList() {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				ArrayList<ConcermVO> concermList= new ArrayList<>();
				try {
					System.out.println("getConcermList() 수행");
					String sql ="SELECT * FROM CONCERM ORDER BY FAVNUM DESC";
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
			// FAVNUM / MID / PNUM / CATEGORY 
						ConcermVO post = new ConcermVO();
						post.setFavnum(rs.getInt("favnum"));						
						concermList.add(post);
					}rs.close();
				}catch(Exception e) {
					System.out.println("[Exception발생] getFreePostList() 확인!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return concermList;
			}
			
			// R - Select One ( 관심게시글 상세 보기 )
			
/*			public ConcermVO getConcermPost(ConcermVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				ConcermVO post = null;
				try {
					System.out.println("getConcermPost() 수행");
					String sql = "";
					pstmt = conn.prepareStatement(sql);
					pstmt.executeUpdate();

					String sql1 ="";
					pstmt = conn.prepareStatement(sql1);
					
					ResultSet rs = pstmt.executeQuery();
					if(rs.next()) {
			//FAVNUM / MID / PNUM / CATEGORY 	
						post = new ConcermVO();	
						
					}rs.close();
				}catch(Exception e) {
					System.out.println("[Exception발생] getConcermPost() 확인!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return post;
			}
*/
			
			// C - Insert (관심글 등록)
			public boolean insertConcermPost(ConcermVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				boolean res=false;
				try {
					//FAVNUM / MID / PNUM / CATEGORY 
					String sql ="INSERT INTO CONCERM VALUES ((SELECT NVL(MAX(FAVNUM),0)+1 FROM CONCERM),?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getMid());
					pstmt.setInt(2, vo.getPnum());
					pstmt.setString(3, vo.getCategory());
					pstmt.executeUpdate();
					res = true;			
				}catch(Exception e) {
					System.out.println("[Exception발생] insertNoticePost() 확인!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}	
				return res;
			}

			
			// D - Delete (관심글 삭제)			
			public boolean delNoticePost(ConcermVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				boolean res =false;
				try {
					String sql ="DELETE FROM CONCERM WHERE FAVNUM =? AND MID=?";
					pstmt = conn.prepareStatement(sql);;
					pstmt.setInt(1, vo.getFavnum());
					pstmt.setString(2, vo.getMid());
					pstmt.executeUpdate();
					res=true;
				}catch(Exception e) {
					System.out.println("[Exception발생] delNoticePost() 확인!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return res;
			}
			
}
