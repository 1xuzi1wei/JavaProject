package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.mr.actionForm.ParameterForm;
import com.mr.core.ConnDB;

public class ParameterDAO {
	private ConnDB conn = new ConnDB();
//	参数查询
	public ParameterForm query(ParameterForm parameterForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_parameter where id=1";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				parameterForm.setId(Integer.valueOf(rs.getString(1)));
				parameterForm.setCost(rs.getInt(2));
				parameterForm.setValidity(rs.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}finally{
			conn.close();
		}
		return parameterForm;
	}
//	更新参数
	public int update(ParameterForm parameterForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql ="update tb_parameter set cost="+parameterForm.getCost()+",validity="+parameterForm.getValidity()+" where id = 1";
		flag = conn.executeUpdate(sql);
//		System.out.println("修改参数设置信息时的sql："+sql);
//		System.out.println("修改参数设置成功的标志："+flag);
		conn.close();
		return flag;
	}

}
