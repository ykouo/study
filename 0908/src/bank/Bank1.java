/*package bank;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Bank1 {
	private int bid;
	private String name;
	private int balance;

	
	public int getBid() {
		return bid;
	}

	public String getName() {
		return name;
	}

	public int getBalance() {
		return balance;
	}


	public void connect() {
		Connection conn = null;
		try {

			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			conn = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("여기는 connect() 안 ");
		}

	}

	public void disconnect(Connection conn, PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("여기는 disconnect() 안 ");
		}

	}

	public boolean trans(int bal) {
		connect();
		try {
			conn.setAutoCommit(false); // set autocommit==0;
			String sql1 = "UPDATE BANK1 SET BALANCE=BALANCE-? WHERE BID=1001";
			String sql2 = "UPDATE BANK2 SET BALANCE=BALANCE+? WHERE BID=2001";
			
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1,bal);
			pstmt.execut
		}
		return false;
	}
}
*/