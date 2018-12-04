<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆页面</title>

 <script> 
    function reload(){ 
        document.getElementById("code").setAttribute("src","code.jsp?a="+new Date().getTime()); 
    } 
    function regist(){ 
        window.top.location = "student_regist.jsp";
    } 
    </script>
</head>
<body>
  <center>
       ${tip }
    <form action="studentlogin.action" method="post">
    <table>
    <tr>
      <td>用户名</td>
      <td> <input type="text" name="student.number"></td>
       <td><s:fielderror fieldName="student.number"/></td>
    </tr>
    <tr>
      <td>密码</td>
      <td> <input type="password" name="student.password"></td>
    </tr>
    <tr>
    <TD>验证码：</TD>
	                <TD><INPUT 
	                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
	                  type=text maxLength=10 size=6 name="validateCode">
	                  <img width="80" id="code" style="CURSOR: pointer" onclick="reload();"  src="code.jsp" alt="点击刷新验证码">
	                  <a href="#" onclick="reload();">看不清</a>
	                  </TD>
    </tr>
    <tr>
      <td> <input type="submit"  value="登陆" /></td>
      <td> <a href="regist.jsp">还没注册？</a></td>
    </tr>
      </table> 
    </form>
    
    </center>
</body>
</html>
