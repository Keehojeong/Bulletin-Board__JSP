package db;

import java.sql.DriverManager;

import java.sql.Connection;

public class DBConnection {
	
	private static Connection conn = null;
	
	public static Connection getConnection() {
		try {
			if(conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mysql?serverTimezone=UTC&userSSL=false&characterEncoding=UTF-8&useSSL=false","root","dongyang");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
}