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
		<script type="text/javascript">
	    	function reg(form){
	        	if(form.username.value == ""){
	        		alert("用户不能为空！");
	        		return false;
	        	}
	        	if(form.password.value == ""){
	        		alert("密码不能为空！");
	        		return false;
	        	}
	        	if(form.repassword.value == ""){
	        		alert("确认密码不能为空！");
	        		return false;
	        	}
	        	if(form.password.value != form.repassword.value){
	        		alert("两次密码输入不一致！");
	        		return false;
	        	}
	        	if(form.question.value == ""){
	        		alert("密码找回问题不能为空！");
	        		return false;
	        	}
	        	if(form.answer.value == ""){
	        		alert("密码找回答案不能为空！");
	        		return false;
	        	}
	        	if(form.email.value == ""){
	        		alert("电子邮箱不能为空！");
	        		return false;
	        	}
	    	}
	    </script>
  </head>
  
  <body>
<div align="center">
			<div class="div1">
				<form action="SaveServlet" method="post" onsubmit="return reg(this);">
					<table align="center" border="0" width="500">
						<tr>
							<td align="right" width="30%" size ="9pt">用户名：</td>
							<td><input type="text" name="username" class="box"></td>
						</tr>
						<tr>
							<td align="right">密 码：</td>
							<td><input type="password" name="password" class="box"></td>
						</tr>
						<tr>
							<td align="right">确认密码：</td>
							<td><input type="password" name="repassword" class="box"></td>
						</tr>
						<tr> 
							<td align="right">性 别：</td>
							<td>
								<input type="radio" name="sex" value="男" checked="checked">男
								<input type="radio" name="sex" value="女">女
							</td>
						</tr>
						<tr>
							<td align="right">密码找回问题：</td>
							<td><input type="text" name="question" class="box"></td>
						</tr>
						<tr>
							<td align="right">密码找回答案：</td>
							<td><input type="text" name="answer" class="box"></td>
						</tr>
						<tr>
							<td align="right">邮 箱：</td>
							<td><input type="text" name="email" class="box"></td>
						</tr>
						<tr>
							<td colspan="2" align="center" height="40">
								<input type="submit" value="注 册">
								<input type="reset" value="重 置">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
  </body>
</html>
