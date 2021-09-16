package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;

public class MessageDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ArrayList<MessageSet> selectAll(String userid, int mcnt){
		ArrayList<MessageSet> datas = new ArrayList<MessageSet>();
		conn = DBCP.connect();
		String sql;
		System.out.println("userid="+userid +" mcnt="+mcnt);
		try {
			
			// userid가 null이거나, ""공백이라면 ==> 로그인 하지 않았다면
			if((userid==null) || (userid.equals(""))){ 
				sql = "SELECT * FROM MESSAGE WHERE ROWNUM <= ? ORDER BY MID DESC";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,mcnt);	
				System.out.println("여기는 [1]");
			}
			// 로그인 했다면 userid값을 넘겨받아 해당 userid를 가진 유저가 쓴 글을 보여준다. 
			else {
				sql = "SELECT * FROM MESSAGE WHERE USERID =? AND ROWNUM <= ? ORDER BY MID DESC";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setInt(2, mcnt);
				System.out.println("여기는 [2]");
			}
			rs = pstmt.executeQuery(); // select문을 실행
			
			while(rs.next()) {
				MessageSet ms = new MessageSet();
				MessageVO m = new MessageVO();
				ArrayList<ReplyVO> rlist=new ArrayList<ReplyVO>();
				// MID / USERID / MSG / FAVCOUNT / REPLYCOUNT / MDATE
				m.setMid(rs.getInt("mid"));	
				m.setUserid(rs.getString("userid"));
				m.setMsg(rs.getString("msg"));
				m.setFavcount(rs.getInt("favcount"));
				m.setReplycount(rs.getInt("replycount")); 
				// --> 댓글수는 아래에서 댓글정보를 select한 후에  셋팅할꺼다.
				m.setMdate(rs.getDate("mdate"));
			// rs로 받은 message데이터를 MessageVO변수에 셋팅
				
				String rsql = "SELECT * FROM REPLY WHERE MID=? ORDER BY RID DESC";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("mid"));
				ResultSet rrs = pstmt.executeQuery();
				//int rcnt=0; // reqlycount 를 담을 변수 
				while(rrs.next()) {
					ReplyVO r = new ReplyVO();
					r.setRid(rrs.getInt("rid"));
					r.setMid(rrs.getInt("mid"));
					r.setUserid(rrs.getString("userid"));
					r.setRdate(rrs.getDate("rdate"));
					r.setRmsg(rrs.getString("rmsg"));
					rlist.add(r); // 미리 선언해둔 rlist 리스트에 댓글정보를 담고있는 ReplybVO객체를 담는다.
					//rcnt++; // 댓글카운트수를 증가시킨다.
				}
				//m.setReplycount(rcnt); // 댓글 카운트수 셋팅
				
				ms.setM(m); // MessageSet의 객체인 ms에 게시글 내용을 담고있는 m객체를 셋팅
				ms.setRlist(rlist);// MessageSet의 객체인 ms에 댓글들을 담고있는 rlist를 셋팅
				datas.add(ms); // MessageSet객체를 담을 어레이리스트 datas
				rrs.close();
				System.out.println(datas);
				System.out.println("여기는 [3]");
			}
			
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("여기는 MessageDAO의 selectAll");
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return datas;
	}
	
	public MessageSet selectOne(MessageVO vo) {
		conn = DBCP.connect();
		MessageVO data = null;
		MessageSet result=new MessageSet();
		
		// MID / USERID / MSG / FAVCOUNT / REPLYCOUNT / MDATE
		ArrayList<ReplyVO> rlist =new ArrayList<ReplyVO>();
		
		String sql = "SELECT * FROM MESSAGE WHERE MID=?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());	
			rs = pstmt.executeQuery();
			if(rs.next()) {
				data = new MessageVO();
				data.setMid(rs.getInt("mid"));
				data.setUserid(rs.getString("userid"));
				data.setMsg(rs.getString("msg"));
				data.setFavcount(rs.getInt("favcount"));
				data.setMdate(rs.getDate("mdate"));
				// ------------ 댓글 ---------------------------
				String rsql = "SELECT * FROM REPLY WHERE MID=?";
				pstmt=conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("mid"));
				int rcnt=0; // reqlycount 를 담을 변수 
				ResultSet rrs = pstmt.executeQuery();
				while(rrs.next()) {
					ReplyVO r = new ReplyVO();
					r.setRid(rrs.getInt("rid"));
					r.setMid(rrs.getInt("mid"));
					r.setUserid(rrs.getString("userid"));
					r.setRdate(rrs.getDate("rdate"));
					r.setRmsg(rrs.getString("rmsg"));
					rlist.add(r); // 미리 선언해둔 rlist 리스트에 댓글정보를 담고있는 ReplybVO객체를 담는다.
					rcnt++; // 댓글카운트수를 증가시킨다.
				}
				data.setReplycount(rcnt);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("여기는 MessageDAO의 selectOne");
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return result;	
	}
	
	public boolean insert(MessageVO vo) {
		conn = DBCP.connect();
		boolean res = false;
		// MID / USERID / MSG / FAVCOUNT / REPLYCOUNT / MDATE
		String sql = "INSERT INTO MESSAGE (MID,USERID,MSG,MDATE) VALUES ((SELECT NVL(MAX(MID),0)+1 FROM MESSAGE),?,?,SYSDATE)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2,vo.getMsg());
			pstmt.executeUpdate();
			res=true;
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("여기는 MessageDAO의 insert");
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}public boolean update(MessageVO vo) {
		conn = DBCP.connect();		
		boolean res = false;
		String sql = "UPDATE MESSAGE SET FAVCOUNT=FAVCOUNT+1 WHERE MID=?";	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();
			res = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}
	public boolean delete(MessageVO vo) {
		conn = DBCP.connect();		
		boolean res = false;
		String sql = "DELETE FROM MESSAGE WHERE MID=?"; //Mid를 인자로 받는이유는 fk로 설정되어 있는 대댓글도 함께 삭제하기 위해서 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMid());
			pstmt.executeUpdate();
			res= true;
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}
			
	
	
	
}
	
