package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mr.actionForm.PublishingForm;
import com.mr.core.ConnDB;

public class PublishingDAO {
	private ConnDB conn=new ConnDB();
	public ArrayList<PublishingForm> query(String str, PublishingForm publishingForm) {
		// TODO Auto-generated method stub
		ArrayList<PublishingForm> publishingcoll = new ArrayList<>();
		String sql = null;
		if(str == null|| str == ""||str == "all"){
			sql = "select * from tb_publishing";
		}else{
			sql ="select * from tb_publishing where pubname='"+str+"'";
		}
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				publishingForm = new PublishingForm();
				publishingForm.setIsbn(rs.getString(1));
				publishingForm.setPubname(rs.getString(2));
	            publishingcoll.add(publishingForm);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return publishingcoll;
	}
	public int delete(PublishingForm publishingForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from tb_publishing where ISBN='"+publishingForm.getIsbn()+"'";
		ResultSet rs = conn.executeQuery(sql);
		try{
			if(rs.next()){
				String sql1 = "delete from tb_publishing where ISBN='"+publishingForm.getIsbn()+"'";
				flag = conn.executeUpdate(sql1);
				System.out.println("删除出版社信息时的sql:"+sql1);
//				System.out.println("删除出版社成功的标志："+flag);
			}
		}catch(Exception e){
			System.out.println("删除出版社信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}
	public int update(PublishingForm publishingForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_publishing set pubname='"+publishingForm.getPubname()+"'"+"where ISBN='"+publishingForm.getIsbn()+"'";
		r = conn.executeUpdate(sql);
//		System.out.println("修改出版社信息时的sql:"+sql);
//		System.out.println("修改出版社信息成功的标志："+r);
		conn.close();
		return r;
	}
	public int insert(PublishingForm publishingForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_publishing where pubname='"+publishingForm.getPubname()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "insert into tb_publishing (ISBN,pubname)values('"+publishingForm.getIsbn()+"','"+publishingForm.getPubname()+"')";
				flag = conn.executeUpdate(sql1);
//				System.out.println("添加出版社信息的sql:"+sql1);
//				System.out.println("添加出版社信息成功的标志："+flag);
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
	public PublishingForm query_update(PublishingForm publishingForm) {
		// TODO Auto-generated method stub
		PublishingForm publishingForm1 = null;
		String sql = "select m.* from tb_publishing m where m.ISBN='"+publishingForm.getIsbn()+"'";
		ResultSet rs = conn.executeQuery(sql);		
		try {
			while(rs.next()){
				publishingForm1 = new PublishingForm();
				publishingForm1.setIsbn(rs.getString(1));
				publishingForm1.setPubname(rs.getString(2));
             			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return publishingForm1;
	}
}
