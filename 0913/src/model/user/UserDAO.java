package model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public boolean insert(UserVO vo) {
		conn = DBCP.connect();
		String sql = "INSERT INTO USERINFO VALUES (?,?,?,SYSDATE)";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUsername());
			pstmt.setString(3, vo.getUserpw());
			pstmt.executeUpdate();
			result=true;
		} catch (SQLException e) {
			e.printStackTrace();			
		}
		finally {
			DBCP.disconnect(conn, pstmt);
		}
		return result;
	}
	

	
	public boolean login(UserVO vo) {
		conn = DBCP.connect();
		String sql = "SELECT USERID,USERPW FROM USERINFO WHERE USERID=?";
		boolean  res= false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			//pstmt.setString(2, vo.getUserpw());
			rs = pstmt.executeQuery();		
			rs.next();
			if(rs.getString("userpw").equals(vo.getUserpw())) {
				res=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(conn, pstmt);
		}
		return res;
	}
	
	public ArrayList<UserVO> selectAll() {
		ArrayList<UserVO> datas = new ArrayList<UserVO>();
		conn = DBCP.connect();
		String sql = "SELECT * FROM USERINFO WHERE ROWNUM <=3";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserVO data=new UserVO();
				data.setUdate(rs.getDate("udate"));
				data.setUsername(rs.getString("username"));
				data.setUserpw(rs.getString("userpw"));
				data.setUserid(rs.getString("userid"));
				datas.add(data);
			}rs.close();
		} catch (SQLException e) {
			e.printStackTrace();			
		}
		finally {
			DBCP.disconnect(conn, pstmt);
		}
		return datas;
	}
}
