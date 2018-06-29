package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mr.actionForm.BookCaseForm;
import com.mr.core.ConnDB;

public class BookCaseDAO {
	private ConnDB conn=new ConnDB();

	public int insert(BookCaseForm bookCaseForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_bookCase where name='"+bookCaseForm.getName()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "insert into tb_bookCase (name)values('"+bookCaseForm.getName()+"')";
				flag = conn.executeUpdate(sql1);
//				System.out.println("添加书架信息的sql:"+sql1);
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

	public ArrayList<BookCaseForm> query(String str, BookCaseForm bookCaseForm) {
		// TODO Auto-generated method stub
		ArrayList<BookCaseForm> bookCasecoll = new ArrayList<>();
		String sql = null;
		if(str == null|| str == ""||str == "all"){
			sql = "select * from tb_bookcase";
		}else{
			sql ="select * from tb_bookcase where name='"+str+"'";
		}
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				bookCaseForm = new BookCaseForm();
				bookCaseForm.setId(Integer.valueOf(rs.getString(1)));
				bookCaseForm.setName(rs.getString(2));
				bookCasecoll.add(bookCaseForm);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return bookCasecoll;
	}

	public BookCaseForm  query_update(BookCaseForm bookCaseForm) {
		// TODO Auto-generated method stub
		BookCaseForm bookCaseForm1 = null;
		String sql = "select m.* from tb_bookCase m where m.id="+bookCaseForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		
		try {
			while(rs.next()){
				bookCaseForm1 = new BookCaseForm();
				bookCaseForm1.setId(Integer.valueOf(rs.getString(1)));
				bookCaseForm1.setName(rs.getString(2));
             			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return bookCaseForm1;
	}

	public int update(BookCaseForm bookCaseForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_bookCase set name='"+bookCaseForm.getName()+"' where id="+bookCaseForm.getId()+"";
		r = conn.executeUpdate(sql);
//		System.out.println("修改书架信息时的sql:"+sql);
//		System.out.println("修改书架信息成功的标志："+r);
		conn.close();
		return r;
	}

	public int delete(BookCaseForm bookCaseForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from tb_bookCase where id="+bookCaseForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		try{
			if(rs.next()){
				String sql1 = "delete from tb_bookCase where id="+bookCaseForm.getId()+"";
				flag = conn.executeUpdate(sql1);
//				System.out.println("删除书架信息时的sql:"+sql1);
//				System.out.println("删除书架成功的标志："+flag);
			}
		}catch(Exception e){
			System.out.println("删除书架信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}
}
