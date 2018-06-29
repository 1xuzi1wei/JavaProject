package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mr.actionForm.BookCaseForm;
				import com.mr.dao.BookCaseDAO;

/**
 * Servlet implementation class BookCase
 */
@WebServlet("/bookCase")
public class BookCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookCaseDAO bookCaseDAO=null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCase() {
        super();
        // TODO Auto-generated constructor stub
        this.bookCaseDAO = new BookCaseDAO ();
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
		}else if("bookCaseAdd".equals(action)){
			bookCaseAdd(request,response);		
		}else if("bookCaseQuery".equals(action)){
			bookCaseQuery(request,response);
		}else if("bookCaseModifyQuery".equals(action)){
			bookCaseModifyQuery(request,response);	
		}else if("bookCaseModify".equals(action)){
			bookCaseModify(request,response);			
		}else if("bookCaseDel".equals(action)){
			bookCaseDel(request,response);			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
//书架删除
	private void bookCaseDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookCaseForm bookCaseForm = new BookCaseForm();
		bookCaseForm.setId(Integer.valueOf(request.getParameter("id")));
		int r = bookCaseDAO.delete(bookCaseForm);
		if(r == 0){
			request.setAttribute("error", "删除书架信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("bookCase_ok.jsp?para=3").forward(request, response);
		}
	}

	private void bookCaseModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookCaseForm bookCaseForm = new BookCaseForm();
		bookCaseForm.setId(Integer.valueOf(request.getParameter("id")));
		bookCaseForm.setName(request.getParameter("name"));
		int r = bookCaseDAO.update(bookCaseForm);
        if(r == 0){
        	request.setAttribute("error", "修改书架信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("bookCase_ok.jsp?para=2").forward(request, response);
        }
	}

	private void bookCaseModifyQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookCaseForm bookCaseForm = new BookCaseForm();
		bookCaseForm.setId(Integer.valueOf(request.getParameter("id")));
//		System.out.println("查询到的id:" + request.getParameter("id"));
		request.setAttribute("bookCaseModifyQuery", bookCaseDAO.query_update(bookCaseForm));
		request.getRequestDispatcher("bookCaseModifyQuery.jsp").forward(request, response);
	}

	private void bookCaseQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookCaseForm bookCaseForm = new BookCaseForm();
		String str = null;
		request.setAttribute("bookCaseQuery", bookCaseDAO.query(str,bookCaseForm));
		request.getRequestDispatcher("bookCaseQuery.jsp").forward(request, response);
	}

	private void bookCaseAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookCaseForm bookCaseForm = new BookCaseForm();
		bookCaseForm.setName(request.getParameter("name"));
		int r = bookCaseDAO.insert(bookCaseForm);
		if(r == 1){
			request.getRequestDispatcher("bookCase_ok.jsp?para=1").forward(request, response);
		}else if(r == 2){
			request.setAttribute("error", "该书架信息已经添加！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "添加书架信息失败！");
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
