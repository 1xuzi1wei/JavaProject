package com.mr.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mr.actionForm.ReaderForm;
import com.mr.dao.ReaderDAO;

/**
 * Servlet implementation class Reader
 */
@WebServlet("/reader")
public class Reader extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReaderDAO readerDAO = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reader() {
        super();
        // TODO Auto-generated constructor stub
        this.readerDAO = new ReaderDAO();
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
		}else if("readerAdd".equals(action)){
			readerAdd(request,response);
			
		}else if("readerQuery".equals(action)){
			readerQuery(request,response);
		}else if("readerModifyQuery".equals(action)){
			readerModifyQuery(request,response);
			
		}else if("readerModify".equals(action)){
			readerModify(request,response);
			
		}else if("readerDel".equals(action)){
			readerDel(request,response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void readerDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
		readerForm.setId(Integer.valueOf(request.getParameter("id")));
		int r = readerDAO.delete(readerForm);
		if(r == 0){
			request.setAttribute("error", "删除读者信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("reader_ok.jsp?para=3").forward(request, response);
		}
	}

	private void readerModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
		readerForm.setId(Integer.valueOf(request.getParameter("id")));
		readerForm.setName(request.getParameter("name"));
		readerForm.setSex(request.getParameter("sex"));
        readerForm.setBarcode(request.getParameter("barcode"));
        readerForm.setVocation(request.getParameter("vocation"));
        readerForm.setBirthday(request.getParameter("birthday"));
        readerForm.setPaperType(request.getParameter("paperType"));
        readerForm.setPaperNO(request.getParameter("paperNO"));
        readerForm.setTel(request.getParameter("tel"));
        readerForm.setEmail(request.getParameter("email"));
        readerForm.setOperator(request.getParameter("operator"));
        readerForm.setRemark(request.getParameter("remark"));
        readerForm.setReadertypeid(Integer.valueOf(request.getParameter("readertypeid")));
        int r =  readerDAO.update(readerForm);
        if(r == 0){
        	request.setAttribute("error", "修改书架信息失败！");
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
        	request.getRequestDispatcher("reader_ok.jsp?para=2").forward(request, response);
        }
	}

	private void readerModifyQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
		readerForm.setId(Integer.valueOf(request.getParameter("id")));
//		System.out.println("查询到的id:" + request.getParameter("id"));
		request.setAttribute("readerModifyQuery", readerDAO.query_update(readerForm));
		request.getRequestDispatcher("readerModifyQuery.jsp").forward(request, response);
	}

	private void readerQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
		String str = null;
		request.setAttribute("readerQuery", readerDAO.query(str,readerForm));
		request.getRequestDispatcher("readerQuery.jsp").forward(request, response);
	}

	private void readerAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderForm readerForm = new ReaderForm();
		readerForm.setName(request.getParameter("name"));
		readerForm.setSex(request.getParameter("sex"));
        readerForm.setBarcode(request.getParameter("barcode"));
        readerForm.setVocation(request.getParameter("vocation"));
        readerForm.setBirthday(request.getParameter("birthday"));
        readerForm.setPaperType(request.getParameter("paperType"));
        readerForm.setPaperNO(request.getParameter("paperNO"));
        readerForm.setTel(request.getParameter("tel"));
        readerForm.setEmail(request.getParameter("email"));
      //获取系统日期
        Date date1=new Date();
        java.sql.Date date=new java.sql.Date(date1.getTime());
        readerForm.setCreateDate(date.toString());
        readerForm.setOperator(request.getParameter("operator"));
        readerForm.setRemark(request.getParameter("remark"));
        readerForm.setReadertypeid(Integer.valueOf(request.getParameter("readertypeid")));
		int r = readerDAO.insert(readerForm);
		if(r == 1){
			request.getRequestDispatcher("reader_ok.jsp?para=1").forward(request, response);
		}else if(r == 2){
			request.setAttribute("error", "该管理员信息已经添加！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "添加管理员信息失败！");
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
