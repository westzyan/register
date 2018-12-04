<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>用户管理系统v1.0</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<link rel="stylesheet" href="../css/admin.css" type="text/css"></link>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
 <script> 
    function reload(){ 
        document.getElementById("code").setAttribute("src","code.jsp?a="+new Date().getTime()); 
    } 
    function regist(){ 
        window.top.location = "regist.jsp";
    } 
    </script>
</HEAD>
<BODY onload=document.form1.name.focus();>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor=#002779 
border=0>
  <TR>
    <TD align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD><IMG height=23 src="/../images/login_1.jpg" 
          width=468></TD></TR>
        <TR>
          <TD><IMG height=147 src="/../images/login_2.jpg" 
            width=468></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 bgColor=#ffffff border=0>
        <TR>
          <TD width=16><IMG height=122 src="/../images/login_3.jpg" 
            width=16></TD>
          <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=300 border=0>
              <FORM name=form1 action="login.action" method=post>
              <TR>
                <TD colspan="3">
                  <s:actionmessage cssStyle="color:red"/>
                </TD>
               </TR>
              <TR height=26>
                <TD></TD>
                <TD width="20%">用户名：</TD>
                <TD width="75%"><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  maxLength=30 size=20 name="user.uname"></TD></TR>
              <TR height=26>
                <TD>&nbsp; </TD>
                <TD>口　令：</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  type=password maxLength=30 size=20  name="user.upassword"></TD></TR>
               <TR height=26>
	                <TD>&nbsp; </TD>
	                <TD>验证码：</TD>
	                <TD><INPUT 
	                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
	                  type=text maxLength=10 size=6 name="validateCode">
	                  <img width="80" id="code" style="CURSOR: pointer" onclick="reload();"  src="code.jsp" alt="点击刷新验证码">
	                  <a href="#" onclick="reload();">看不清</a>
	                  </TD>
              </TR>
              
              <TR height=5>
                <TD colSpan=3></TD></TR>
              <TR>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>
                <INPUT type="reset" height=18 width=50 value="重置"
                  src="/../images/bt_login.gif">
                <INPUT type="submit" height=18 width=50 value="登录"
                  src="/../images/bt_login.gif">
                <INPUT type="button" height=18 width=50 value="注册" onclick="regist();"
                  src="/../images/bt_login.gif">
                  
                  </TD></TR></FORM></TABLE></TD>
          <TD width=16><IMG height=122 src="/../images/login_4.jpg" 
            width=16>
            </TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD><IMG height=16 src="/../images/login_5.jpg" 
          width=468></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD align=right><A href="http://www.865171.cn/" target=_blank><IMG 
            height=26 src="/../images/login_6.gif" width=165 
            border=0></A></TD></TR></TABLE></TD></TR></TABLE></BODY></HTML>
    