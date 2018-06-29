package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mr.actionForm.BookTypeForm;
import com.mr.core.ConnDB;

public class BookTypeDAO {

	private ConnDB conn=new ConnDB();
	public int delete(BookTypeForm bookTypeForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from tb_bookinfo where typeid="+bookTypeForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		try{
			if(!rs.next()){
				String sql1 = "delete from tb_bookType where id="+bookTypeForm.getId()+"";
				flag = conn.executeUpdate(sql1);
				System.out.println("删除读者类型信息时的sql:"+sql1);
				System.out.println("删除读者类型信息成功的标志："+flag);
			}
		}catch(Exception e){
			System.out.println("删除读者类型信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}

	public int update(BookTypeForm bookTypeForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_bookType set typename='"+bookTypeForm.getTypeName()+"',days="+bookTypeForm.getDays()+" where id="+bookTypeForm.getId()+"";
		r = conn.executeUpdate(sql);
		System.out.println("修改读者类型信息时的sql:"+sql);
		System.out.println("修改读者类型信息成功的标志："+r);
		conn.close();
		return r;
	}

	public Object query_update(BookTypeForm bookTypeForm) {
		// TODO Auto-generated method stub
		BookTypeForm bookTypeForm1 = null;
		String sql = "";
		sql = "select * from tb_bookType where id="+bookTypeForm.getId()+"";
		System.out.println("修改读者类型信息时的SQL："+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				 bookTypeForm1=new BookTypeForm();
				 bookTypeForm1.setId(Integer.valueOf(rs.getString(1)));
		         bookTypeForm1.setTypeName(rs.getString(2));
		         bookTypeForm1.setDays(rs.getInt(3));         
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return bookTypeForm1;
	}

	public ArrayList<BookTypeForm> query(String str, BookTypeForm bookTypeForm) {
		// TODO Auto-generated method stub
		ArrayList<BookTypeForm> bookTypecoll = new ArrayList<>();
		String sql = null;
		if(str == null|| str == ""||str == "all"){
			sql = "select * from tb_bookType";
		}else{
			sql ="select * from tb_bookType where typename='"+str+"'";
		}
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				bookTypeForm = new BookTypeForm();
				bookTypeForm.setId(Integer.valueOf(rs.getString(1)));
	            bookTypeForm.setTypeName(rs.getString(2));
	            bookTypeForm.setDays(rs.getInt(3));
	            bookTypecoll.add(bookTypeForm);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return bookTypecoll;
	}

	public int insert(BookTypeForm bookTypeForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_bookType where typename='"+bookTypeForm.getTypeName()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "insert into tb_bookType (typename,days) values('"+bookTypeForm.getTypeName()+"',"+bookTypeForm.getDays()+")";
				flag = conn.executeUpdate(sql1);
				System.out.println("添加读者类型信息的sql:"+sql1);
				System.out.println("添加读者类型信息成功的标志："+flag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag  = 0;
		}finally{
			conn.close();
		}
		return flag;
	}
	
}
