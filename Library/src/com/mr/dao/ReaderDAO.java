package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mr.actionForm.ReaderForm;
import com.mr.core.ConnDB;

public class ReaderDAO {
	private ConnDB conn=new ConnDB();
	public int insert(ReaderForm readerForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reader where barcode='"+readerForm.getBarcode()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "Insert into tb_reader (name,sex,barcode,vocation,birthday,paperType,paperNO,tel,email,createDate,operator,remark,readertypeid) values('"+readerForm.getName()+"','"+readerForm.getSex()+"','"+readerForm.getBarcode()+"','"+readerForm.getVocation()+"','"+readerForm.getBirthday()+"','"+readerForm.getPaperType()+"','"+readerForm.getPaperNO()+"','"+readerForm.getTel()+"','"+readerForm.getEmail()+"','"+readerForm.getCreateDate()+"','"+readerForm.getOperator()+"','"+readerForm.getRemark()+"',"+readerForm.getReadertypeid()+")";
				flag = conn.executeUpdate(sql1);
//				System.out.println("添加读者信息的sql:"+sql1);
//				System.out.println("添加读者信息成功的标志:"+flag);
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

	public ArrayList<ReaderForm> query(String str, ReaderForm readerForm) {
		// TODO Auto-generated method stub
		ArrayList<ReaderForm> readercoll = new ArrayList<>();
		String sql = null;
		if(str == null|| str == ""||str == "all"){
			sql = "select r.*,t.typename,t.number from tb_reader r left join tb_readerType t on r.readertypeid=t.id";
		}else{
			sql ="select r.*,t.typename,t.number from tb_reader r left join tb_readerType t on r.readertypeid=t.id where r.name='"+str+"'";
		}
//		System.out.println("查询读者档案信息的sql:"+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				readerForm=new ReaderForm();
				readerForm.setId(Integer.valueOf(rs.getString(1)));
				readerForm.setName(rs.getString(2));
	            readerForm.setSex(rs.getString(3));
	            readerForm.setBarcode(rs.getString(4));
	            readerForm.setVocation(rs.getString(5));
	            readerForm.setBirthday(rs.getString(6));
	            readerForm.setPaperType(rs.getString(7));
	            readerForm.setPaperNO(rs.getString(8));
	            readerForm.setTel(rs.getString(9));
	            readerForm.setEmail(rs.getString(10));
	            readerForm.setCreateDate(rs.getString(11));
	            readerForm.setOperator(rs.getString(12));
	            readerForm.setRemark(rs.getString(13));
	            readerForm.setReadertypeid(rs.getInt(14));
	            readerForm.setTypename(rs.getString(15));
	            readerForm.setNumber(rs.getInt(16));
	            readercoll.add(readerForm);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return readercoll;
	}

	public ReaderForm query_update(ReaderForm readerForm) {
		// TODO Auto-generated method stub
		ReaderForm readerForm1 = null;
		String sql = "";
		if(readerForm.getId() != null){
			sql ="select r.*,t.typename,t.number from tb_reader r left join tb_readerType t on r.readertypeid=t.id where r.id="+readerForm.getId()+"";
		}else if(readerForm.getBarcode() != null){
			sql ="select r.*,t.typename,t.number from tb_reader r left join tb_readerType t on r.readertypeid=t.id where r.barcode='"+readerForm.getBarcode()+"'";
		}
//		System.out.println("修改读者信息时的SQL："+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				readerForm1=new ReaderForm();
	            readerForm1.setId(Integer.valueOf(rs.getString(1)));
	            readerForm1.setName(rs.getString(2));
	            readerForm1.setSex(rs.getString(3));
	            readerForm1.setBarcode(rs.getString(4));
	            readerForm1.setVocation(rs.getString(5));
	            readerForm1.setBirthday(rs.getString(6));
	            readerForm1.setPaperType(rs.getString(7));
	            readerForm1.setPaperNO(rs.getString(8));
	            readerForm1.setTel(rs.getString(9));
	            readerForm1.setEmail(rs.getString(10));
	            readerForm1.setCreateDate(rs.getString(11));
	            readerForm1.setOperator(rs.getString(12));
	            readerForm1.setRemark(rs.getString(13));
	            readerForm1.setReadertypeid(rs.getInt(14));
	            readerForm1.setTypename(rs.getString(15));
	            readerForm1.setNumber(rs.getInt(16));
//	            System.out.println("读者信息的名字:"+rs.getString(2));
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return readerForm1;
	}

	public int update(ReaderForm readerForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_reader set sex='"+readerForm.getSex()+"',barcode='"+readerForm.getBarcode()+"',vocation='"+readerForm.getVocation()+"',birthday='"+readerForm.getBirthday()+"',paperType='"+readerForm.getPaperType()+"',paperNO='"+readerForm.getPaperNO()+"',tel='"+readerForm.getTel()+"',email='"+readerForm.getEmail()+"',remark='"+readerForm.getRemark()+"',readertypeid="+readerForm.getReadertypeid()+" where id="+readerForm.getId()+"";
		r = conn.executeUpdate(sql);
//		System.out.println("修改读者信息时的sql:"+sql);
//		System.out.println("修改读者信息成功的标志："+r);
		conn.close();
		return r;
	}


	public int delete(ReaderForm readerForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from tb_reader where id="+readerForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		try{
			if(rs.next()){
				String sql1 = "delete from tb_reader where id="+readerForm.getId()+"";
				flag = conn.executeUpdate(sql1);
//				System.out.println("删除读者信息时的sql:"+sql1);
//				System.out.println("删除读者信息成功的标志："+flag);
			}
		}catch(Exception e){
			System.out.println("删除读者信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}

}
