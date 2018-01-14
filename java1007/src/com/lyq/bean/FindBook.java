package com.lyq.bean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FindBook {

	public FindBook() {
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
	public List<Book> findAll()
	{
		List<Book> list = new ArrayList<Book>();
		Connection con = getConnection();
		try {
			CallableStatement cs = con.prepareCall("{call findAllBook()}");
			ResultSet rs = cs.executeQuery();
			while(rs.next()){
				Book book = new Book();
				book.setId(rs.getInt("id"));
				// 对name属性赋值
				book.setName(rs.getString("name"));
				// 对price属性赋值
				book.setPrice(rs.getDouble("price"));
				// 对bookCount属性赋值
				book.setBookCount(rs.getInt("bookCount"));
				// 对author属性赋值
				book.setAuthor(rs.getString("author"));
				System.out.println("ssssssss");
				// 将图书对象添加到集合中
				list.add(book);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
