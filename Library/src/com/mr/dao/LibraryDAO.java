package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.mr.actionForm.LibraryForm;
import com.mr.core.ConnDB;

public class LibraryDAO {
	private ConnDB conn = new ConnDB();
	public ArrayList<LibraryForm> query(LibraryForm libraryForm) {
		// TODO Auto-generated method stub
		ArrayList<LibraryForm> librarycoll = new ArrayList<>();
		String sql = null;
		sql = "select * from tb_library where id=1 ";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				libraryForm.setId(Integer.valueOf(rs.getString(1)));
                libraryForm.setLibraryname(rs.getString(2));
                libraryForm.setCurator(rs.getString(3));
                libraryForm.setTel(rs.getString(4));
                libraryForm.setAddress(rs.getString(5));
                libraryForm.setEmail(rs.getString(6));
                libraryForm.setUrl(rs.getString(7));
                libraryForm.setCreateDate(rs.getString(8));
                libraryForm.setIntroduce(rs.getString(9));
                librarycoll.add(libraryForm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return librarycoll;
	}
	public int update(LibraryForm libraryForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_library set libraryname='"+libraryForm.getLibraryname()+"',curator='"+libraryForm.getCurator()+"',tel='"+libraryForm.getTel()+"',address='"+libraryForm.getAddress()+"',email='"+libraryForm.getEmail()+"',url='"+libraryForm.getUrl()+"',createDate='"+libraryForm.getCreateDate()+"',introduce='"+libraryForm.getIntroduce()+"' where id=1";
		r = conn.executeUpdate(sql);
//		System.out.println("修改图书馆信息时的sql:"+sql);
		conn.close();
		return r;
	}

}
