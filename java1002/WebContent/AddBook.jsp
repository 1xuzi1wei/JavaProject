<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddBook.jsp' starting page</title>
    
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
 <jsp:useBean id="book" class = "com.lyq.bean.Book"></jsp:useBean>
 <jsp:setProperty property="*" name="book"/>
 <%
 try {
		// 加载数据库驱动，注册到驱动管理器
		Class.forName("com.mysql.jdbc.Driver");
		// 数据库连接字符串
		String url = "jdbc:mysql://localhost:3306/db_database10?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		// 数据库用户名
		String username = "root";
		// 数据库密码
		String password = "1234";
		// 创建Connection连接
		Connection con = DriverManager.getConnection(url,username,password);
 // 添加图书信息的SQL语句
String sql = "insert into tb_books(name,price,bookCount,author,id) values(?,?,?,?,?)";
// 获取PreparedStatement
PreparedStatement ps = con.prepareStatement(sql);
// 对SQL语句中的第1个参数赋值
ps.setString(1, book.getName());
System.out.println("name："+book.getName());
// 对SQL语句中的第2个参数赋值
ps.setDouble(2, book.getPrice());
// 对SQL语句中的第3个参数赋值
ps.setInt(3,book.getBookCount());
// 对SQL语句中的第4个参数赋值
ps.setString(4, book.getAuthor());
// 对SQL语句中的第5个参数赋值
ps.setInt(5, book.getId());
int row = ps.executeUpdate();

out.println("成功添加了"+row+"条数据");

ps.close();
con.close(); 
}catch(Exception e){
	out.print("图书信息添加失败");
}

 %> 
 <br>
	<a href="index.jsp">返回</a>
  </body>
</html>
