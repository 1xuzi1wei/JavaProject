<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script language="javascript">
function checkUser(userName){
	if(username.value == "")
	{
		alert("请输入用户名！");
	}else
	{
		createRequest('checkUser.jsp?user='+userName.value);
	}
}
function createRequest(url){
http_request = false;
if(window.XMLHttpRequest){
	http_request = new XMLHttpRequest();
}else if(window.ActiveXObject){
	try{
		http_request = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}
				}
					}
if(!http_request){
	alert("不能创建XMLHttpRequest对象实例！");
	return false;
}
	http_request.onreadystatechange = getResult;
	http_request.open('GET', url, true);
	http_request.send(null);
}

function getResult(){
	if(http_request.readyState == 4)
	{
		if(http_request.status == 200)
	{
		document.getElementById("toolTip").innerHTML = http_request.responseText;
		document.getElementById("toolTip").style.display = "block";
	}else{
		alert("您请求的页面有错误！");
		}
	}
}
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
	
	<style type="text/css">
	<!--
	#toolTip{
	position:absolute;
	left:331px;
	top:39px;
	width:98px;
	height:48px;
	padding-top:45px;
	padding-left:25px;
	padding-right:25px;
	z-index:1;
	display:none;
	color:red;
	background-image:url(images/toolTip.jpg);
	}
	-->
	</style>
  </head>
  
  <body>
   <form method="post" action="" name="form1">

<table width="509" height="352" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.gif">
  <tr>
    <td height="54">&nbsp;</td>
  </tr>
  <tr>
    <td height="253" valign="top">
	<div style="position:absolute;">

	
    <table width="100%" height="250" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="18%" height="54" align="right" style="color:#8e6723 "><b>用户名：</b></td>
        <td width="49%"><input name="username" type="text" id="username" size="32"></td>
        <td width="33%"><img src="images/checkBt.jpg" width="104" height="23" style="cursor:hand;" onClick="checkUser(form1.username);"></td>
      </tr>
      <tr>
        <td height="51" align="right" style="color:#8e6723 "><b>密码：</b></td>
        <td><input name="pwd1" type="password" id="pwd1" size="35"></td>
        <td rowspan="2">&nbsp;    <div id="toolTip"></div></td>
      </tr>
      <tr>
        <td height="56" align="right" style="color:#8e6723 "><b>确认密码：</b></td>
        <td><input name="pwd2" type="password" id="pwd2" size="35"></td>
        </tr>
      <tr>
        <td height="55" align="right" style="color:#8e6723 "><b>E-mail：</b></td>
        <td colspan="2"><input name="email" type="text" id="email" size="45"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="2"><input type="image" name="imageField" src="images/registerBt.jpg"></td>
      </tr>
    </table>
	</div>
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</form>
  </body>
</html>
