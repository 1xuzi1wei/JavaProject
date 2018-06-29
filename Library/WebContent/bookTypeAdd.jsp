<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.BookTypeDAO" %>
<%@ page import="com.mr.actionForm.BookTypeForm" %>
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
	if(form.typename.value==""){
		alert("请输入类型名称!");
		form.typename.focus();
		return false;
	}
	if(form.days.value==""){
		alert("请输入可借天数!");
		form.days.focus();
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
		当前位置：图书管理 &gt; 图书类型管理 &gt;添加图书类型信息&gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="bookType?action=bookTypeAdd">
<table>
<tr>
	<td>类型名称：</td>
	<td>
		<input name="typename" type="text" id="typename" >
	</td>
</tr>
<tr>
	<td>可借天数：</td>
	<td>
		<input name="days" type="text" id ="days" >(天)
	</td>
</tr>     
<tr>
    <td colspan="2" align="center">
		<input name="submit" type="submit" class="btn_grey" value="保存"  onClick="return check(form1)">
		<input name="submit1" type="reset" class="btn_grey" value="重置" >
		<input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>