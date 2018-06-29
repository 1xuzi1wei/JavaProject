package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mr.actionForm.ParameterForm;
import com.mr.dao.ParameterDAO;

/**
 * Servlet implementation class Parameter
 */
@WebServlet("/parameter")
public class Parameter extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ParameterDAO parameterDAO = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Parameter() {
        super();
        // TODO Auto-generated constructor stub
        parameterDAO = new ParameterDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null ||"".equals(action)){
			request.setAttribute("error","您的操作有误！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else if("parameterQuery".equals(action)){
			parameterQuery(request,response);
		}else if("parameterModify".equals(action)){
			parameterModify(request,response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
//	参数修改
	private void parameterModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ParameterForm parameterForm = new ParameterForm();
		parameterForm.setId(1);
		parameterForm.setCost(Integer.parseInt(request.getParameter("cost")));
		parameterForm.setValidity(Integer.parseInt(request.getParameter("validity")));
		int r = parameterDAO.update(parameterForm);
		if(r == 0){
			request.setAttribute("error","参数设置信息修改失败！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("parameter_ok.jsp").forward(request, response);
		}
	}

	//	参数查询
	private void parameterQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ParameterForm parameterForm = new ParameterForm();
		request.setAttribute("parameterQuery", parameterDAO.query(parameterForm));
		request.getRequestDispatcher("parameterQuery.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
