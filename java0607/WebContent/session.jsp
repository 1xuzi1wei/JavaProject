<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>将用户名保存 在session对象中，并且添加最喜欢去的地方</title>
    
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
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");/* 获取用户填写的用户名 */
    session.setAttribute("name", name);/* 将用户名保存在session对象中 */
     %>
     <form method="post" name="form1" action="result.jsp" >
     您的名字是：<%=name %><br>
     您最喜欢去的地方是：<input type="text" name="address"><br>
     <input type="submit" value="提交" name="submit">
     </form>
  </body>
</html>
