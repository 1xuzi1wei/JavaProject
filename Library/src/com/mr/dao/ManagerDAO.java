package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mr.actionForm.ManagerForm;
import com.mr.core.ChStr;
import com.mr.core.ConnDB;

public class ManagerDAO {
	private ConnDB conn = new ConnDB();
//	管理员身份验证
	public int checkManager(ManagerForm managerForm){
		int flag = 0;
//		过滤危险字符
		ChStr chStr = new ChStr();
		String sql = "select * from tb_manager where name='"+
		chStr.filterStr(managerForm.getName())+"'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			if(rs.next()){
				String pwd = chStr.filterStr(managerForm.getPwd());
				if(pwd.equals(rs.getString("pwd"))){
					flag = 1;}else{
					flag = 0;
				}}else{
				flag = 0;
			}} catch (SQLException e) {
			flag = 0;
		}finally{
			conn.close();
		}
		return flag;		
	}
	
//	查询管理员列表
	public ArrayList<ManagerForm> query(String str,ManagerForm managerForm) {
		// TODO Auto-generated method stub
//		ManagerForm managerForm = null;
		ArrayList<ManagerForm> managercoll = new ArrayList<>();
		String sql = null;
		if(str == null|| str == ""||str == "all"){
			sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery "
					+ "from tb_manager m left join tb_purview p on m.id =p.id ";
		}else{
			sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery "
					+ "from tb_manager m left join tb_purview p on m.id =p.id where m.name='"+str+"'";
		}
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				managerForm = new ManagerForm();
				managerForm.setId(Integer.valueOf(rs.getString(1)));
				managerForm.setName(rs.getString(2));
				managerForm.setPwd(rs.getString(3));
				managerForm.setSysset(rs.getInt(4));
				managerForm.setReaderset(rs.getInt(5));
				managerForm.setBookset(rs.getInt(6));
	            managerForm.setBorrowback(rs.getInt(7));
	            managerForm.setSysquery(rs.getInt(8));
	            managercoll.add(managerForm);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return managercoll;
	}
//	添加数据
	public int insert(ManagerForm managerForm) {
		String sql = "select * from tb_manager where name='"+
		managerForm.getName()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "insert into tb_manager(name,pwd) values('"+managerForm.getName()
				+"','"+managerForm.getPwd()+"')";
				flag = conn.executeUpdate(sql1);
//				System.out.println("添加管理员信息的sql:"+sql1);
//				System.out.println("flag:"+flag);
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
//	设置管理员权限
	public int update(ManagerForm managerForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_purview where id="+managerForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				sql1 = "update tb_purview set sysset=" + managerForm.getSysset() +
                        ",readerset=" + managerForm.getReaderset() + ",bookset="+managerForm.getBookset()+",borrowback="+managerForm.getBorrowback()+",sysquery="+managerForm.getSysquery()+" where id=" +
                managerForm.getId() + "";
			}else{
				sql1="insert into tb_purview values("+managerForm.getId()+","+managerForm.getSysset()+","+managerForm.getReaderset()+","+managerForm.getBookset()+","+managerForm.getBorrowback()+","+managerForm.getSysquery()+")";				
			}
			flag = conn.executeUpdate(sql1);
//			System.out.println("修改数据时的sql:"+sql1);
//			System.out.println("管理员权限更新标志："+flag);
		} catch (SQLException e) {
			e.printStackTrace();
			flag  = 0;
		}finally{
			conn.close();
		}
		return flag;
	}
//	修改管理员权限并且更新
	public ManagerForm query_update(ManagerForm managerForm) {
		// TODO Auto-generated method stub
		ManagerForm managerForm1 = null;
		String sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,"
				+ "p.sysquery from tb_manager m left join tb_purview "
				+ "p on m.id = p.id where m.id="+managerForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				managerForm1 = new ManagerForm();
				managerForm1.setId(Integer.valueOf(rs.getString(1)));
				managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerForm1.setSysset(rs.getInt(4));
                managerForm1.setReaderset(rs.getInt(5));
                managerForm1.setBookset(rs.getInt(6));
                managerForm1.setBorrowback(rs.getInt(7));
                managerForm1.setSysquery(rs.getInt(8));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return managerForm1;
	}
//	查询权限信息
	public ManagerForm query_p(ManagerForm managerForm) {
		// TODO Auto-generated method stub
		ManagerForm managerForm1 = null;
		String sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id = p.id where m.name='"+managerForm.getName()+"'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				managerForm1 = new ManagerForm();
				managerForm1.setId(Integer.valueOf(rs.getString(1)));
				managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerForm1.setSysset(rs.getInt(4));
                managerForm1.setReaderset(rs.getInt(5));
                managerForm1.setBookset(rs.getInt(6));
                managerForm1.setBorrowback(rs.getInt(7));
                managerForm1.setSysquery(rs.getInt(8));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return managerForm1;
	}
//	删除数据
	public int delete(ManagerForm managerForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		try{
		String sql = "delete from tb_manager where id="+managerForm.getId()+"";
//		System.out.println("删除的管理员的id:"+managerForm.getId());
		flag = conn.executeUpdate(sql);
		if(flag != 0){
			String sql1 = "delete from tb_purview where id="+managerForm.getId()+"";
			conn.executeUpdate(sql1);
		}
//		System.out.println("删除管理员数据的标志："+flag);
		}catch(Exception e){
			System.out.println("删除管理员信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}
//	修改密码
	public int modifypwd(ManagerForm managerForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "update tb_manager set pwd='"+managerForm.getPwd()+"'where name='"+managerForm.getName()+"'";
		flag = conn.executeUpdate(sql);
//		System.out.println("修改管理员密码的sql："+sql);
		conn.close();
		return flag;
	}
//	修改密码时查询
	public ManagerForm pwdquery(ManagerForm managerForm) {
		// TODO Auto-generated method stub
		ManagerForm managerForm1 = null;
		String sql = "select * from tb_manager where name='"+managerForm.getName()+"'";
		ResultSet rs = conn.executeQuery(sql);
	     try {
	            while (rs.next()) {
	                managerForm1 = new ManagerForm();
	                managerForm1.setId(Integer.valueOf(rs.getString(1)));
	                managerForm1.setName(rs.getString(2));
	                managerForm1.setPwd(rs.getString(3));
//	                System.out.println("修改密码时的管理员姓名："+rs.getString(2));
	            }
	            
	        } catch (SQLException ex) {
	        	ex.printStackTrace();
	        }finally{
	        	conn.close();
	        }
	     
		return managerForm1;
	}
}
