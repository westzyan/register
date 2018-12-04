<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML>
<HEAD>
<TITLE>管理页面</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Cache-Control content=no-cache>
<META http-equiv=Expires content=-1000>
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
	<FRAME name=header src="header.jsp" frameBorder=0 noResize scrolling=no>
	<FRAMESET cols="15%, *">
		<FRAME name=menu src="menu.htm" frameBorder=0 noResize scrolling=no>
		<FRAMESET rows="10%, *">
			<FRAME name=search src="search.jsp" frameBorder=0 noResize scrolling=no>
			<FRAME name=main src="main.jsp" frameBorder=0 noResize scrolling=auto>
	    </FRAMESET>
	</FRAMESET>
</FRAMESET>
<noframes>
<body>
您的浏览器不支持框架
</body>
</noframes>
</HTML>
