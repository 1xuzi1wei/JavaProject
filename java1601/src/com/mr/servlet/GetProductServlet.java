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
 * Servlet implementation class GetProductServlet
 */
public class GetProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = HibernateInitialize.getSession();
			Product product = (Product)session.get(Product.class, new Integer("1"));
			System.out.println("产品ID："+product.getId());
			System.out.println("产品名称："+product.getName());
			System.out.println("产品价格："+product.getPrice()+"元");
			System.out.println("生产厂商："+product.getFactory());
			System.out.println("产品备注："+product.getRemark());
		}catch(Exception e){
			System.out.println("对象装载失败");
			e.printStackTrace();
		}finally{
			HibernateInitialize.closeSession();
		}
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
