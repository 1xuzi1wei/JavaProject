<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.ReaderDAO" %>
<%@ page import="com.mr.dao.ReaderTypeDAO" %>
<%@ page import="com.mr.actionForm.ReaderForm" %>
<%@ page import="com.mr.actionForm.ReaderTypeForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入类型名称!");
		form.name.focus();
		return false;
	}
	if(form.number.value==""){
		alert("请输入可借数量!");
		form.number.focus();
		return false;
	}
}
</script>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：读者管理 &gt; 读者类型管理 &gt;添加读者类型信息&gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="readerType?action=readerTypeAdd">
<table>
<tr>
	<td>类型名称：</td>
	<td>
		<input name="name" type="text" id="name" >
	</td>
</tr>
<tr>
	<td>可借数量：</td>
	<td>
		<input name="number" type="text" id ="number" >(本)
	</td>
</tr>     
<tr>
    <td>
        <input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
		<input name="Submit1" type="reset" class="btn_grey" value="重置">
		<input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back()">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>