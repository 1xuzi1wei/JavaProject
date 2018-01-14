<%@ page language="java" import="java.util.*" import="com.lyq.bean.Book" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'book_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <table align="center" width="450" border="1" height="180" bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
		<tr bgcolor="white">
			<td align="center" colspan="5">
				<h2>所有图书信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>ID</b></td>
			<td><b>图书名称</b></td>
			<td><b>价格</b></td>
			<td><b>数量</b></td>
			<td><b>作者</b></td>
			<td><b>修改数量</b></td>
		</tr>
		<%
		List<Book> list = (List<Book>)request.getAttribute("list");
		if(list == null ||list.size()<1)
		{
		out.print("没有数据！");
		}else
		{
		for (Book book : list){
		%>
		<tr align="center" bgcolor="white">
					<td><%=book.getId()%></td>
					<td><%=book.getName()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getBookCount()%></td>
					<td><%=book.getAuthor()%></td>
					<td>
					<form action ="UpdateServlet" method="post" onsubmit="return check(this);">
					<input type="hidden" name="id" value="<%=book.getId() %>">
					<input type="text" name="bookCount" size="15">
					<input type="submit" value="修    改">
					</form>
					</td>
				</tr>
		<% 
		}
		}
		
		 %>
			</table>
  </body>
</html>
