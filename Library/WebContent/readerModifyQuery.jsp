<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mr.dao.ReaderDAO" %>
<%@ page import="com.mr.dao.ReaderTypeDAO" %>
<%@ page import="com.mr.actionForm.ReaderForm" %>
<%@ page import="com.mr.actionForm.ReaderTypeForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入读者姓名!");
		form.name.focus();
		return false;
	}
	if(form.paperNO.value==""){
		alert("请输入证件号码!");
		form.paperNO.focus();
		return false;
	}
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆管理系统</title>
</head>
<%
String str=null;
ReaderTypeDAO readerTypeDAO=new ReaderTypeDAO();
ReaderTypeForm readerTypeForm1 = new ReaderTypeForm ();
Collection<ReaderTypeForm> coll=(Collection<ReaderTypeForm>)readerTypeDAO.query(str,readerTypeForm1);
Iterator<ReaderTypeForm> it=coll.iterator();
ReaderForm readerForm= (ReaderForm) request.getAttribute("readerModifyQuery");
int id=Integer.valueOf(readerForm.getId());
String name=readerForm.getName();
String sex=readerForm.getSex();  
String barcode=readerForm.getBarcode();
String vocation=readerForm.getVocation();
String birthday=readerForm.getBirthday();
String paperType=readerForm.getPaperType();
String paperNO=readerForm.getPaperNO();
String tel=readerForm.getTel();
String email=readerForm.getEmail();
String createDate=readerForm.getCreateDate();
String remark=readerForm.getRemark();
String operator=readerForm.getOperator();
int readertypeid=readerForm.getReadertypeid();
String typename=readerForm.getTypename();
String typeName="";
int typeID=0;
%>

<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table>
<tr>
	<td valign="top" class="word_orange">
		当前位置：读者管理 &gt; 读者档案管理&gt; 修改读者信息 &gt;&gt;&gt;
	</td>
</tr>
</table>
<form name="form1" method="post" action="reader?action=readerModify">
<table>
	<tr>
		<td> <a href="#" onClick="window.open('readerAdd.jsp')">添加读者信息</a></td>
	</tr>
</table>
<table>
<tr>
	<td>姓名：</td>
	<td>
		<input name="id" type="hidden" value="<%=id%>">
		<input name="name" type="text" readonly="readonly" value="<%=name%>">
	</td>
</tr>

<tr>
	<td>姓别：</td>
	<td>
	<label>
	<input name="sex" type="radio" value="男" class="noborder" id="radio" <%if("男".equals(sex)) out.println("checked"); %>>
	男</label>
	<label>
	<input name="sex" type="radio" value="女" class="noborder" <%if("女".equals(sex)) out.println("checked"); %>>
	女</label>
	</td>
</tr>

<tr>
	<td>条形码：</td>
	<td>
		<input name="barcode" type="text" readonly="readonly" id ="barcode" value="<%=barcode%>">
	</td>
</tr>

<tr>
	<td>读者类型：</td>
	<td>
		<select name="readertypeid" class="wenbenkuang" id="readertypeid">			
	<%
		while(it.hasNext()){
			ReaderTypeForm readerTypeForm=(ReaderTypeForm)it.next();
			typeID = Integer.valueOf(readerTypeForm.getId());
			typeName = readerTypeForm.getName();
		%>
				<option value="<%=typeID%>" <%if(readertypeid == typeID) out.println("selected");%>><%=typeName%></option>

		<%}%>
		</select>
	</td>
</tr>

<tr>
        <td>职业：</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=vocation%>"></td>
</tr>

<tr>
		 <td>出生日期：</td>
		 <td><input name="birthday" type="text" id="birthday" value="<%=birthday%>"></td>
</tr>
<tr>
		<td>有效证件：</td>
		<td><select name="paperType" class="wenbenkuang" id="paperType">
			<option value="学生证" <%if("学生证".equals(paperType)) out.println("selected"); %>>学生证</option>
			<option value="身份证" <%if("身份证".equals(paperType)) out.println("selected"); %>>身份证</option>
			<option value="军官证" <%if("军官证".equals(paperType)) out.println("selected"); %>>军官证</option>
			<option value="工作证" <%if("工作证".equals(paperType)) out.println("selected"); %>>工作证</option>
			<option value="港澳台通行证" <%if("港澳台通行证".equals(paperType)) out.println("selected"); %>>港澳台通行证</option>
		</select></td>
</tr>
<tr>
        <td>证件号码：</td>
        <td><input name="paperNO" type="text" id="paperNO" value="<%=paperNO%>">  * </td>
</tr>
<tr>
        <td align="center">电话：</td>
        <td><input name="tel" type="text" id="tel" value="<%=tel%>"></td>
</tr>
 <tr>
        <td>Email：</td>
        <td><input name="email" type="text" id="email" value="<%=email%>">
        <input name="operator" type="hidden" id="operator" value="<%=operator%>"></td>
</tr>
<tr>
        <td>操作员：</td>
        <td><input name="operator" type="text" id="operator" value="<%=operator%>" readonly="readonly">
        </td>
</tr>

<tr>
        <td>备注：</td>
        <td><textarea name="remark" class="wenbenkuang" id="remark"><%=remark%></textarea></td>
</tr>
      
<tr>
    <td>
        <input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
		<input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back()">
	</td>
</tr>
</table>
</form>
<%@include file="copyright.jsp" %>
</body>
</html>
