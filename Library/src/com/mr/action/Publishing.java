package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mr.actionForm.PublishingForm;
import com.mr.dao.PublishingDAO;

/**
 * Servlet implementation class Publishing
 */
@WebServlet("/publishing")
public class Publishing extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PublishingDAO publishingDAO = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Publishing() {
        super();
        // TODO Auto-generated constructor stub
        this.publishingDAO = new PublishingDAO();
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
		}else if("publishingAdd".equals(action)){
			publishingAdd(request,response);		
		}else if("publishingQuery".equals(action)){
			publishingQuery(request,response);
		}else if("publishingModifyQuery".equals(action)){
			publishingModifyQuery(request,response);	
		}else if("publishingModify".equals(action)){
			publishingModify(request,response);			
		}else if("publishingDel".equals(action)){
			publishingDel(request,response);			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void publishingDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PublishingForm publishingForm = new PublishingForm();
		publishingForm.setIsbn(request.getParameter("isbn"));
		int r = publishingDAO.delete(publishingForm);
		if(r == 0){
			request.setAttribute("error", "删除出版社信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("publishing_ok.jsp?para=3").forward(request, response);
		}
	}

	private void publishingModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PublishingForm publishingForm = new PublishingForm();
		publishingForm.setIsbn(request.getParameter("isbn"));
		publishingForm.setPubname(request.getParameter("pubname"));
		int r = publishingDAO.update(publishingForm);
        if(r == 0){
        	request.setAttribute("error", "修改出版社信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("publishing_ok.jsp?para=2").forward(request, response);
        }
	}

	private void publishingAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PublishingForm publishingForm = new PublishingForm();
		publishingForm.setIsbn(request.getParameter("isbn"));
		publishingForm.setPubname(request.getParameter("pubname"));
		int r = publishingDAO.insert(publishingForm);
		if(r == 1){
			request.getRequestDispatcher("publishing_ok.jsp?para=1").forward(request, response);
		}else if(r == 2){
			request.setAttribute("error", "该出版社信息已经添加！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "添加出版社信息失败！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void publishingModifyQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PublishingForm publishingForm = new PublishingForm();
		publishingForm.setIsbn(request.getParameter("isbn"));
//		System.out.println("查询到的isbn:" + request.getParameter("isbn"));
		request.setAttribute("publishingModifyQuery", publishingDAO.query_update(publishingForm));
		request.getRequestDispatcher("publishingModifyQuery.jsp").forward(request, response);
	}
	
	private void publishingQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PublishingForm publishingForm = new PublishingForm();
		String str = null;
		request.setAttribute("publishingQuery", publishingDAO.query(str,publishingForm));
		request.getRequestDispatcher("publishingQuery.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
