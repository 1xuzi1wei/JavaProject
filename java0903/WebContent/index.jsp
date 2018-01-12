<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<script language="javascript">
	function checkEmpty(form){
	for(i=0;i<form.length;i++){
	if(form.elements[i].value==""){
	alert("表单信息不能为空");
	return false;
	}
	}
	}
	</script>	
    <title>使用监听查看在线用户</title>
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
    <form name="form" method="post" action="showUser.jsp" onSubmit="return checkEmpty(form)">
    <input type="text" name="user"><br><br>
    <input type="submit" name="Submit" value="登录">
  </form>
  </body>
</html>
