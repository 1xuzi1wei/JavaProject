package com.mr.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.mr.hibernate.HibernateInitialize;

/**
 * Servlet implementation class QueryEmployee
 */
@WebServlet("/QueryEmployee")
public class QueryEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		@SuppressWarnings({ "rawtypes", "unused" })
		List emplist = new ArrayList();
		Session session = null;
		try{
			session = HibernateInitialize.getSession();
			String hql = "from Employee emp";
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(hql);
			emplist = q.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			HibernateInitialize.closeSession();
		}
		request.setAttribute("emplist", emplist);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
