package com.lyq.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class Batch {

	public Batch() {
		// TODO Auto-generated constructor stub
	}
	public Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/db_database10?useUnicode=true&characterEncoding=utf-8&useSSL=false";
			String user = "root";
			String password = "1234";
			try {
				con = DriverManager.getConnection(url, user, password);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
return con;
	}
	public int saveBatch(){
		int row = 0;
		Connection con = getConnection();
		String sql = "insert into tb_student_batch(id,name,sex,age)values(?,?,?,?)";
		Random random = new Random();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			for(int i=0;i<10;i++)
			{
				ps.setInt(1, i+1);
				ps.setString(2, "Ñ§Éú"+i);
				ps.setBoolean(3, i%2==0?true:false);
				ps.setInt(4, random.nextInt(5)+10);
				ps.addBatch();
			}
			int[] rows = ps.executeBatch();
			row = rows.length;
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

}
