package model.common;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCP {

	public static Connection connect() {
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
		return conn;
	}
	
	public static void disconnect(Connection conn , PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("여기는 disconnect() 안 ");
		}
		
	}

}
