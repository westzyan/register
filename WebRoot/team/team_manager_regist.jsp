<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<LINK href="css/theme.css" type="text/css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<center>
<s:if test="#request.item!=null">
已报名竞赛管理
<table border="1" class="tab_css_1" width="80%">
 <tr>
   <th>竞赛项目名</th>
   <th>竞赛项目介绍</th>
   
   <th colspan="2">操作</th>
 </tr>

 <tr class="tr_css" align="center">
   <td><s:property value="#request.item.name"/></td>    
   <td><s:property value="#request.item.itemInfo"/></td>    
	<td>
	<s:a href="withdrawal.action">退选</s:a>
	</td>
 </tr>

</table>

</s:if>
<s:else>
  <font size="4" color="red">没有任何记录</font>
</s:else>
</center>

</body>
</html>