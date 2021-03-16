package com.web.undefined.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresConnectionUtils {
	
	static final String jdbc_driver = "org.postgresql.Driver";
	static final String hostName = "localhost";
	static final String dbName = "demoUndefined";
	static final String userName = "postgres";
	static final String pass = "MyPost5678";
	
	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
		Class.forName(jdbc_driver);
		
		String connectionURL = "jdbc:postgresql://" + hostName + ":5432/" + dbName;
		
		Connection conn = DriverManager.getConnection(connectionURL,userName,pass);
		
//		Statement stmt = conn.createStatement();
		
		return conn;
	}
	
}
