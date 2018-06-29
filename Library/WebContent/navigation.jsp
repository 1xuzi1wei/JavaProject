<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.ManagerDAO"%>
<%@ page import="com.mr.actionForm.ManagerForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航栏</title>
</head>
<script type="text/javascript">
function quit(){
	if(confirm("真要退出系统吗？")){
		window.location.href="login.jsp";
	}
}
</script>
<%
ManagerDAO managerDAO = new ManagerDAO();
ManagerForm managerForm = new ManagerForm();
managerForm.setName((String) session.getAttribute("manager"));
ManagerForm managerForm1 = managerDAO.query_p(managerForm);
int sysset1=0;
int readerset1=0;
int bookset1=0;
int borrowback1=0;
int sysquery1=0;
if(managerForm1!=null){
	sysset1=managerForm1.getSysset();
	readerset1=managerForm1.getReaderset();
	bookset1=managerForm1.getBookset();
	borrowback1=managerForm1.getBorrowback();
	sysquery1=managerForm1.getSysquery();
}
%>
<body>
<table style="width:100% ;cellpadding:0 ;cellspacing:0 ;
 padding-right:70;padding-bottom:100;padding-left:120;
 padding-top:100;" align="center" >
<tr>
	<td>
	<a href="main.jsp" class="word_dark">首页</a>| 
	<%if(sysset1==1){%><a class="word_dark" style="CURSOR:hand" href="sysSet.jsp">系统设置</a>| <%}%>
	<%if(readerset1==1){%><a style="CURSOR:hand"  class="word_dark" href="reader.jsp">读者管理</a>|<%}%>
	<%if(bookset1==1){%><a class="word_dark" style="CURSOR:hand" href="book.jsp" >图书管理</a>|<%}%>
	<%if(borrowback1==1){%><a class="word_dark" style="CURSOR:hand" href="bookBorrowBack.jsp">图书借还</a>|<%}%>
	<%if(sysquery1==1){%><a class="word_dark" style="CURSOR:hand" href="sysQuery.jsp" >系统查询</a>|<%}%>
	<a href="manager?action=querypwd" class="word_dark">更改密码</a>|
	<a href="#" onClick="quit()" class="word_dark">退出系统</a>
	</td>
</tr>
</table>
</body>
</html>