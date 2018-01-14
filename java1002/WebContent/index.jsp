<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	function check(form){
		with(form){
			if(name.value == ""){
				alert("图书名称不能为空");
				return false;
			}
			if(price.value == ""){
				alert("价格不能为空");
				return false;
			}
			if(author.value == ""){
				alert("作者不能为空");
				return false;
			}
			return true;
		}
	}
</script>

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
  </head>
  
  <body>
    	<form action="AddBook.jsp" method="post" onsubmit="return check(this);">
		<table align="center" width="450">
			<tr>
				<td align="center" colspan="2">
					<h2>添加图书信息</h2>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="right">图书名称：</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td align="right">价　　格：</td>
				<td><input type="text" name="price" /></td>
			</tr>
			<tr>
				<td align="right">数　　量：</td>
				<td><input type="text" name="bookCount" /></td>
			</tr>
			<tr>
				<td align="right">作　　者：</td>
				<td><input type="text" name="author" /></td>
			</tr>
			<tr>
				<td align="right">ID：</td>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="添　加">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
