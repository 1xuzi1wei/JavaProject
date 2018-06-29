<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 书架设置 &gt;添加书架信息&gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="bookCase?action=bookCaseAdd">
<table>
<tr>
	<td>书架名称：</td>
	<td><input name="name" type="text" id="name"></td>
</tr>
<tr >
	<td colspan="2" align="center">
		<input name="submit" type="submit" class="btn_grey" value="保存" 
		onClick="return check(form1)" >
		<input name="submit1" type="reset" class="btn_grey" value="重置" >
		<input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>