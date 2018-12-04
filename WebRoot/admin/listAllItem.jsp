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
<s:if test="#request.pageBean.list.size>0">
竞赛项目管理
<table border="1" class="tab_css_1" width="80%">
 <tr>
   <th>项目名称</th>
   <th>项目介绍</th>
   <th>个人or团体</th>
   <th>参赛者</th>
   <th colspan="3">操作</th>
 </tr>
  <s:iterator value="#request.pageBean.list" id="item">
 <tr class="tr_css" align="center">
   <td><s:property value="#item.name"/></td>    
   <td><s:property value="#item.itemInfo"/></td>    
   <td><s:property value="#item.iort"/></td>  
   <td><a href = "#">点击查看</a></td>      
	<td>
	<s:a href="itemPreUpdate.action?itemid=%{#item.iid}">修改</s:a>
	</td>
	<td>
	<s:a href="itemDelete.action?itemid=%{#item.iid}" onclick="return confirm('确定删除该项目吗？');">删除</s:a>
	</td>
	<td>
	<s:a href="censusDepartment.action?itemid=%{#item.iid}" >各学院对比</s:a>
	</td>
	
 </tr>
 </s:iterator>
</table>

<s:iterator value="#request.pageBean" id="pageBean">
        <tr>
         <td colspan="6" align="center" bgcolor="#5BA8DE">
         共<s:property value="#pageBean.allRow"/>条记录    
         共<s:property value="#pageBean.totalPage"/>页    
         当前第<s:property value="#pageBean.currentPage"/>页<br>
    
         <s:if test="%{#pageBean.currentPage == 1}">
           第一页  上一页
         </s:if>
         <!-- currentPage为当前页 -->
         <s:else>
           <a href="/regist/listAllItem.action?page=1">第一页</a>
           <a href="/regist/listAllItem.action?page=<s:property value="%{#pageBean.currentPage-1}"/>">上一页</a>
         </s:else>
    
         <s:if test="%{#pageBean.currentPage != #pageBean.totalPage}">
         <a href="/regist/listAllItem.action?page=<s:property value="%{#pageBean.currentPage+1}"/>">下一页</a>
         <a href="/regist/listAllItem.action?page=<s:property value="#pageBean.totalPage"/>">最后一页</a>
            </s:if>
    
         <s:else>
         下一页  最后一页
         </s:else>
         </td>
        </tr>
</s:iterator>



</s:if>
<s:else>
  <font size="4" color="red">没有查询到任何记录</font>
</s:else>
</center>

</body>
</html>