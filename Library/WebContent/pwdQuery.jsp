<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.actionForm.ManagerForm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<%
ManagerForm managerForm2 = (ManagerForm)request.getAttribute("pwdQuery");
%>
<script type="text/javascript">
function checkForm(form){
	if(form.oldpwd.value == ""){
		alert("请输入的原密码！");
		form.oldpwd.focus();
		return false;
	}
	if(form.oldpwd.value !=form.holdpwd.value){
		alert("您输入的密码不正确，请重新输入！");
		form.oldpwd.focus();
		return false;
	}
	if(form.newpwd.value == ""){
		alert("请输入的新密码！");
		form.pwd.focus();
		return false;
	}
	if(form.newpwd1.value == ""){
		alert("请确认新密码！");
		form.pwd1.focus();
		return false;
	}
	if(form.newpwd1.value !=form.newpwd.value){
		alert("您两次输入的新密码不一致，请重新输入！");
// 		form.newpwd.value = "";
		form.newpwd1.value = "";
		form.newpwd1.focus();
		return false;
	}
} 
</script>
<body onLoad="clockon(bgclock)">
<%@ include file="banner.jsp"%>
<%@ include file="navigation.jsp"%>

<table>

<tr>
	<td valign="top" class="word_orange">
		当前位置：更改密码  &gt;&gt;&gt;
	</td>
</tr>

</table>
<form name="form1" method="post" action="manager?action=modifypwd" >
<table>
<tr align="center">
	<td>管理员名称：</td>
	<td>
	<input name="name" type="text" id="name" value="<%=managerForm2.getName()%>">
	</td>
</tr>
<tr>
	<td>原密码：</td>
	<td>
	<input name="oldpwd" type="password" id="oldpwd">
	<input name="holdpwd" type="hidden" id="holdpwd" value="<%=managerForm2.getPwd() %>">
	</td>
</tr>
<tr>
	<td>新密码：</td>
	<td>
	<input name="newpwd" type="password" id="newpwd" >
	</td>
<tr>
	<td>确定新密码：</td>
	<td>
	<input name="newpwd1" type="password" id="newpwd1" >
	</td>
</tr>
<tr>
	<td><input name="submit1" type="submit" class="btn_grey" value="保存" onClick="return checkForm(form1)">
		<input name="submit2" type="reset" class="btn_grey" value="取消" onClick="window.close();">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp" %>
</body>
</html>