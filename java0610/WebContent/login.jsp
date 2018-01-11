<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
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
    <form action="index.jsp" method="post" name="form1">
    用户名：<input name="user" type="text" id="user" style="width:120px" value=""><br>
    密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="pwd" type="password" id="pwd" style="width:120px"><br>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交" name="submit"style="width:50px" >
    <input type="reset" value="重置" name="reset"style="width:50px" >
    </form>
  </body>
</html>
