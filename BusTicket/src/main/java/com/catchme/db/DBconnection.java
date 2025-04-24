package com.catchme.db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.io.File;
public class DBconnection {

	
	public static Connection getConnection() throws SQLException{
		
		String url="";
		String username="";
		String password="";
		
		
		try {
			//load the properties file
			File configFile= new File("C:\\Users\\Priyanga\\git\\BusTicket\\BusTicket\\db.config");
			Properties prop= new Properties();
			prop.load(new FileInputStream(configFile));
			
			//extract the db credentials from the config file
			url= prop.getProperty("db_url");
			username= prop.getProperty("db_username");
			password= prop.getProperty("db_password");
			
			//check if any properties are missing
			if(url==null || username==null || password==null) {
				throw new SQLException("Missing database configuration properties");
			}
			
			
			
		}catch(IOException e) {
			System.out.println("current wd: "+ System.getProperty("user.dir"));
			e.printStackTrace();
			throw new SQLException("Failed to load database configuration");
		}
		
		try {
			//load the mysql jdbc driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			throw new SQLException("MYSQLjdbc driver not found", e);
		}
		
		return DriverManager.getConnection(url,username, password);
	}
}
