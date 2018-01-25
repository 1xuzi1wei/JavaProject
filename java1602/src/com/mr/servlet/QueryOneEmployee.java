package com.mr.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.mr.employee.Employee;
import com.mr.hibernate.HibernateUtil;

/**
 * Servlet implementation class QueryOneEmployee
 */
public class QueryOneEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryOneEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Integer id = new Integer(request.getParameter("id"));
		Session session = null;
		try{
			session = HibernateUtil.getSession();
			Employee employee = (Employee)session.get(Employee.class, id);
			request.setAttribute("employee", employee);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			HibernateUtil.closeSession();
		}
		request.getRequestDispatcher("update.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
