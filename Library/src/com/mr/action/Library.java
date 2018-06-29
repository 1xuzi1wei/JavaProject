package com.mr.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mr.actionForm.LibraryForm;
import com.mr.dao.LibraryDAO;

/**
 * Servlet implementation class Library
 */
@WebServlet("/library")
public class Library extends HttpServlet {
	private static final long serialVersionUID = 1L;
       LibraryDAO libraryDAO = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Library() {
        super();
        // TODO Auto-generated constructor stub
       this.libraryDAO = new LibraryDAO();
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
		}else if("libraryQuery".equals(action)){
			libraryQuery(request,response);
		}else if("libraryModify".equals(action)){
			libraryModify(request,response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
//		修改图书馆信息
private void libraryModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LibraryForm libraryForm = new LibraryForm();
		libraryForm.setId(1);
		libraryForm.setLibraryname(request.getParameter("libraryname"));
		libraryForm.setCurator(request.getParameter("curator"));
        libraryForm.setTel(request.getParameter("tel"));
        libraryForm.setAddress(request.getParameter("address"));
        libraryForm.setEmail(request.getParameter("email"));
        libraryForm.setUrl(request.getParameter("url"));
        libraryForm.setCreateDate(request.getParameter("createDate"));
        libraryForm.setIntroduce(request.getParameter("introduce"));
		int r = libraryDAO.update(libraryForm);
		if(r == 0){
			request.setAttribute("error","图书馆信息修改失败！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("library_ok.jsp").forward(request, response);
	}

//		图书馆查询
	private void libraryQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LibraryForm libraryForm = new LibraryForm();
		request.setAttribute("libraryQuery", libraryDAO.query(libraryForm));
		request.getRequestDispatcher("libraryQuery.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
