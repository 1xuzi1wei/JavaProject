package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mr.actionForm.ReaderTypeForm;
import com.mr.dao.ReaderTypeDAO;

/**
 * Servlet implementation class ReaderType
 */
@WebServlet("/readerType")
public class ReaderType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReaderTypeDAO readerTypeDAO = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderType() {
        super();
        // TODO Auto-generated constructor stub
        this.readerTypeDAO = new ReaderTypeDAO();
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
		}else if("readerTypeAdd".equals(action)){
			readerTypeAdd(request,response);
			
		}else if("readerTypeQuery".equals(action)){
			readerTypeQuery(request,response);
		}else if("readerTypeModifyQuery".equals(action)){
			readerTypeModifyQuery(request,response);
			
		}else if("readerTypeModify".equals(action)){
			readerTypeModify(request,response);
			
		}else if("readerTypeDel".equals(action)){
			readerTypeDel(request,response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void readerTypeDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		readerTypeForm.setId(Integer.valueOf(request.getParameter("id")));
		int r = readerTypeDAO.delete(readerTypeForm);
		if(r == 0){
			request.setAttribute("error", "删除读者类型信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("readerType_ok.jsp?para=3").forward(request, response);
		}
	}

	private void readerTypeModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		readerTypeForm.setId(Integer.valueOf(request.getParameter("id")));
		readerTypeForm.setName(request.getParameter("name"));
        readerTypeForm.setNumber(Integer.valueOf(request.getParameter("number")));
        int r =  readerTypeDAO.update(readerTypeForm);
        if(r == 0){
        	request.setAttribute("error", "修改读者类型信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("readerType_ok.jsp?para=2").forward(request, response);
        }
	}

	private void readerTypeModifyQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		readerTypeForm.setId(Integer.valueOf(request.getParameter("id")));
//		System.out.println("查询到的id:" + request.getParameter("id"));
		request.setAttribute("readerTypeModifyQuery", readerTypeDAO.query_update(readerTypeForm));
		request.getRequestDispatcher("readerTypeModifyQuery.jsp").forward(request, response);
	}

	private void readerTypeQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		String str = null;
		request.setAttribute("readerTypeQuery", readerTypeDAO.query(str,readerTypeForm));
		request.getRequestDispatcher("readerTypeQuery.jsp").forward(request, response);
	}

	private void readerTypeAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		 readerTypeForm.setName(request.getParameter("name"));
		 int r = readerTypeDAO.insert(readerTypeForm);
			if(r == 1){
				request.getRequestDispatcher("readerType_ok.jsp?para=1").forward(request, response);
			}else if(r == 2){
				request.setAttribute("error", "该读者类型信息已经添加！");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}else{
				request.setAttribute("error", "添加读者类型信息失败！");
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
