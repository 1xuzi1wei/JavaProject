<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mr.actionForm.PublishingForm" %>
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
<%
PublishingForm publishingForm = (PublishingForm)request.getAttribute("publishingModifyQuery");
String isbn = publishingForm.getIsbn();
String pubname = publishingForm.getPubname();
%>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：系统设置 &gt; 出版社设置&gt; 修改出版社信息 &gt;&gt;&gt;
	</td>
</tr>
</table>
 <form name="form1" method="post" action="publishing?action=publishingModify">
<table>
<tr>
	<td>出版社名称：</td>
	<td>
		<input name="isbn" type="hidden" value="<%=isbn%>">
		<input name="pubname" type="text" value="<%=pubname%>">
	</td>
</tr>

<tr>
			<td>&nbsp;</td>
			<td>
				<input name="submit" type="submit" value="保存" class="btn_grey" 
				onClick="return checkForm(form1)">
				<input name="submit1" type="reset" value="重置" class="btn_grey">
				<input name="submit2" type="button" value="返回" class="btn_grey" 
				onClick="history.back(-1);">
			</td>
</tr>
</table>
</form>
<%@include file="copyright.jsp" %>
</body>
</html>