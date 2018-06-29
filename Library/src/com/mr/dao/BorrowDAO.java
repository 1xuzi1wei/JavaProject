package com.mr.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mr.actionForm.BookForm;
import com.mr.actionForm.BorrowForm;
import com.mr.actionForm.ReaderForm;
import com.mr.core.ConnDB;

public class BorrowDAO {
	ConnDB conn = new ConnDB();

	public ArrayList<BorrowForm> bookBorrowSort() {
		// TODO Auto-generated method stub
		BorrowForm borrowForm = null;
		ArrayList<BorrowForm> coll = new ArrayList<BorrowForm>();
		String sql = "select * from (select bookid,count(bookid) as degree from tb_borrow group by bookid) as borr join (select b.*,c.name as bookcaseName,p.pubname,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0) as book on borr.bookid=book.id order by borr.degree desc limit 10 ";
//		System.out.println("图书借阅排行："+sql);
		 ResultSet rs = conn.executeQuery(sql);
		  try {
	            while (rs.next()) {
	                borrowForm = new BorrowForm();
	                borrowForm.setBookId(rs.getInt(1));
	                borrowForm.setDegree(rs.getInt(2));
	                borrowForm.setBookBarcode(rs.getString(3));
	                borrowForm.setBookName(rs.getString(4));
	                borrowForm.setAuthor(rs.getString(6));
	                borrowForm.setPrice(Double.valueOf(rs.getString(8)));
	          
	                borrowForm.setBookcaseName(rs.getString(15));
	                borrowForm.setPubName(rs.getString(16));
	                borrowForm.setBookType(rs.getString(17));
	                coll.add(borrowForm);
//	                System.out.println("图书借阅的书名："+rs.getString(4));
	            }
	        } catch (SQLException e) {
	            System.out.println(e.getMessage());
	        }finally{
		        conn.close();
	        }
	        return coll;
	    }

	public ArrayList<BorrowForm> borrowinfo(String str) {
		// TODO Auto-generated method stub
	    String sql="select borr.*,book.bookname,book.price,pub.pubname,bs.name,r.barcode from (select * from tb_borrow where ifback=0) as borr left join tb_bookinfo book on borr.bookid=book.id join tb_publishing pub on book.ISBN=pub.ISBN join tb_bookcase bs on book.bookcase=bs.id join tb_reader r on borr.readerid=r.id where r.barcode='"+str+"'";
		ResultSet rs = conn.executeQuery(sql);
		ArrayList<BorrowForm> coll = new ArrayList<BorrowForm>();
		BorrowForm borrowForm = null;
		try {
			while(rs.next()){
				borrowForm = new BorrowForm();
				borrowForm.setId(Integer.valueOf(rs.getInt(1)));
			    borrowForm.setBorrowTime(rs.getString(4));
			    borrowForm.setBackTime(rs.getString(5));
			    borrowForm.setBookName(rs.getString(8));
			    borrowForm.setPrice(Double.valueOf(rs.getDouble(9)));
			    borrowForm.setPubName(rs.getString(10));
			    borrowForm.setBookcaseName(rs.getString(11));
			    coll.add(borrowForm);
//			    System.out.println("借书的书名："+rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("借阅信息:"+e.getMessage());
		}finally{
			conn.close();
		}
//		System.out.println("借阅信息运行了");
		return coll;
	}

	public int insertBorrow(ReaderForm readerForm, BookForm bookForm, String operator) {
		// TODO Auto-generated method stub
		String sql = "select t.days from tb_bookinfo b left "
				+ "join tb_booktype t on b.typeid=t.id where b.id="+bookForm.getId()+"";
		ResultSet rs = conn.executeQuery(sql);
//		获取可借阅的天数
		int days = 0;
		int flag = 0;
		try {
			if(rs.next()){
				days = rs.getInt(1);
			}
			String borrowTime = null;	
			String backTime = null;
			Date borrowTime1 = new Date();
			borrowTime = DateFormat.getDateInstance().format(borrowTime1);
//			System.out.println("借阅的时间："+borrowTime);
			Date backTime1 = new Date();
			Long date = borrowTime1.getTime();
	        date += days*24*60*60*1000;
	        backTime1.setTime(date);
			backTime = DateFormat.getDateInstance().format(backTime1);
//	        System.out.println("归还的时间"+backTime);
	        String sql1 = "insert into tb_borrow(readerid,bookid,"
	        		+ "borrowTime,backTime,operator) values("+readerForm.getId()+","+
	        		bookForm.getId()+",'"+borrowTime+"','"+backTime+"','"+operator+"')";
			flag = conn.executeUpdate(sql1);
//			System.out.println("插入图书借阅信息的sql:"+sql1);
//			System.out.println("插入图书借阅信息成功的标志："+flag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}
        return flag;
	}

	public int renew(int id) {
		// TODO Auto-generated method stub
		String sql = "select bookid from tb_borrow where id="+id+"";
		ResultSet rs = conn.executeQuery(sql);
		int flag = 0;
		int days = 0;
			try {
					if(rs.next()){
					String borrowTime = null;	
					String backTime = null;
					Date borrowTime1 = new Date();
					borrowTime = DateFormat.getDateInstance().format(borrowTime1);
					System.out.println("图书续借时借阅的时间："+borrowTime);
					String sql1 = "select t.days from tb_bookinfo b left join tb_booktype t on b.typeid=t.id where b.id="+rs.getInt(1)+"";
				    ResultSet rs1 = conn.executeQuery(sql1);
				     if(rs1.next()){
				    	 days = rs1.getInt(1);
				     }
//				     System.out.println("允许借阅的天数："+days);
					Date backTime1 = new Date();
					Long date = borrowTime1.getTime();
			        date += days*24*60*60*1000;
			        backTime1.setTime(date);
			        backTime = DateFormat.getDateInstance().format(backTime1);
//				    System.out.println("图书续借时归还的时间："+backTime);
			        
				     String sql2 = "update tb_borrow set backTime='"+backTime+"'where id="+ id +"";
				     flag = conn.executeUpdate(sql2);
//				     System.out.println("更新借阅信息时的sql："+sql2);
//				     System.out.println("续借图书成功的标志："+flag);
					}
					} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
			conn.close();
			}
		return flag;
	}

	public int back(int id, String operator) {
		String sql = "select readerid,bookid from tb_borrow where id="+id+"";
		ResultSet rs = conn.executeQuery(sql);
		int flag = 0;
		try {
			if(rs.next()){
				String backTime = null;
				Date backTime1 = new Date();
				backTime = DateFormat.getDateInstance().format(backTime1);
//				System.out.println("图书归还的时间："+backTime);
                int readerid = rs.getInt(1);
                int bookid = rs.getInt(2);
                String sql1 = "insert into tb_giveback (readerid,bookid,backTime,"
                		+ "operator)values("+readerid+","+bookid+",'"+backTime+"','"+
                		operator+"')";
                int ret = conn.executeUpdate(sql1);
//                System.out.println("插入归还图书到表中成功的标志："+ret);
                if(ret == 1){
                	String sql2 = "update tb_borrow set ifback = 1 where id=" + id + "";
                	flag = conn.executeUpdate(sql2);
//                	System.out.println("归还图书成功的标志："+flag);
                }else{
                	flag=0;
                }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.close();
		}		
		return flag;
	}

	public  ArrayList<BorrowForm> bookRemind() {
		// TODO Auto-generated method stub
		String backTime = null;
		Date backTime1 = new Date();
		backTime = DateFormat.getDateInstance().format(backTime1);
//		System.out.println("图书归还的时间："+backTime);
		String sql="select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name as readername,r.barcode as readerbarcode from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid where borr.backTime <='"+backTime+"'";
		ResultSet rs = conn.executeQuery(sql);
//		System.out.println("到时提醒的SQL："+sql);
		ArrayList<BorrowForm> coll = new ArrayList<BorrowForm>();
		BorrowForm borrowForm = null;
		try {
			while(rs.next()){
				borrowForm = new BorrowForm();
			    borrowForm.setBorrowTime(rs.getString(1));
			    borrowForm.setBackTime(rs.getString(2));
			    borrowForm.setBookBarcode(rs.getString(3));
			    borrowForm.setBookName(rs.getString(4));
			    borrowForm.setReaderName(rs.getString(5));
			    borrowForm.setReaderBarcode(rs.getString(6));
			    coll.add(borrowForm);
//			    System.out.println("到期图书名称："+rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally{
			conn.close();
		}		
		return coll;
	}

	public ArrayList<BorrowForm> borrowQuery(String str) {
		// TODO Auto-generated method stub
		ArrayList<BorrowForm> coll = new ArrayList<BorrowForm>();
		String sql= "";
		if(str !="all" && str != null && str != ""){
			sql = "select * from (select borr.borrowTime,borr.backTime,"
					+ "book.barcode,book.bookname,r.name as readername,r.barcode "
					+ "as readerbarcode,borr.ifback from tb_borrow borr join "
					+ "tb_bookinfo book on book.id=borr.bookid join tb_reader "
					+ "r on r.id=borr.readerid) as borr where borr."+str+"";
		}else{
	        sql="select * from (select borr.borrowTime,borr.backTime,"
	        		+ "book.barcode,book.bookname,r.name as readername,r.barcode as "
	        		+ "readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo "
	        		+ "book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid) "
	        		+ "as borr";
		}
		ResultSet rs = conn.executeQuery(sql);
//		System.out.println("图书借阅查询的sql："+sql);
		BorrowForm borrowForm = null;
			try {
				while(rs.next()){
					borrowForm = new BorrowForm();
				    borrowForm.setBorrowTime(rs.getString(1));
				    borrowForm.setBackTime(rs.getString(2));
				    borrowForm.setBookBarcode(rs.getString(3));
				    borrowForm.setBookName(rs.getString(4));
				    borrowForm.setReaderName(rs.getString(5));
				    borrowForm.setReaderBarcode(rs.getString(6));
				    borrowForm.setIfBack(rs.getInt(7));
				    coll.add(borrowForm);
				 
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				conn.close();
			}	
		return coll;
	}
}
