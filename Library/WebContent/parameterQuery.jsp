<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.actionForm.ParameterForm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
ParameterForm parameterForm = (ParameterForm)request.getAttribute("parameterQuery");
int cost = 0;
int validity = 0;
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
<script type="text/javascript">
function checkForm(form){
	for(i=0;i<form.length;i++){
		if(form.elements[i].value==""){
		alert("请将信息填写完整！");
		form.elements[i].focus();
		return false;
		}
	}
}
</script>
</head>
<body onLoad="onclock()">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 参数设置 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form action="parameter?action=parameterModify" name="form1" method="post">
<%
	if(parameterForm != null){
		cost = parameterForm.getCost();
		validity = parameterForm.getValidity();
	}
%>
<table>
<tr>
	<td>办证费：</td>
	<td><input name="cost" type="text" id="cost" value="<%=cost%>">（元）</td>
</tr>
<tr>
	<td>有效期限：</td>
	<td><input name="validity" type="text" id="validity" value="<%=validity%>">（天）</td>
</tr>
<tr>
<td colspan="2" align="center">
<input name="submit" type="submit" class="btn_grey" value="保存" 
onClick="return checkForm(form1)">
<input name="submit1" type="reset" class="btn_grey" value="重置">
<input name="submit2" type="button" class="btn_grey" value="返回" 
onClick="history.back(-1)">
</td>
</tr>
</table>
</form>
<%@include file="copyright.jsp" %>
</body>
</html>