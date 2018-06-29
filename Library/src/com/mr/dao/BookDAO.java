package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mr.actionForm.BookForm;
import com.mr.core.ConnDB;

public class BookDAO {
	private ConnDB conn=new ConnDB();
	public int insert(BookForm bookForm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_bookinfo where barcode='"+bookForm.getBarcode()+"' or bookname='"+bookForm.getBookname()+"'";
		ResultSet rs = conn.executeQuery(sql);
		String sql1 ="";
		int flag = 0;
		try {
			if(rs.next()){
				flag = 2;
			}else{
				sql1 = "insert into tb_bookinfo (barcode,bookname,typeid,author,ISBN,price,page,bookcase,intime,operator,del) values('"+bookForm.getBarcode()+"','"+bookForm.getBookname()+"',"+bookForm.getTypeid()+",'"+bookForm.getAuthor()+"','"+bookForm.getIsbn()+"',"+bookForm.getPrice()+","+bookForm.getPage()+","+bookForm.getBookcaseid()+",'"+bookForm.getInTime()+"','"+
			bookForm.getOperator()+"',"+bookForm.getDel()+")";
				flag = conn.executeUpdate(sql1);
//				System.out.println("添加图书信息的sql:"+sql1);
//				System.out.println("添加图书信息成功的标志:"+flag);
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

	public  ArrayList<BookForm> query(String str, BookForm bookForm) {
		// TODO Auto-generated method stub
		ArrayList<BookForm> bookcoll = new ArrayList<>();
		String sql = "";
		if(str == null|| str == ""||str == "all"){
			sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0";
		}else{
			sql ="select * from (select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0)  as "
					+ "book where book."+str+"'";
		}
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
					bookForm = new BookForm();
			        bookForm.setBarcode(rs.getString(1));
			        System.out.println("查询图书时的图书条形码："+rs.getString(1));
			        bookForm.setBookname(rs.getString(2));
			        bookForm.setTypeid(Integer.valueOf(rs.getInt(3)));
			        System.out.println("查询图书时的图书类型："+rs.getInt(3));
			        bookForm.setAuthor(rs.getString(4));
			        bookForm.setIsbn(rs.getString(5));
			        bookForm.setPrice(Double.valueOf(rs.getString(6)));  //此处必须进行类型转换
			        bookForm.setPage(Integer.valueOf(rs.getInt(7)));
			        bookForm.setBookcaseid(rs.getInt(8));
			        bookForm.setInTime(rs.getString(9));
			        bookForm.setOperator(rs.getString(10));        
			        bookForm.setDel(rs.getInt(11));     
			        bookForm.setId(Integer.valueOf(rs.getString(12)));
			        bookForm.setBookcaseName(rs.getString(13));
			        bookForm.setPublishing(rs.getString(14));
			        bookForm.setTypename(rs.getString(15));
			        bookcoll.add(bookForm);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return bookcoll;
	}

	public BookForm query_update(BookForm bookForm) {
		// TODO Auto-generated method stub
		BookForm bookForm1 = null;
		String sql = "";
		sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.id="+bookForm.getId()+"";
//		System.out.println("修改图书信息时的SQL："+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				bookForm1 = new BookForm();
				bookForm1.setBarcode(rs.getString(1));       
		        bookForm1.setBookname(rs.getString(2));
		        bookForm1.setTypeid(rs.getInt(3));
		        bookForm1.setAuthor(rs.getString(4));
		        bookForm1.setIsbn(rs.getString(5));
		        bookForm1.setPrice(Double.valueOf(rs.getString(6)));  //此处必须进行类型转换
		        bookForm1.setPage(rs.getInt(7));
		        bookForm1.setBookcaseid(rs.getInt(8));
		        bookForm1.setInTime(rs.getString(9));
		        bookForm1.setOperator(rs.getString(10));        
		        bookForm1.setDel(rs.getInt(11));     
		        bookForm1.setId(Integer.valueOf(rs.getString(12)));
		        bookForm1.setBookcaseName(rs.getString(13));
		        bookForm1.setPublishing(rs.getString(14));
		        bookForm1.setTypename(rs.getString(15));
//	            System.out.println("修改图书信息时图书名："+rs.getString(2));
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return bookForm1;
	}

	public int update(BookForm bookForm) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "update tb_bookinfo set barcode='"+bookForm.getBarcode()+"',bookname='"+bookForm.getBookname()+"',typeid="+bookForm.getTypeid()+",author='"+bookForm.getAuthor()+"',ISBN='"+bookForm.getIsbn()+"',price="+bookForm.getPrice()+",page="+bookForm.getPage()+",bookcase="+bookForm.getBookcaseid()+",intime='"+bookForm.getInTime()+"',operator='"+bookForm.getOperator()+"',del="+bookForm.getDel()+" where id="+bookForm.getId()+"";
		r = conn.executeUpdate(sql);
//		System.out.println("修改图书信息时的sql:"+sql);
//		System.out.println("修改图书信息成功的标志："+r);
		conn.close();
		return r;
	}

	public int delete(BookForm bookForm) {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from tb_bookinfo where id="+bookForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
		try{
			if(rs.next()){
				String sql1 = "update tb_bookinfo set del=1 where id="+bookForm.getId()+"";
				flag = conn.executeUpdate(sql1);
//				System.out.println("删除图书信息时的sql:"+sql1);
//				System.out.println("修改图书信息成功的标志："+flag);
			}
		}catch(Exception e){
			System.out.println("删除图书信息时产生的错误："+e.getMessage());
		}finally{
			conn.close();
		}
		return flag;
	}

	public BookForm bookBorrow(String f, String key) {
		// TODO Auto-generated method stub
		BookForm bookForm = null;
		String sql = "select * from (select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0)  as "
				+ "book where book."+f+"='"+key+"'";
//		System.out.println("图书借阅时的SQL："+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				bookForm = new BookForm();
				bookForm.setBarcode(rs.getString(1));       
		        bookForm.setBookname(rs.getString(2));
		        bookForm.setTypeid(rs.getInt(3));
		        bookForm.setAuthor(rs.getString(4));
		        bookForm.setIsbn(rs.getString(5));
		        bookForm.setPrice(Double.valueOf(rs.getString(6)));  //此处必须进行类型转换
		        bookForm.setPage(rs.getInt(7));
		        bookForm.setBookcaseid(rs.getInt(8));
		        bookForm.setInTime(rs.getString(9));
		        bookForm.setOperator(rs.getString(10));        
		        bookForm.setDel(rs.getInt(11));     
		        bookForm.setId(Integer.valueOf(rs.getString(12)));
		        bookForm.setBookcaseName(rs.getString(13));
		        bookForm.setPublishing(rs.getString(14));
		        bookForm.setTypename(rs.getString(15));
//	            System.out.println("图书借阅时图书名："+rs.getString(2));
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			conn.close();
		}
		return bookForm;
	}

	
}
