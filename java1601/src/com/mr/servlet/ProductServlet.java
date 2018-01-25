package com.mr.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.mr.hibernate.HibernateInitialize;
import com.mr.product.Product;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPut(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session session = null;
		Product product = new Product();
		try{
			session = HibernateInitialize.getSession();
			product.setId(1);
			product.setName("java web编程宝典");
			product.setPrice(79.0);
			product.setFactory("明日科技");
			product.setRemark("无");
			session.beginTransaction();
			session.save(product);
			session.getTransaction().commit();
		}catch(Exception e){
			session.getTransaction().rollback();
			System.out.println("数据添加失败");
		}finally{
			HibernateInitialize.closeSession();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
