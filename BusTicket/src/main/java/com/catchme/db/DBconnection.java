package com.catchme.db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class DBconnection {

	private static final String URL="jdbc:mysql://localhost:3306/busticket?useSSL=false&serverTimezone=UTC";
	private static final String USERNAME="root";
	private static final String PASSWORD="197768Std";
	
	public static Connection getConnection() throws SQLException{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return DriverManager.getConnection(URL,USERNAME, PASSWORD);
	}
}
