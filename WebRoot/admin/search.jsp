<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK href="${pageContext.request.contextPath}/css/admin.css" type="text/css" rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

<title>Insert title here</title>
</head>
<body>
	    <table align="center">
	    <form action="searchUser.action" target="main" method="post">
	      <tr>
	         <td>选择查询关键字</td>
	         <td>
	         <select name="searchType" >
				<option value="1" selected="selected">用户名</option> 
				<option value="2">性别</option> 
	         </select>
	         </td>
	         <td> <input type="text" name="searchValue"></td>
	         <td> <input type="submit" value="查询"> </td>
	         <td> <input type="reset" value="重置"> </td>
	     </form>
	    </table>

   
</body>
</html>