package com.mr.action;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mr.actionForm.BookForm;
import com.mr.dao.BookDAO;

/**
 * Servlet implementation class Book
 */
@WebServlet("/book")
public class Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bookDAO = null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book() {
        super();
        // TODO Auto-generated constructor stub
        this.bookDAO = new BookDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action =request.getParameter("action");
		if(action == null ||"".equals(action)){
			request.setAttribute("error","您的操作有误！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else if("bookAdd".equals(action)){
			bookAdd(request,response);
			
		}else if("bookQuery".equals(action)){
			bookQuery(request,response);
		}else if("bookModifyQuery".equals(action)){
			bookModifyQuery(request,response);
			
		}else if("bookModify".equals(action)){
			bookModify(request,response);
			
		}else if("bookDel".equals(action)){
			bookDel(request,response);
			
		}else if("bookifQuery".equals(action)){
            bookifQuery(request,response);
        }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

		private void bookifQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookForm bookForm = new BookForm();
		String str = null;
		if(request.getParameter("f") != null){
//			System.out.println("查询到的图书："+request.getParameter("f"));
			str = request.getParameter("f") + " like '%" + request.getParameter("key") + "%";
//			System.out.println("条件查询图书信息时的str:"+str);
		}
		request.setAttribute("bookifQuery", bookDAO.query(str,bookForm));		
		request.getRequestDispatcher("bookifQuery.jsp").forward(request, response);
	}

	private void bookDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookForm bookForm = new BookForm();
		bookForm.setId(Integer.valueOf(request.getParameter("id")));
		int r = bookDAO.delete(bookForm);
		if(r == 0){
			request.setAttribute("error", "删除图书信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("book_ok.jsp?para=3").forward(request, response);
		}
	}

	private void bookModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 BookForm bookForm = new BookForm();
		 bookForm.setId(Integer.parseInt(request.getParameter("id")));
		 bookForm.setBarcode(request.getParameter("barcode"));
	     bookForm.setBookname(request.getParameter("bookName"));
	     bookForm.setTypeid(Integer.valueOf(request.getParameter("typeid")));
	     bookForm.setAuthor(request.getParameter("author"));
	     bookForm.setIsbn(request.getParameter("isbn"));
	     bookForm.setPrice(Double.valueOf(request.getParameter("price")));
	     bookForm.setPage(Integer.valueOf(request.getParameter("page")));
	     bookForm.setBookcaseid(Integer.valueOf(request.getParameter("bookcaseid")));    
	     bookForm.setOperator(request.getParameter("operator"));
	   //获取系统日期
	     Date date1=new Date();
	     java.sql.Date date=new java.sql.Date(date1.getTime());
	     bookForm.setInTime(date.toString());
	     bookForm.setDel(0);
        int r =  bookDAO.update(bookForm);
        if(r == 0){
        	request.setAttribute("error", "修改图书信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("book_ok.jsp?para=2").forward(request, response);
        }
	}

	private void bookModifyQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookForm bookForm = new BookForm();
		bookForm.setId(Integer.valueOf(request.getParameter("id")));
//		System.out.println("查询并修改图书信息:" + request.getParameter("id"));
		request.setAttribute("bookModifyQuery", bookDAO.query_update(bookForm));
		request.getRequestDispatcher("bookModifyQuery.jsp").forward(request, response);
	}

	private void bookQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookForm bookForm = new BookForm();
		String str = null;
		request.setAttribute("bookQuery", bookDAO.query(str,bookForm));
		request.getRequestDispatcher("bookQuery.jsp").forward(request, response);
	}

	private void bookAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 BookForm bookForm = new BookForm();
		 bookForm.setBarcode(request.getParameter("barcode"));
	     bookForm.setBookname(request.getParameter("bookName"));
	     bookForm.setTypeid(Integer.valueOf(request.getParameter("bookTypeid")));
	     bookForm.setAuthor(request.getParameter("author"));
	     bookForm.setIsbn(request.getParameter("isbn"));
	     bookForm.setPrice(Double.valueOf(request.getParameter("price")));
	     bookForm.setPage(Integer.valueOf(request.getParameter("page")));
	     bookForm.setBookcaseid(Integer.valueOf(request.getParameter("bookcaseid")));    
	     //获取系统日期
	     Date date1=new Date();
	     java.sql.Date date=new java.sql.Date(date1.getTime());
	     bookForm.setInTime(date.toString());
	     bookForm.setOperator(request.getParameter("operator"));
	     bookForm.setDel(0);
		int r = bookDAO.insert(bookForm);
		if(r == 1){
			request.getRequestDispatcher("book_ok.jsp?para=1").forward(request, response);
		}else if(r == 2){
			request.setAttribute("error", "该图书信息已经添加！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "添加图书信息失败！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
