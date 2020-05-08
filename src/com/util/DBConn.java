package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	private static Connection conn=null;
	
	private DBConn() {
		
	}
	
	public static Connection getConnection() {
		String url="jdbc:oracle:thin:@//127.0.0.1:1521/XE"; //12c이상  //로컬호스트로 작성해도 된다.
	//	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";  //11g
		String user="sky";
		String pwd="java$!";
		
		if(conn==null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver"); //자바 7.0부터 생략가능
				conn=DriverManager.getConnection(url,user,pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
	
	public static void close() {
		if(conn!=null) {
			try {
				if(!conn.isClosed()) {
					conn.close();
				}
			} catch (Exception e) {
			} //여기서는 예외 안찍어도 된다. 어차피 없앨거여서.
		}
		conn=null;
	}
}
