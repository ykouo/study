package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC {
	
	// 연결
	public static Connection connect() { // connect()라는 메서드는 Connection이라는 객체를 리턴하는데 목표가 있으므로 
		Connection conn = null; // scope를 맞춰주기 위해 try문 밖에 선언한다. 	
		String Driver ="oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@loacalhost:1521:xe";
		String user = "kim";
		String password ="1234";
		
		try {
		Class.forName(Driver);
		conn = DriverManager.getConnection(url, user, password);
		
		}catch(Exception e) {
			System.out.println("connect()출력");
			e.printStackTrace();
		}
		return conn; // Connection을 리턴하는게 목표 
	}
	
	// 연결종료
	public static void disconnect(Connection conn, PreparedStatement pstmt) {
	// disconnect()메서드는 Connection과 PreparedStatement를 종료시키는 데 목적이 있기때문에
	// 인자로 받아와서 
		try {
			pstmt.close();	// 종료 시켜준다.
			conn.close();
		}catch(Exception e) {
			System.out.println("disconnect()출력");
			e.printStackTrace();
		}
	
	}
	

}
