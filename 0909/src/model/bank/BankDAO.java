package model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.DBCP;

public class BankDAO {

	public ArrayList<BankVO> getBank() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		ArrayList<BankVO> voList = new ArrayList<>();
		try {
			String sql = "SELECT * FROM BANK";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BankVO b = new BankVO();
				b.setBid(rs.getInt("bid"));
				b.setName(rs.getString("name"));
				b.setBalance(rs.getInt("balance"));
				voList.add(b);
			}
			System.out.println(voList);
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.disconnect(conn, pstmt);
		}
		return voList;
	}

	public boolean trans(int balance, int in, int out) {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false); // 오토커밋 해제
			String sql1 = "update bank set balance=balance-? where bid=?";
			String sql2 = "update bank set balance=balance+? where bid=?";

			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, balance);
			pstmt.setInt(2, out);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,balance);
			pstmt.setInt(2, in);
			pstmt.executeUpdate();

			String sql3 = "select balance from bank where bid=?";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, out);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) < 0) { // 잔액이 0미만이면,
				conn.rollback(); // 실패하면 이전상태로 되돌려야하니까 rollback;
				return false;
			} else {
				conn.commit(); // 성공하면 커밋;
			}

			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCP.disconnect(conn, pstmt);
		}

		return true;
	}

}
