<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>操作成功！</title>
</head>

<body>
<%
int para = Integer.parseInt(request.getParameter("para"));
switch(para){
case 1:%>
			<script type="text/javascript">
			alert("管理员信息添加成功！");
			window.location.href= "manager?action=managerQuery";
			</script>

<% 
	break;
case 2:
%>
			<script type="text/javascript">
			alert("管理员权限设置成功!");
			window.location.href= "manager?action=managerQuery";
			</script>
<% 
	break;
case 3:
%>
			<script type="text/javascript">
			alert("管理员信息删除成功!");
			window.location.href= "manager?action=managerQuery";
			</script>
<%
	break;
}
%>
</body>
</html>