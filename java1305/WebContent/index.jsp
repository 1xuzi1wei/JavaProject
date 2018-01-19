<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="JS/AjaxRequest"></script>
	<script type="text/javascript">
// 	错误处理函数
function onerror(){
	alert("出错了!");
}
// 实例化Ajax对象
function getSysTime(){
	loader = new net.AjaxRequest("deal.jsp?nocache="+new Date().getTime(),deal,onerror,"GET");
}
// 回调函数
function deal(){
 	document.getElementById("clock").innerHTML = "现在的时间是："+this.req.responseText;
}
	timer = window.setInterval("getSysTime();",1000); 
	</script>
  </head>
  
  <body onLoad="getSysTime()" style="margin:0px">
    <table width="901" height="128" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.jpg">
    <tr>
      <td height="96">&nbsp;</td>
    </tr>
    <tr>
      <td style="padding-left:20pt;;font-size:9pt;"><div id="clock">系统时间</div></td>
    </tr>
  </table>
  </body>
</html>
