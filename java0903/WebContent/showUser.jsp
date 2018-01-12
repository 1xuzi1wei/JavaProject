<%@ page language="java" import="java.util.*" import="com.lyq.listener.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>使用监听查看用户</title>
    
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
  UserInfoList list = UserInfoList.getInstance();
  UserInfoTrace ut = new UserInfoTrace();
  String name = request.getParameter("user");
  ut.setUser(name);
//   session.setAttribute("list", ut);
  list.adduserInfo(ut.getUser());
  session.setMaxInactiveInterval(10);
   %>
    <textarea rows="8" cols="20">
    <%
    Vector vector = list.getList();
    if(vector != null && vector.size()>0)
    for(int i=0;i<vector.size();i++)
    {
    out.println(vector.elementAt(i));
    }
     %>
    </textarea><br>
     <a href="index.jsp">返回</a>
  </body>
</html>
