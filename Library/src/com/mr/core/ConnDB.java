package com.mr.core;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnDB {
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;
//	从指定资源文件保存的位置
	private static String propFileName = "/com/mr/connDB.properties";
//	创建并实例化Properties对象的实例
	private static Properties prop = new Properties();
//	定义保存数据库驱动的变量
	private static String dbClassName ="com.mysql.jdbc.Driver";
	private static String dbUrl =
	      "jdbc:mysql://localhost:3306/db_librarySys?user=root&password=1234&useUnicode=true";
	
	public ConnDB(){
//		将Properties文件读取到InputStream对象中
		InputStream in = getClass().getResourceAsStream(propFileName);
		try {
//			通过输入流对象加载Properties
			prop.load(in);
//			获取数据库的驱动
			dbClassName = prop.getProperty("DB_CLASS_NAME",dbClassName);
//			获取数据库连接的URL
			dbUrl = prop.getProperty("DB_URL", dbUrl);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
//	创建连接数据库的方法
	public static Connection getConnection(){
		Connection conn = null;
		try {
//			装载数据库的驱动
			Class.forName(dbClassName).newInstance();
//			建立与数据库URL中定义的数据库的连接
			try {
				conn = DriverManager.getConnection(dbUrl);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
//	执行查询语句
	public ResultSet executeQuery(String sql){
//		调用getConnection()方法创建Connection对象的一个实例conn
		conn = getConnection();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
//	执行更新操作
	public int executeUpdate(String sql){
//		初始化更新的行数
		int result = 0;
//		调用getConnection()方法创建Connection对象的一个实例conn
		conn = getConnection();
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
//			将返回值的变量赋为0
			result = 0;
		}
		return result;	
	}
//	关闭数据库的连接
	public void close(){

			try {
				if(rs != null){
				rs.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(conn != null){
					conn.close();
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
	}
}
