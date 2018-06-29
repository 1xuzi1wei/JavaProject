package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mr.actionForm.ReaderTypeForm;
import com.mr.core.ConnDB;

public class ReaderTypeDAO {

	private ConnDB conn=new ConnDB();
	public int delete(ReaderTypeForm readerTypeForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from tb_reader where readertypeid="+readerTypeForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		try{
			if(!rs.next()){
				String sql1 = "delete from tb_readerType where id="+readerTypeForm.getId()+"";
				flag = conn.executeUpdate(sql1);
//				System.out.println("删除读者类型信息时的sql:"+sql1);
//				System.out.println("删除读者类型信息成功的标志："+flag);
			}
		}catch(Exception e){
			System.out.println("删除读者类型信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}

	public int update(ReaderTypeForm readerTypeForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_readerType set typename='"+readerTypeForm.getName()+"',number="+readerTypeForm.getNumber()+" where id="+readerTypeForm.getId()+"";
		r = conn.executeUpdate(sql);
//		System.out.println("修改读者类型信息时的sql:"+sql);
//		System.out.println("修改读者类型信息成功的标志："+r);
		conn.close();
		return r;
	}

	public Object query_update(ReaderTypeForm readerTypeForm) {
		// TODO Auto-generated method stub
		ReaderTypeForm readerTypeForm1 = null;
		String sql = "";
		sql = "select * from tb_readerType where id="+readerTypeForm.getId()+"";
//		System.out.println("修改读者类型信息时的SQL："+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				readerTypeForm1=new ReaderTypeForm();
	            readerTypeForm1.setId(Integer.valueOf(rs.getString(1)));
	            readerTypeForm1.setName(rs.getString(2));
	            readerTypeForm1.setNumber(rs.getInt(3));
//	            System.out.println("修改读者类型信息时的id:"+rs.getString(1));
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return readerTypeForm1;
	}

	public ArrayList<ReaderTypeForm> query(String str, ReaderTypeForm readerTypeForm) {
		// TODO Auto-generated method stub
		ArrayList<ReaderTypeForm> readerTypecoll = new ArrayList<>();
		String sql = null;
		if(str == null|| str == ""||str == "all"){
			sql = "select * from tb_readerType";
		}else{
			sql ="select * from tb_readerType where typename='"+str+"'";
		}
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				readerTypeForm=new ReaderTypeForm();
				readerTypeForm.setId(Integer.valueOf(rs.getString(1)));
	            readerTypeForm.setName(rs.getString(2));
	            readerTypeForm.setNumber(rs.getInt(3));
	            readerTypecoll.add(readerTypeForm);	
//	            System.out.println("查找的读者类型的id:"+rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return readerTypecoll;
	}

	public int insert(ReaderTypeForm readerTypeForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_readertype where typename='"+readerTypeForm.getName()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "insert into tb_readertype (typename,number) values('"+readerTypeForm.getName()+"',"+readerTypeForm.getNumber()+")";
       				flag = conn.executeUpdate(sql1);
//				System.out.println("添加读者类型信息的sql:"+sql1);
//				System.out.println("添加读者类型信息成功的标志："+flag);
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
