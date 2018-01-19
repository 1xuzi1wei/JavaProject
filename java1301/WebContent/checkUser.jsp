<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkUser.jsp' starting page</title>
    
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
   String[] userList = {"明日科技","mr","mrsoft","wgh"};
   String user = new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
   Arrays.sort(userList);
   int result = Arrays.binarySearch(userList,user);
   if(result >-1){
   		out.println("很抱歉，该用户名已经被注册了！");
   }else{
  	 	out.println("恭喜您，该用户名没有被注册！");
   }
    %>
  </body>
</html>
