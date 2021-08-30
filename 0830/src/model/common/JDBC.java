package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC {
	
	// ����
	public static Connection connect() { // connect()��� �޼���� Connection�̶�� ��ü�� �����ϴµ� ��ǥ�� �����Ƿ� 
		Connection conn = null; // scope�� �����ֱ� ���� try�� �ۿ� �����Ѵ�. 	
		String Driver ="oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@loacalhost:1521:xe";
		String user = "kim";
		String password ="1234";
		
		try {
		Class.forName(Driver);
		conn = DriverManager.getConnection(url, user, password);
		
		}catch(Exception e) {
			System.out.println("connect()���");
			e.printStackTrace();
		}
		return conn; // Connection�� �����ϴ°� ��ǥ 
	}
	
	// ��������
	public static void disconnect(Connection conn, PreparedStatement pstmt) {
	// disconnect()�޼���� Connection�� PreparedStatement�� �����Ű�� �� ������ �ֱ⶧����
	// ���ڷ� �޾ƿͼ� 
		try {
			pstmt.close();	// ���� �����ش�.
			conn.close();
		}catch(Exception e) {
			System.out.println("disconnect()���");
			e.printStackTrace();
		}
	
	}
	

}
