<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示信息</title>
    
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
  <%
  request.setCharacterEncoding("UTF-8");/* 设置请求的编码格式 */
  String name = request.getParameter("name");/* 获取用户名 */
  String content = request.getParameter("content");/* 获取留言内容 */
  String message = "["+name+"]"+"说："+content+"<br>";/* 添加留言内容 */
//     session.setAttribute("message", message);放在这里，只能显示当前留言内容，之前的留言内容都清空
//   if(session.getAttribute("message") != null)
//   {
  	message += session.getAttribute("message").toString();
//   }

/* if(session.getAttribute("message") != null)
  {
  	out.print(session.getAttribute("message").toString());
  } */
/* response.setHeader("refresh","5;URL=index.jsp"); */
session.setAttribute("message", message);/* 一定要放在getAttribute()之后，这样才能实现添加留言的内容 */
/*   session.removeAttribute("message"); *//* 清除留言内容 */
   response.sendRedirect("index.jsp");
  %>
  </body>
</html>
