<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@taglib prefix="s" uri="/struts-tags" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript">
  
  </script>
<link href="../css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../css/theme.css" rel="stylesheet" type="text/css"/>
<title>修改项目</title>

</head>
<body>
<div class="body-box">
    <form action="itemUpdate.action" method="post">
       <table width="50%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
			<tr>
          <td width="10%" class="pn-flabel pn-flabel-h">项目id：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="item.iid" id="e" value="${item.iid}" readonly="readonly">
          </td>
          </tr>
			
			
			<tr>
          <td width="10%" class="pn-flabel pn-flabel-h">项目名称：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="item.name" id="name" value="${item.name}">
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">项目介绍：</td>
          <td width="40%" class="pn-fcontent">
             <textarea rows="10" cols="50" name="item.itemInfo">${item.itemInfo}</textarea>
          </td>
          </tr>
          
				<tr>
					<td colspan="2" class="pn-fbutton" width="50%">
						<input type="submit" value="修改" class="submit" /> &nbsp; 
						<input type="reset" value="重置" class="reset" class="reset"/>
					</td>
				</tr>
       
       </table>
    
    </form>
    </div>
</body>
</html>