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
			
			// userid�� null�̰ų�, ""�����̶�� ==> �α��� ���� �ʾҴٸ�
			if((userid==null) || (userid.equals(""))){ 
				sql = "SELECT * FROM MESSAGE WHERE ROWNUM <= ? ORDER BY MID DESC";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,mcnt);	
				System.out.println("����� [1]");
			}
			// �α��� �ߴٸ� userid���� �Ѱܹ޾� �ش� userid�� ���� ������ �� ���� �����ش�. 
			else {
				sql = "SELECT * FROM MESSAGE WHERE USERID =? AND ROWNUM <= ? ORDER BY MID DESC";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setInt(2, mcnt);
				System.out.println("����� [2]");
			}
			rs = pstmt.executeQuery(); // select���� ����
			
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
				// --> ��ۼ��� �Ʒ����� ��������� select�� �Ŀ�  �����Ҳ���.
				m.setMdate(rs.getDate("mdate"));
			// rs�� ���� message�����͸� MessageVO������ ����
				
				String rsql = "SELECT * FROM REPLY WHERE MID=? ORDER BY RID DESC";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("mid"));
				ResultSet rrs = pstmt.executeQuery();
				//int rcnt=0; // reqlycount �� ���� ���� 
				while(rrs.next()) {
					ReplyVO r = new ReplyVO();
					r.setRid(rrs.getInt("rid"));
					r.setMid(rrs.getInt("mid"));
					r.setUserid(rrs.getString("userid"));
					r.setRdate(rrs.getDate("rdate"));
					r.setRmsg(rrs.getString("rmsg"));
					rlist.add(r); // �̸� �����ص� rlist ����Ʈ�� ��������� ����ִ� ReplybVO��ü�� ��´�.
					//rcnt++; // ���ī��Ʈ���� ������Ų��.
				}
				//m.setReplycount(rcnt); // ��� ī��Ʈ�� ����
				
				ms.setM(m); // MessageSet�� ��ü�� ms�� �Խñ� ������ ����ִ� m��ü�� ����
				ms.setRlist(rlist);// MessageSet�� ��ü�� ms�� ��۵��� ����ִ� rlist�� ����
				datas.add(ms); // MessageSet��ü�� ���� ��̸���Ʈ datas
				rrs.close();
				System.out.println(datas);
				System.out.println("����� [3]");
			}
			
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("����� MessageDAO�� selectAll");
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
				// ------------ ��� ---------------------------
				String rsql = "SELECT * FROM REPLY WHERE MID=?";
				pstmt=conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("mid"));
				int rcnt=0; // reqlycount �� ���� ���� 
				ResultSet rrs = pstmt.executeQuery();
				while(rrs.next()) {
					ReplyVO r = new ReplyVO();
					r.setRid(rrs.getInt("rid"));
					r.setMid(rrs.getInt("mid"));
					r.setUserid(rrs.getString("userid"));
					r.setRdate(rrs.getDate("rdate"));
					r.setRmsg(rrs.getString("rmsg"));
					rlist.add(r); // �̸� �����ص� rlist ����Ʈ�� ��������� ����ִ� ReplybVO��ü�� ��´�.
					rcnt++; // ���ī��Ʈ���� ������Ų��.
				}
				data.setReplycount(rcnt);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("����� MessageDAO�� selectOne");
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
			System.out.println("����� MessageDAO�� insert");
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
		String sql = "DELETE FROM MESSAGE WHERE MID=?"; //Mid�� ���ڷ� �޴������� fk�� �����Ǿ� �ִ� ���۵� �Բ� �����ϱ� ���ؼ� 
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
	
