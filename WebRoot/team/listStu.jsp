<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="../css/admin.css" type="text/css" rel="stylesheet">
<LINK href="../css/theme.css" type="text/css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<center>
<s:if test="#request.set.size>0">
<br><br>队伍人员<br><br><br><br><br>
<table border="1" class="tab_css_1" width="80%">
 <tr>
   <th>队伍名称</th>
   <th>指导老师</th>
   <th>学生学号</th>
   <th>学生姓名</th>
   <th colspan="2">操作</th>
 </tr>
  <s:iterator value="#request.set" id="s">
 <tr class="tr_css" align="center">
   <td>${sessionScope.team.name}</td>    
   <td>${sessionScope.team.teacher}</td>    
   <td><s:property value="#s.number"/></td>  
   <td><s:property value="#s.name"/></td>      
	
	<td>
	<s:a href="stuDelete.action?sid=%{#s.sid}" onclick="return confirm('确定删除该学生吗？');">删除</s:a>
	</td>
 </tr>
 </s:iterator>
</table>


</s:if>
<s:else>
  <font size="4" color="red">没有任何记录</font>
</s:else>
</center>

</body>
</html>