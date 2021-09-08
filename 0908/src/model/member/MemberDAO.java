package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;

public class MemberDAO {


	// SELECT ALL
	public ArrayList<MemberVO> memberList() {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt = null;	
		ArrayList<MemberVO> memList = new ArrayList<>();
		try {
			String sql = "SELECT * FROM MEMBER";
			pstmt=conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO mem = new MemberVO();
				mem.setName(rs.getString("name"));
				mem.setMid(rs.getString("mid"));
				mem.setMpw(rs.getString("mpw"));
				memList.add(mem);
			}
			System.out.println(memList);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return memList;
	}

	// SELECT ONE
	public MemberVO getMemInfo(MemberVO vo) {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt = null;
		
		MemberVO mem = null;
		try {
			
			String sql = "SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				mem = new MemberVO();
				mem.setName(rs.getString("name"));
				mem.setMid(rs.getString("mid"));
				mem.setMpw(rs.getString("mpw"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return mem;
	}

	// INSERT
	public boolean insertMem(MemberVO vo) {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt = null;
		
		boolean res = false;
		try {
			String sql = "INSERT INTO MEMBER VALUES (?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getMpw());
			pstmt.executeUpdate();
			
			res = true;

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}

	// UPDATE
	public boolean updateMem(MemberVO vo) {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt = null;
		
		boolean res = false;
		try {
			String sql = "UPDATE MEMBER SET NAME=?, MPW=? WHERE MID=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
			res = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}

	// DELETE
	public boolean deleteMem(MemberVO vo) {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt = null;
		
		boolean res = false;
		try {
			String sql = "DELETE FROM MEMBER WHERE MID=? AND MPW=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.executeUpdate();
			
			res = true;

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}

}
