<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@taglib prefix="s" uri="/struts-tags" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript">
  
  </script>
<link href="css/admin.css" rel="stylesheet" type="text/css"/>
<link href="css/theme.css" rel="stylesheet" type="text/css"/>
<title></title>

</head>
<body>
<div class="body-box">
    <form action="update.action" method="post">
       <table width="50%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
       <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">id：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.id" id="id" value="${student.sid}"  readonly="readonly">
          </td>
          </tr>
          
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">头像：</td>
          <td width="40%" class="pn-fcontent">
            <img src="./upload/${student.number}.jpg" width="50" height="50">
          
          </td>
          </tr>
			<tr>
          <td width="10%" class="pn-flabel pn-flabel-h">用户名：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.name" id="name" value="${student.name}"  >
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">学号：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.number" value="${student.number }"  readonly="readonly">
          </td>
          </tr>
         
         <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">密码：</td>
          <td width="40%" class="pn-fcontent">
             <input type="password" name="student.password" value="${student.password }">
          </td>
          </tr>
         
         <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">学院：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.department" value="${student.department }">
          </td>
          </tr>
         
         <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">email：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.email" value="${student.email }">
          </td>
          </tr>
         
          
				<tr>
					<td colspan="2" class="pn-fbutton" width="50%">
						<input type="submit" value="修改" class="submit"  onclick="return validate();"  /> &nbsp; 
						<input type="reset" value="重置" class="reset" class="reset"/>
					</td>
				</tr>
       
       </table>
    
    </form>
    </div>
</body>
</html>