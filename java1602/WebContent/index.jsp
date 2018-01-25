<%@page import="java.util.List"%>
<%@page import="com.mr.employee.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function toServlet(id){
	document.getElementById("id").value=id;
	document.getElementById("myform").submit();
}
</script>
</head>
<body>
<form action="QueryOneEmployee"
		method="post" id="myform">
		<table border="3">
			<tr>
				<td>编号</td>
				<td>名称</td>
				<td>性别</td>
				<td>职位</td>
				<td>地址</td>
				<td>备注</td>
				<td></td>
			</tr>
			<%
			List<Employee> list = (List<Employee>)request.getAttribute("emplist");
			if(list == null|| list.size()<1){
				out.print("没有数据");
			}else{
				for(Employee emp : list){
			%>
			<tr>
				<td><%=emp.getId()%></td>
				<td><%=emp.getName()%></td>
				<td><%=emp.getSex()%></td>
				<td><%=emp.getBusiness()%></td>
				<td><%=emp.getAddress()%></td>
				<td><%=emp.getRemark()%></td>
				<td>
					<input type="button" value="修改"
					onclick="toServlet('<%=emp.getId()%>')" />
				</td>
			<% 
			}
			}
			%>
			</table>
			<input type="hidden" id="id" name="id" value="" />
			</form>
</body>
</html>