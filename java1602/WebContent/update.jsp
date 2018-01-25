<%@page import="com.mr.employee.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function btnClick(){
	window.location.href="QueryEmployee";
}
</script>
</head>
<body>
<%
Employee employee=(Employee)request.getAttribute("employee");
%>
<form action="UpdateEmployee" method="post">
编号<input type="text" name="id" value="<%=employee.getId()%>"/><br/>
名称<input type="text" name="name" value="<%=employee.getName()%>"/><br/>
性别<input type="text" name="sex" value="<%=employee.getSex()%>"/><br/>
职位<input type="text" name="business" value="<%=employee.getBusiness()%>"/><br/>
地址<input type="text" name="address" value="<%=employee.getAddress()%>"/><br/>
备注<input type="text" name="remark" value="<%=employee.getRemark()%>"/><br/>
<input type="submit" value="提交"/>
<input type="button" value="取消" onclick="btnClick()"/>
</form>
</body>
</html>