package com.mr.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mr.user.User;

public class UserDAO implements UserDAOImpl {
	private DataSource dataSource;
	@Override
	public void inserUser(User user) {
		// TODO Auto-generated method stub
		Integer id = user.getId();
		String name = user.getName();
		Integer age = user.getAge();//获取年龄
	    String sex = user.getSex();//获取性别
	    Connection con = null;
	    Statement stmt = null;
	    try {
			con = dataSource.getConnection();
			stmt = con.createStatement();
String sql = "insert into tb_user (id,name,age,sex) " 
        + "values('"+id+"','"+name+"','" + age + "','" + sex + "')";
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
		      if(stmt != null) {
	                 try {
	                     stmt.close();//关闭Statement对象
	                 }   
	                 catch(SQLException e) {
	                     e.printStackTrace();
	                 }
	             }
//	             if(con != null) {
//	                 try {
//	                     con.close();//关闭数据库连接
//	                 }
//	                 catch(SQLException e) {
//	                     e.printStackTrace();
//	                 }
//	             }
		}
	}
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

}
