package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;

public class StudyBoDAO {
	// C R U D

			// R - Select All ( �Խñ� ��� ���� )
			public ArrayList<StudyBoVO> getStudyPostList() {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				ArrayList<StudyBoVO> spList= new ArrayList<>();
				try {
					String sql ="SELECT * FROM STUDYBOARD ORDER BY PNUM DESC";
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
			// PNUM / PTITLE / PCONTENT / PDATE / MNAME / MID / CNT / CATEGORY
						StudyBoVO post = new StudyBoVO();
						post.setPnum(rs.getInt("pnum"));
						post.setPtitle(rs.getString("ptitle"));
						post.setPcontent(rs.getString("pcontent"));
						post.setPdate(rs.getDate("pdate"));
						post.setMname(rs.getString("mname"));
						post.setMid(rs.getString("mid"));
						post.setCnt(rs.getInt("cnt"));
						post.setCategory(rs.getString("category"));
						spList.add(post);
					}rs.close();
				}catch(Exception e) {
					System.out.println("[Exception�߻�] getStudyPostList() Ȯ��!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return spList;
			}
			
			// R - Select One ( �Խñ� �� ���� )
			public StudyBoVO getNoticePost(StudyBoVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				StudyBoVO post = null;
				try {
					String sql = "UPDATE STUDYBOARD SET CNT=CNT+1 WHERE PNUM=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, vo.getPnum());
					pstmt.executeUpdate();

					String sql1 ="SELECT * FROM STUDYBOARD WHERE PNUM = ?";
					pstmt = conn.prepareStatement(sql1);
					pstmt.setInt(1, vo.getPnum());
					ResultSet rs = pstmt.executeQuery();
					if(rs.next()) {
			//PNUM / PTITLE / PCONTENT / PDATE / MNAME / MID / CNT / CATEGORY	
						post = new StudyBoVO();	
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
					System.out.println("[Exception�߻�] getStudyPost() Ȯ��!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return post;
			}
			// C - Insert (�Խñ� �ۼ�)
			public boolean insertStudyPost(StudyBoVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				boolean res=false;
				try {
					String sql ="INSERT INTO STUDYBOARD (PNUM,PTITLE,PCONTENT,MNAME,MID) VALUES ((SELECT NVL(MAX(PNUM),0)+1 FROM STUDYBOARD),?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,vo.getPtitle());
					pstmt.setString(2,vo.getPcontent());
					pstmt.setString(3, vo.getMname());
					pstmt.setString(4, vo.getMid());
					pstmt.executeUpdate();
					res = true;			
				}catch(Exception e) {
					System.out.println("[Exception�߻�] insertStudyPost() Ȯ��!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}	
				return res;
			}
			// U - Update ( �Խñ� ���� )
			public boolean editStudyPost(StudyBoVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				boolean res= false;
				try {
					String sql ="UPDATE STUDYBOARD SET PTITLE=? ,PCONTENT=?,CNT=CNT-1 WHERE PNUM=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,vo.getPtitle());
					pstmt.setString(2, vo.getPcontent());
					pstmt.setInt(3, vo.getPnum());
					pstmt.executeUpdate();
					res=true;
				}catch(Exception e) {
					System.out.println("[Exception�߻�] editStudyPost() Ȯ��!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return res;
			}
			
			// D - Delete (�Խñ� ����)
			
			public boolean delStduyPost(StudyBoVO vo) {
				Connection conn = DBCP.connect();
				PreparedStatement pstmt = null;
				boolean res =false;
				try {
					String sql ="DELETE FROM STUDYBOARD WHERE PNUM =? AND MID=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, vo.getPnum());
					pstmt.setString(2,vo.getMid());
					pstmt.executeUpdate();
					res=true;
				}catch(Exception e) {
					System.out.println("[Exception�߻�] delStudyPost() Ȯ��!");
					e.printStackTrace();
				}finally {
					DBCP.disconnect(conn, pstmt);
				}		
				return res;
			}
			
}
