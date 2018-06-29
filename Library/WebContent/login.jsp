<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
<script type="text/javascript">
function check(form){
	if(form.name.value == ""){
		alert("请输入管理员名称！");
		form.name.focus();
		return false;
	}
	if(form.pwd.value == ""){
		alert("请输入密码！");
		form.pwd.focus();
		return false;
	}
}
</script>
</head>
<body style="align:center ;valign:middle">
<table>
			<tr>
           	 	<td height="295" width="100%">&nbsp;</td>
            </tr>
</table>
<form action="manager?action=login" method="post" name="form1" style="width:100%;" >
			<table style="width:100% ;cellpadding:0 ;cellspacing:0 ; padding-right:70;padding-bottom:100;padding-left:120;padding-top:100;" align="center"  >
			<tr>
				<td width="140">&nbsp;</td>
				<td width="90" align="center" >管理员名称：</td>
				<td width="20"><input type="text" name="name" id="name" size="30" class="logininput"></td>
			</tr>
			<tr>
				<td width="140">&nbsp;</td>	
           	</tr>
			<tr>
				<td width="140">&nbsp;</td>
				<td width="90" align="center">管理员密码：</td>
				<td><input name="pwd" type="password" id="pwd" size="30" class="logininput"></td>
			</tr>
			<tr>
           	 	<td height="20">&nbsp;</td>
           	 	<td>&nbsp;</td>
           	 	<td>&nbsp;</td>
            </tr>
			<tr>
				<td colspan="3" align="center" height="50">
				<input name="Submit" type="submit" value="确定" class="btn_grey" size="70" onClick="return check(form1)">&nbsp;&nbsp;&nbsp;
				<input name="Submit3" type="reset" value="重置" class="btn_grey" size="70" >&nbsp;&nbsp;&nbsp;
				<input name="Submit2" type="button" value="关闭" class="btn_grey" size="70" onClick="window.close();">
				</td>
			</tr>
			</table>
</form>
<table>
			<tr>
           	 	<td height="430" width="100%">&nbsp;</td>
            </tr>
</table>
           			 				
<table style="width:100%;height:27;border:0; cellpadding:0; cellspacing:0;" >
	<tr>
	<td align="center" valign="middle" class="word_login">
	CopyRight &copy; 2018 www.lib.uestc.edu.cn 图书馆管理系统版权所有<br>
	            </td>
	</tr>
  </table>				

</body>
</html>