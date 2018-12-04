<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>

 <script type="text/javascript">
  function checkTeam(){  
    var name = document.getElementById("name").value;  
  
    //传统的ajax校验  
    //1.创建异步交互对象，  
    var xhr = createXmlHttp();  
    //2设置监听  
    xhr.onreadystatechange = function(){  
        if(xhr.readyState == 4){  
            if(xhr.status == 200){  
                document.getElementById("span1").innerHTML = xhr.responseText;  
            }  
        }  
    }
      
	    //3打开连接  
	    xhr.open("GET","${pageContext.request.contextPath}/checkTeam.action?name="+name,true);  
	    //4发送  
	    xhr.send(null);       
    }     
          
    //创建XmlHttp对象  
    function createXmlHttp(){  
        var xmlHttp;  
        try{  
            xmlHttp= new XMLHttpRequest();  
        }catch(e){  
            try{  
                xmlHttp=new ActiveXObject("Msxm12.XMLHTTP");  
            }catch(e){  
                try{  
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                }catch(e){}  
            }             
        }  
          
         return xmlHttp;      
    }  
  </script>
<link rel="stylesheet" href="../css/admin.css" type="text/css"></link>
<link rel="stylesheet" href="../css/theme.css" type="text/css"></link>
<title>团队注册</title>

</head>
<body>
<br>
<br>
<br>
<div class="body-box" align="center">
    <form action="qisiren.action" method="post" >
       <table width="50%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
      			
			<tr>
          <td width="10%" class="pn-flabel pn-flabel-h">队名：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="team.name" id="name" onblur="checkTeam()"> <span id="span1"></span>  
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">密码：</td>
          <td width="40%" class="pn-fcontent">
             <input type="password" name="team.password" id="password"> 
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">指导老师：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="team.teacher" id="teacher">
          </td>
          </tr>
          
           <tr>
            <td width="40%" class="pn-fcontent" colspan="2">
             <div id="error" style="color:red"></div>
          </td>
          </tr>
				<tr>
					<td colspan="2" class="pn-fbutton" width="50%">
						<input type="submit" value="提交" class="submit"/> &nbsp; 
						<input type="reset" value="重置" class="reset" class="reset"/>
					</td>
				</tr>
       
       </table>
    
    </form>
    </div>
</body>
</html>