package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mr.actionForm.ManagerForm;
import com.mr.dao.ManagerDAO;

@WebServlet("/manager")
public class Manager extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ManagerDAO managerDAO = null;
    public Manager() {
        super();
//        实例化ManagerForm类
        this.managerDAO = new ManagerDAO();
    }
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null ||"".equals(action)){
			request.setAttribute("error","您的操作有误！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else if("login".equals(action)){
//			调用验证管理员身份的方法
			managerLogin(request,response);
			
		}else if("managerAdd".equals(action)){
//			添加管理员信息
			managerAdd(request,response);
			
		}else if("managerQuery".equals(action)){
//			查询管理员及权限信息
			managerQuery(request,response);
		}else if("managerModifyQuery".equals(action)){
//		设置管理员权限时查询管理员权限
			managerModifyQuery(request,response);
			
		}else if("managerModify".equals(action)){
//		设置管理员权限
			managerModify(request,response);
			
		}else if("managerDel".equals(action)){
//		删除管理员
			managerDel(request,response);
			
		}else if("querypwd".equals(action)){
//		查询密码
			pwdQuery(request,response);
			
		}else if("modifypwd".equals(action)){
//		更改密码
			modifypwd(request,response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

//		修改密码时查询
private void pwdQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
		HttpSession session = request.getSession();
		String manager = (String)session.getAttribute("manager");
		managerForm.setName(manager);
//		System.out.println("查询到的manager:"+manager);
		request.setAttribute("pwdQuery", managerDAO.pwdquery(managerForm));
		request.getRequestDispatcher("pwdQuery.jsp").forward(request,response);
	}

//		设置管理员权限时查询管理员权限
private void managerModifyQuery(HttpServletRequest request,
		HttpServletResponse response) 
				throws ServletException, IOException {
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id")));
//		System.out.println("查询到的id:" + request.getParameter("id"));
		request.setAttribute("managerModifyQuery", 
				managerDAO.query_update(managerForm));
		request.getRequestDispatcher("managerModifyQuery.jsp").
		forward(request, response);		
	}

//		更改密码
private void modifypwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
//		将表单接受到的信息保存到管理员实体类ManagerForm中
		managerForm.setName(request.getParameter("name"));
		managerForm.setPwd(request.getParameter("newpwd"));
		int r = managerDAO.modifypwd(managerForm);
		if(r == 0){
			request.setAttribute("error", "修改密码失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("pwd_ok.jsp").forward(request, response);
		}
		
	}
//		删除管理员
private void managerDel(HttpServletRequest request, 
		HttpServletResponse response) 
				throws ServletException, IOException {
		// TODO Auto-generated method stub
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id")));
		int r = managerDAO.delete(managerForm);
		if(r == 0){
			request.setAttribute("error", "删除管理员信息失败！");
        	request.getRequestDispatcher("error.jsp").
        	forward(request, response);
		}else{
			request.getRequestDispatcher("manager_ok.jsp?para=3").
			forward(request, response);
		}
	}
//		设置管理员权限
private void managerModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id")));
		managerForm.setName(request.getParameter("name"));
		managerForm.setPwd(request.getParameter("pwd"));
		managerForm.setSysset(request.getParameter("sysset") == null ? 0 : Integer.parseInt(request.getParameter("sysset")));
		managerForm.setReaderset(request.getParameter("readerset") == null ? 0 : Integer.parseInt(request.getParameter("readerset")));
		managerForm.setBookset(request.getParameter("bookset") == null ? 0 : Integer.parseInt(request.getParameter("bookset")));
		managerForm.setBorrowback(request.getParameter("borrowback") == null ? 0 : Integer.parseInt(request.getParameter("borrowback")));
		managerForm.setSysquery(request.getParameter("sysquery") == null ? 0 : Integer.parseInt(request.getParameter("sysquery")));
        int r = managerDAO.update(managerForm);
        if(r == 0){
        	request.setAttribute("error", "设置管理员权限失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("manager_ok.jsp?para=2").forward(request, response);
        }
	}

//		添加管理员信息
private void managerAdd(HttpServletRequest request, HttpServletResponse 
		response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
	//	将表单接受到的信息保存到管理员实体类ManagerForm中
		managerForm.setName(request.getParameter("name"));
		managerForm.setPwd(request.getParameter("pwd"));
//		调用添加管理员信息
		int r = managerDAO.insert(managerForm);
		if(r == 1){
//		转到管理员信息添加成功页面
			request.getRequestDispatcher("manager_ok.jsp?para=1").
			forward(request, response);
		}else if(r == 2){
			request.setAttribute("error", "该管理员信息已经添加！");
			request.getRequestDispatcher("error.jsp").
			forward(request, response);
		}else{
			request.setAttribute("error", "添加管理员信息失败！");
			request.getRequestDispatcher("error.jsp").
			forward(request, response);
		}
		
	}

//		查看管理员列表
private void managerQuery(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str = null;
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
		request.setAttribute("managerQuery", managerDAO.query(str,managerForm));
		request.getRequestDispatcher("managerQuery.jsp").forward(request, response);
	}

//		管理员身份验证
	private void managerLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		实例化ManagerForm类
		ManagerForm managerForm = new ManagerForm();
//		将表单接受到的信息保存到管理员实体类ManagerForm中
		managerForm.setName(request.getParameter("name"));
		managerForm.setPwd(request.getParameter("pwd"));
		int r = managerDAO.checkManager(managerForm);
		if(r == 1){
//			将登入到系统的管理员名称保存到session中
			HttpSession session = request.getSession();
			session.setAttribute("manager", managerForm.getName());
//			将页面重定向到系统主界面
			request.getRequestDispatcher("main.jsp").forward(request, response);
			
		}else{
			request.setAttribute("error", "输入的管理员名称或者密码有错误！");
//			转到错误提示页
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
