package com.catchme.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

public class DBconnection {

    public static Connection getConnection() throws SQLException {
        String url = "";
        String username = "";
        String password = "";

        try (InputStream input = DBconnection.class.getClassLoader().getResourceAsStream("db.config")) {
            if (input == null) {
                throw new IOException("db.config not found in classpath");
            }
            
            System.out.println("Classloader path: " + DBconnection.class.getClassLoader().getResource("db.config"));

            Properties prop = new Properties();
            prop.load(input);

            url = prop.getProperty("db_url");
            username = prop.getProperty("db_username");
            password = prop.getProperty("db_password");

            if (url == null || username == null || password == null) {
                throw new SQLException("Missing database configuration properties");
            }

        } catch (IOException e) {
            System.out.println("current wd: " + System.getProperty("user.dir"));
            e.printStackTrace();
            throw new SQLException("Failed to load database configuration", e);
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found", e);
        }

        return DriverManager.getConnection(url, username, password);
    }
}
