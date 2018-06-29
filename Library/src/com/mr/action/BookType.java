package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mr.actionForm.BookTypeForm;
import com.mr.dao.BookTypeDAO;

/**
 * Servlet implementation class BookType
 */
@WebServlet("/bookType")
public class BookType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookTypeDAO bookTypeDAO = null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookType() {
        super();
        // TODO Auto-generated constructor stub
        this.bookTypeDAO = new BookTypeDAO();
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
		}else if("bookTypeAdd".equals(action)){
			bookTypeAdd(request,response);
			
		}else if("bookTypeQuery".equals(action)){
			bookTypeQuery(request,response);
		}else if("bookTypeModifyQuery".equals(action)){
			bookTypeModifyQuery(request,response);
			
		}else if("bookTypeModify".equals(action)){
			bookTypeModify(request,response);
			
		}else if("bookTypeDel".equals(action)){
			bookTypeDel(request,response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void bookTypeDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setId(Integer.valueOf(request.getParameter("id")));
		int r = bookTypeDAO.delete(bookTypeForm);
		if(r == 0){
			request.setAttribute("error", "删除图书类型信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("bookType_ok.jsp?para=3").forward(request, response);
		}
	}

	private void bookTypeModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setId(Integer.valueOf(request.getParameter("id")));
		bookTypeForm.setTypeName(request.getParameter("typename"));
		bookTypeForm.setDays(Integer.valueOf(request.getParameter("days")));
        int r =  bookTypeDAO.update(bookTypeForm);
        if(r == 0){
        	request.setAttribute("error", "修改图书类型信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("bookType_ok.jsp?para=2").forward(request, response);
        }
	}

	private void bookTypeModifyQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setId(Integer.valueOf(request.getParameter("id")));
//		System.out.println("查询到的id:" + request.getParameter("id"));
		request.setAttribute("bookTypeModifyQuery", bookTypeDAO.query_update(bookTypeForm));
		request.getRequestDispatcher("bookTypeModifyQuery.jsp").forward(request, response);
	}

	private void bookTypeQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookTypeForm bookTypeForm = new BookTypeForm();
		String str = null;
		request.setAttribute("bookTypeQuery", bookTypeDAO.query(str,bookTypeForm));
		request.getRequestDispatcher("bookTypeQuery.jsp").forward(request, response);
	}

	private void bookTypeAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setTypeName(request.getParameter("typename"));
		bookTypeForm.setDays(Integer.valueOf(request.getParameter("days")));
		int r = bookTypeDAO.insert(bookTypeForm);
			if(r == 1){
				request.getRequestDispatcher("bookType_ok.jsp?para=1").forward(request, response);
			}else if(r == 2){
				request.setAttribute("error", "该图书类型信息已经添加！");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}else{
				request.setAttribute("error", "添加图书类型信息失败！");
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
