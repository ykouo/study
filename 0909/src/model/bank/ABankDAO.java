package model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class ABankDAO {
	
	public ABankVO getABank() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ABankVO avo = null;
		try {
			String sql = "SELECT * FROM ABANK";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			avo = new ABankVO();
			avo.setBid(rs.getInt("bid"));
			avo.setName(rs.getString("name"));
			avo.setBalance(rs.getInt("balance"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.disconnect(conn, pstmt);		}
		return avo;
	}
	
	public boolean trans(String bid, int bal) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false); // set autocommit=0;
			String sql1="update abank set balance=balance-? where bid=1001";
			String sql2="update bbank set balance=balance+? where bid=2001";
			
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();
			
			ResultSet rs=pstmt.executeQuery("select balance from abank where bid=1001");
			rs.next();
			if(rs.getInt(1)<0) { // 잔액이 0미만이면,
				conn.rollback();
				return false;
			}
			else {
				conn.commit(); // commit;
			}
			
			conn.setAutoCommit(true); // set autocommit=0;			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.disconnect(conn, pstmt);
		}
				
		return true;
	}
	
	
}
