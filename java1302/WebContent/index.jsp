<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="javascript" src = "JS/AjaxRequest.js">
</script>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
// 	错误处理函数
function onerror(){
alert("您的操作有误！");
}
// 实例化Ajax对象的方法
function getInfo(){
loader = new net.AjaxRequest("getInfo.jsp?nocache="+new Date().getTime(),deal_getInfo,onerror,"GET");
}
// 回调函数
function deal_getInfo(){
document.getElementById("showInfo").innerHTML = this.req.responseText;
}
// 实现实时获取公告信息
window.onload = function(){
getInfo();
window.setInterval("getInfo()", 60000);
};
	</script>
  </head>
  
  <body>
  <div style="border: 1px solid;height: 50px; width:200px;padding: 5px;">
  <marquee direction="up" scrollamount="3">
  <div id="showInfo"></div>
  </marquee>
  </div>
  </body>
</html>
