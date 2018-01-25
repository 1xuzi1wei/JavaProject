package com.mr.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import com.mr.hibernate.HibernateUtil;

/**
 * Servlet implementation class QueryEmployee
 */
@SuppressWarnings("deprecation")
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
		
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		@SuppressWarnings({ "rawtypes" })
		List emplist = new ArrayList();
		Session session = null;
		try{
		session = HibernateUtil.getSession();
		String hql ="from Employee emp";
		@SuppressWarnings("rawtypes")
		Query q = session.createQuery(hql);
		emplist = q.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			HibernateUtil.closeSession();
		}
		request.setAttribute("emplist", emplist);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
