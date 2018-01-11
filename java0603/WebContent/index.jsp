<%@ page language="java" import="java.util.*" import="java.net.URLDecoder" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过cookie保存并读取用户的登录信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<!--   思路：
  获取cookie集合；
  获取指定的cookie对象；
  如果cookie存在即用户注册了，则提取cookie对象对应的值，并且读出相应的cookie信息；
  不存在即用户没有注册，则提交表单，创建并保存cookie对象
  步骤：
  通过cookie的getCookies()方法获取cookie对象的集合，然后用循环获取指定的cookie对象；
  通过cookie对象的getName()的方法获取指定的cookie对象；
  通过cookie对象的getValue()方法得到cookie对象对应的值；
  将一个cookie对象发送到客户端，用response中的addCookie()方法。 -->
  <body>
    <%
    Cookie[] cookies = request.getCookies();/* 获取cookie对象的集合 */
    String user = "";
    String date = "";
    if(cookies != null){
    for(int i=0;i<cookies.length;i++)	/* 通过循环寻找指定的cookie */
    {
    	if(cookies[i].getName().equals("cookie"))
    	{
    		user = URLDecoder.decode(cookies[i].getValue().split("#")[0]); /* 获取用户名 */
    		date = cookies[i].getValue().split("#")[1];  /* 获取注册时间 */ 	
    	}
    }
   }
//    没有注册
if("".equals(user) && "".equals(date))
{
     %>
     游客您好，欢迎您初次光临！
     <form action="deal.jsp" method="post">
     请输入姓名：<input name="user" value="" type="text">
     <input type="submit" value="确定">
     </form>
     <%
     }else{
      %>
      
      欢迎【<b><%=user %></b>】再次光临!<br>
      您注册的时间是：<%=date %>
      
      <%
      }
       %>
  </body>
</html>
