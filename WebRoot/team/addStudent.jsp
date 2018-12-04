<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <script type="text/javascript">
  
  </script>
<link rel="stylesheet" href="../css/admin.css" type="text/css"></link>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
<title>增加队员</title>

</head>
<body>
<h2 align="center">添加队员</h2>
<br>
<br>
<br>
<div class="body-box" align="center">
    <form action="addStudent.action" method="post">
       <table width="50%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
      			
			<tr>
			
          <td width="10%" class="pn-flabel pn-flabel-h">队员一学号：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="first" > 
          </td>
          <td><s:actionmessage cssStyle="color:red"/></td>
          </tr>
         
        
          <tr>
            <td width="40%" class="pn-fcontent" colspan="2">
             <div id="error" style="color:red"></div>
          </td>
          </tr>
				<tr>
					<td colspan="2" class="pn-fbutton" width="50%">
						<input type="submit" value="添加" class="submit"/> &nbsp; 
						<input type="reset" value="重置" class="reset" class="reset"/>
					</td>
				</tr>
       
       </table>
    
    </form>
    </div>
</body>
</html>