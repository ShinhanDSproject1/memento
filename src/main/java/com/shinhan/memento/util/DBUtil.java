package com.shinhan.memento.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	
	public static Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userid = "memento", userpass = "memento";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, userid, userpass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void dbDisconnect(
			 Connection conn, Statement st, ResultSet rs) {
		
		try {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(conn!=null) conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static String buildDebugSQL(String sqlTemplate, Object... params) {
	    for (Object param : params) {
	        String val = (param instanceof String) ? "'" + param + "'" : String.valueOf(param);
	        sqlTemplate = sqlTemplate.replaceFirst("\\?", val);
	    }
	    return sqlTemplate;
	}
	
}





