<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>

 <script type="text/javascript">
  function checkEmail(){  
    var email = document.getElementById("email").value;  
    //传统的ajax校验  
    //1.创建异步交互对象，  
    var xhr = createXmlHttp();  
    alert(xhr);  
    //2设置监听  
    xhr.onreadystatechange = function(){  
        if(xhr.readyState == 4){  
            if(xhr.status == 200){  
                document.getElementById("span1").innerHTML = xhr.responseText;  
            }  
        }  
    }
      
	    //3打开连接  
	    xhr.open("GET","${pageContext.request.contextPath}/emailCheck.action?time="+new Date().getTime+"&email="+email,true);  
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
<title>用户注册</title>

</head>
<body>
<br>
<br>
<br>
<div class="body-box" align="center">
    <form action="register.action" method="post" >
       <table width="50%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
			<tr>
          <td width="10%" class="pn-flabel pn-flabel-h">姓名：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.name" id="name"> 
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">学号：</td>
          <td width="40%" class="pn-fcontent">
             <input type="text" name="student.number" id="number"> 
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">密码：</td>
          <td width="40%" class="pn-fcontent">
             <input type="password" name="student.password" id="psw">
          </td>
          </tr>
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">学院：</td>
          <td width="40%" class="pn-fcontent">
             <select name="student.department">
             
               <option value="信息学院">信息科学与工程学院 </option>
               <option value="粮食学院">粮食学院</option>
               <option value="土建学院">土建学院 </option>
               <option value="材料学院">材料学院</option>
               <option value="外语学院">外语学院</option>
               
             </select>
          </td>
          </tr>
          
          <tr>
          <td width="10%" class="pn-flabel pn-flabel-h">email：</td>
          <td width="40%" class="pn-fcontent">
            <input type="text" name="student.email" id="email" onblur="checkEmail()"><span id="span1"></span>  
          </td>
          </tr>
          
          <tr>
            <td width="40%" class="pn-fcontent" colspan="2">
             <div id="error" style="color:red"></div>
          </td>
          </tr>
				<tr>
					<td colspan="2" class="pn-fbutton" width="50%">
						<input type="submit" value="提交" class="submit"  onclick="return validate();"  /> &nbsp; 
						<input type="reset" value="重置" class="reset" class="reset"/>
					</td>
				</tr>
       
       </table>
    
    </form>
    </div>
</body>
</html>