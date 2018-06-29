package com.mr.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mr.actionForm.BookForm;
import com.mr.actionForm.BorrowForm;
import com.mr.actionForm.ReaderForm;
import com.mr.dao.BookDAO;
import com.mr.dao.BorrowDAO;
import com.mr.dao.ReaderDAO;

/**
 * Servlet implementation class Borrow
 */
@WebServlet("/borrow")
public class Borrow extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BorrowDAO borrowDAO = null;
    private ReaderDAO readerDAO = null;
    private BookDAO bookDAO = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Borrow() {
        super();
        // TODO Auto-generated constructor stub
        this.borrowDAO = new BorrowDAO();
        this.readerDAO = new ReaderDAO();
        this.bookDAO = new BookDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action =request.getParameter("action");
		if(action == null ||"".equals(action)){
			request.setAttribute("error","您的操作有误！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else if("bookBorrowSort".equals(action)){
			bookBorrowSort(request,response);
			
		}else if("bookBorrow".equals(action)){
//			图书借阅
			bookBorrow(request,response);
		}else if("bookRenew".equals(action)){
//			图书续借
			bookRenew(request,response);
			
		}else if("bookBack".equals(action)){
//			图书归还
			bookBack(request,response);
			
		}else if("bookRemind".equals(action)){
//			借阅到期提醒
			bookRemind(request,response);
			
		}else if("borrowQuery".equals(action)){
//			借阅信息查询
			borrowQuery(request,response);
        }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void borrowQuery(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		单一条件查询
		String str = null;
		String flag[] = request.getParameterValues("flag");
		if(flag != null){
			String aa = flag[0];
			if("a".equals(aa)){
				if(request.getParameter("f") != null){
					str = request.getParameter("f")+" like'%"+request.getParameter("key")+"%'";	
//					System.out.println("条件查询:"+str);
				}
			}
			if("b".equals(aa)){
				String startTime = request.getParameter("startTime");
				String endTime = request.getParameter("endTime");
				if(startTime != null && endTime != null){
					str = "borrowTime between '" + startTime +"'and '"+ endTime +"'";
				}
//				System.out.println("日期查询："+str);
			}
//			同时选择日期和条件进行查询
			if(flag.length == 2){
				if(request.getParameter("f") != null){
					str = request.getParameter("f")+" like'%"+request.getParameter("key")+"%'";
				}
//				System.out.println("选择日期和条件一起进行查询");
				String startTime = request.getParameter("startTime");
				String endTime = request.getParameter("endTime");
				String str1 = null;
				if(startTime != null && endTime != null){
					 str1 = "borrowTime between '" + startTime +"'and '"+ endTime +"'";
				}
				str = str +"and borr."+str1;
//				System.out.println("条件和日期："+str);				
			}			
		}
//		System.out.println("条件查询图书借阅信息时的str:"+str);
		request.setAttribute("borrowQuery", borrowDAO.borrowQuery(str));
		request.getRequestDispatcher("borrowQuery.jsp").forward(request, response);
	}
//	到期提醒
	private void bookRemind(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("bookRemind", borrowDAO.bookRemind());
		request.getRequestDispatcher("bookRemind.jsp").forward(request, response);
	}

	private void bookBack(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
//		获取读者的条形码
		readerForm.setBarcode(request.getParameter("barcode"));
		ReaderForm readerForm1 =(ReaderForm) readerDAO.query_update(readerForm);
		request.setAttribute("readerinfo", readerForm1);
		ArrayList<BorrowForm> coll = borrowDAO.borrowinfo(request.getParameter("barcode"));
//		查询读者借阅信息
		request.setAttribute("borrowinfo",coll);
		if(request.getParameter("id") != null){
			int id = Integer.parseInt(request.getParameter("id"));
			String operator = request.getParameter("operator");
			if(id > 0){
				int ret = borrowDAO.back(id,operator);
				if(ret == 0){
					request.setAttribute("error", "图书归还失败！");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}else{
					request.setAttribute("bar", request.getParameter("barcode"));
					request.getRequestDispatcher("bookBack_ok.jsp").forward(request, response);
				}
			}
	}else{
		request.getRequestDispatcher("bookBack.jsp").forward(request, response);
	}
	}

	private void bookRenew(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
//		获取读者的条形码
		readerForm.setBarcode(request.getParameter("barcode"));
		ReaderForm readerForm1 =(ReaderForm) readerDAO.query_update(readerForm);
		request.setAttribute("readerinfo", readerForm1);
		ArrayList<BorrowForm> coll = borrowDAO.borrowinfo(request.getParameter("barcode"));
//		查询读者借阅信息
		request.setAttribute("borrowinfo",coll);
		if(request.getParameter("id") != null){
			int id = Integer.parseInt(request.getParameter("id"));
			if(id > 0){
				int ret = borrowDAO.renew(id);
				if(ret == 0){
					request.setAttribute("error", "图书续借失败！");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}else{
					request.setAttribute("bar", request.getParameter("barcode"));
					request.getRequestDispatcher("bookRenew_ok.jsp").forward(request, response);
				}
			}
		}else{
			request.getRequestDispatcher("bookRenew.jsp").forward(request, response);
		}
	}

	private void bookBorrow(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
//		获取读者的条形码
		readerForm.setBarcode(request.getParameter("barcode"));
		ReaderForm readerForm1 =(ReaderForm) readerDAO.query_update(readerForm);
		request.setAttribute("readerinfo", readerForm1);
		ArrayList<BorrowForm> coll = borrowDAO.borrowinfo(request.getParameter("barcode"));
//		查询读者借阅信息
		request.setAttribute("borrowinfo",coll);
//		获取查询方式
		String f = request.getParameter("f");
		String key = request.getParameter("inputkey");
		if(key != null && !key.equals("")){
//			获取操作员
			String operator = request.getParameter("operator");
			BookForm bookForm = bookDAO.bookBorrow(f,key);
			if(bookForm != null){
				int ret = borrowDAO.insertBorrow(readerForm1,bookForm,operator);
				if (ret == 1){
					request.setAttribute("bar", request.getParameter("barcode"));
					request.getRequestDispatcher("bookBorrow_ok.jsp").
					forward(request, response);
				}else{
					request.setAttribute("error", "添加借阅信息失败！");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			}else{
				request.setAttribute("error", "没有该图书！");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}			
		}else{
			request.getRequestDispatcher("bookBorrow.jsp").forward(request, response);
		}
		
		
	}

	private void bookBorrowSort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("bookBorrowSort", borrowDAO.bookBorrowSort());
		request.getRequestDispatcher("bookBorrowSort.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
