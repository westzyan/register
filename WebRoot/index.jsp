<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
        $(function () {
            var $butSub = $("button");
            var $inEmail = $(":input[name=student.email]");
            var $inNumber = $(":s[name='student.number']");

            // 密码等信息是否可用的标识
            var flags = true;
           
            $butSub.prop("disabled", true);

            $inEmail.change(function () {
                var email = $(this).val();
                email = $.trim(email);

                var $this = $(this);
                $this.nextAll("span").remove();
                $butSub.prop("disabled", true);

                var $span = $("<span style='color: red'></span>");

                if (email != "") {
                    var url = "emailCheck.action";
                    var args = {"email": email};
                    $.post(url, args, function (data) {
                        if (data == "0") { //  不可用
                            $this.after($span.text("邮箱不可用"));
                            flags = false;
                        } else if (data == "1") { //  可用
                            $this.after($span.css("color", "green").text("可用"));
                            $(":password").each(function () {
                                if ($(this).val() == "") {
                                } else {
                                    flagsNameAble = true;
                                    $butSub.prop('disabled', false);
                                }
                            })
                        } else {
                            alert("服务器错误");
                        }
                    })
                } else {
                    $this.after($span.text("名字不可为空"));
                    $butSub.prop("disabled", true);
                    this.focus();
                }
                return false;
            })

            
        })
    </script>
  </head>
  
  <body>
     <h1>个人注册页面</h1>
 <s:form action = "register.action" method = "post" namespace="/"  theme = "simple"  >
 	<table border = "1" width = "400">
 		<tr>
 			<td>姓名</td>
 			<td><s:textfield name = "student.name"/></td>
 		</tr>
 		<tr>
 			<td>学号</td>
 			<td><s:textfield name = "student.number" id="number"/></td>
 		</tr>
 		<tr>
 			<td>password</td>
 			<td><s:textfield name = "student.password"/></td>
 		</tr>
 		<tr>
 			<td>学院</td>
 			<td><s:textfield name = "student.department"/></td>
 		</tr>
 		<tr>
 			<td>email</td>
 			<td><s:textfield name = "student.email" id="email"/></td>
 		</tr>
 		
 		<tr>
 			<td><input type = "submit" value = "添加"></td>
 			<td><a href="login.jsp">已有账号去登录</a></td>
 		</tr>
 	</table>
 </s:form>
  </body>
</html>
