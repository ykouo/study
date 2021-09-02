package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC {

	public static Connection connect() {
		Connection conn = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "kim", "1234");

		}catch(Exception e) {
			System.out.println("connect()에서 출력");
			 e.printStackTrace();
		}

		return conn;
	}

	public static void disconnect(PreparedStatement pstmt, Connection conn) {
		try {
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("disconnect()에서출력");
			e.printStackTrace();
		}
	}


}