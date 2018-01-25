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
 * Servlet implementation class UpdateEmployee
 */
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
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
		request.setCharacterEncoding("UTF-8");//设置编码方式
		//从页面取值
		Integer id = new Integer(request.getParameter("id"));//获取唯一性标识
		String name = request.getParameter("name");//获取员工姓名
		String sex = request.getParameter("sex");
		String business = request.getParameter("business");
		String address = request.getParameter("address");
		String remark = request.getParameter("remark");
		Session session = null;
		try{
		session = HibernateUtil.getSession();
		session.beginTransaction();
		Employee employee = (Employee) session.load(Employee.class, id);
		employee.setName(name);//修改员工的各个属性
		employee.setBusiness(business);
		employee.setSex(sex);
		employee.setBusiness(business);
		employee.setAddress(address);
		employee.setRemark(remark);
		session.save(employee);
		session.getTransaction().commit();
		}catch(Exception e){
			session.getTransaction().rollback();
			e.getStackTrace();
		}finally{
			HibernateUtil.closeSession();
		}
		request.getRequestDispatcher("QueryEmployee").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
