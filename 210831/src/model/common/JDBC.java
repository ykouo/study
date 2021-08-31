package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC {
	
	public static Connection connect() {
		Connection conn = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kim";
		String password="1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			
			
		}catch(Exception e) {
			System.out.println("connect()확인");
			e.printStackTrace();
		}
		return conn;	
	}
	
	public static void disconnect(Connection conn , PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("disconnect()확인");
			e.printStackTrace();
		}
		
		
	}
	

}
