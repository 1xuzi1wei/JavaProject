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
	<script type="text/javascript" src="JS/AjaxRequest.js"></script>
	<script type="text/javascript">
// 错误处理函数
function onerror(){
	alert("您的操作有误！");
}
// 实例化Ajax对象的方法
// 获取省份和直辖市
function getProvince(){
	loader = new net.AjaxRequest("ZoneServlet?action=getProvince&nocache="+new Date().getTime(),deal_getProvince,onerror,"GET");
}
function deal_getProvince(){
	provinceArr = this.req.responseText.spilt(",");
	for(var i=0;i<provinceArr.length;i++){
	document.getElementById("province").options[i]=new Option(provinceArr[i],provinceArr[i]);
	}
	if(provinceArr[0] != ""){
	getCity(provinceArr[0]);
	}
}
window.onload = function(){
	getProvince();/* 获取省份和直辖市 */
};

// 获取市县
function getCity(selProvince){
loader = new net.AjaxRequest("ZoneServlet?action=getCity&parProvince="+selProvince+"&nocache="+new Date().getTime(),deal_getCity(),onerror,"GET");
}
function deal_getCity(){
	cityArr = this.req.responseText.spilt(",");
	document.getElementById("city").length =0;
	for(var i=0;i<cityArr.length;i++){
		document.getElementById("city").options[i] = new Option(cityArr[i],cityArr[i]);
	}
}
</script>
  </head>
  
  <body>
  请选择：
    <select name="province" id="province" onchange="getCity(this.value)" style="width:100px;"></select>
    —  <select name="city" id="city" style="width:100px;"></select>
  </body>
</html>
