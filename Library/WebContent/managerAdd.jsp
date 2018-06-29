<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="CSS/style.css" rel="stylesheet">
<title>图书馆管理系统</title>
</head>
<script type="text/javascript">
function check(form1){
	if(form1.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return false;
	}
	if(form1.pwd.value==""){
		alert("请输入管理员密码!");form.pwd.focus();return false;
	}
	if(form1.pwd1.value==""){
		alert("请确认管理员密码!");form.pwd1.focus();return false;
	} 
	if(form1.pwd.value != form1.pwd1.value){
		alert("您两次输入的管理员密码不一致，请重新输入!");form.pwd.focus();
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
		当前位置：系统设置 &gt; 管理员设置 &gt;添加管理员信息&gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="manager?action=managerAdd">
<table>
			<tr>
           	 	<td height="295" width="100%">&nbsp;</td>
            </tr>
</table>
<table align="center">
<tr>
	<td align="center" class="word_dark">管理员名称：</td>
	<td><input name="name" type="text" id="name"></td>
</tr>
<tr>
	<td align="center" class="word_dark">管理员密码：</td>
	<td><input name="pwd" type="password" id="pwd" ></td>
</tr>
<tr>
	<td align="center" class="word_dark">确认密码：</td>
	<td><input name="pwd1" type="password" id="pwd1" ></td>
</tr>
<tr align="center" >
	<td colspan="2">
		<input name="submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
		<input name="submit1"  type="reset" class="btn_grey" value="重置">
		<input name="submit2"  type="button" class="btn_grey" value="返回" onClick="history.back(-1);">
	</td>
</tr>
</table>
</form>
<%@ include file="copyright.jsp"%>
</body>
</html>