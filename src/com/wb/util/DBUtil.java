package com.wb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	private static Connection conn = null;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		try{
			if(conn != null && conn.isClosed()){
				return conn;
			}else{
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/microblog", "root", "x5");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn,Statement stmt,PreparedStatement pstmt,ResultSet rs) {
		// ��Դ�ر�
		try {
			if(null != rs){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(null != stmt){
					stmt.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(null != stmt){
						stmt.close();
					}
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					try {
						if(null != conn){
							conn.close();
						}
					}catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
