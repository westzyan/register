package cn.zyan.regist.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.zyan.regist.domain.Item;
import cn.zyan.regist.domain.Student;
import cn.zyan.regist.exception.ServiceException;
import cn.zyan.regist.service.StudentService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport{
	private Student student;
	private String validateCode;//登陆时的验证码
	private File photo;
	private String photoFileName;
	private String photoContentType;
	private String savePath;
	
	public void setSavePath(String value){
		this.savePath = value;
	}
	
	public String getSavePath() throws Exception{
		String str = ServletActionContext.getServletContext().getRealPath(savePath);
		return str;
	}
	
	
	
	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	//	public Student getModel() {
//		return student;
//	}
	
	
	private StudentService studentService;
	
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	/**
	 * 处理注册，将上传的头像命名为学号加文件类型上传，保证唯一性
	 * 先保存学生信息，然后发送邮件，使其去邮箱激活
	 * @return
	 * @throws FileNotFoundException
	 * @throws Exception
	 */
	public String register() throws FileNotFoundException, Exception{
		System.out.println("photoName"+photoFileName);
		String fileName;
		String suffix = photoFileName.substring(photoFileName.lastIndexOf("."));
		fileName = student.getNumber() + suffix;
		//以服务器的文件保存地址和学号加后缀为文件名上传；
		FileOutputStream fos = new FileOutputStream(getSavePath()+"\\"+fileName);
		photoFileName = fileName;
		FileInputStream fis = new FileInputStream(getPhoto());
		byte[] buffer = new byte[1024];
		int len = 0;
		while((len = fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		
		fos.close();

		
		System.out.println("woshi666666");
		
		System.out.println("woshistudent.name"+student.getName());
		studentService.processregister(student);
		ServletActionContext.getRequest().setAttribute("message","注册成功,请去邮箱激活该账户");
		return "register_success";
	}
	
	
	
	
	public String studentlogin(){
		
		Object obj = ActionContext.getContext().getSession().get("code");
		String code = obj==null?"":obj.toString();
		System.out.println("yanzhengma"+code);
		if(code.equalsIgnoreCase(this.validateCode))
		{
			if(studentService.login(student.getNumber(), student.getPassword())&&studentService.findByNumber(student.getNumber()).getStatus() == 1)
			{
				Student stu = studentService.findByNumber(student.getNumber());
				ActionContext.getContext().getSession().put("student", stu);
				return "success";
			}
			else
			{
				this.addActionMessage("登录失败，账号密码错误,或者是账户未激活");
				//ServletActionContext.getRequest().setAttribute("message","登录失败，可能是账户未激活");
			}
		}
		else
		{
			this.addActionMessage("校验码错误");
			//ServletActionContext.getRequest().setAttribute("message","校验码出错");
		}
		return "input";
	}
	
	
	public String Check() throws IOException{
		 HttpServletRequest request = (HttpServletRequest) ActionContext
                 .getContext()
                 .get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		String email = request.getParameter("email");//获取email
		System.out.println("email"+email);
		Student s = studentService.getStudentDao().findStudentByEmail(email);
		System.out.println("woshi zhaodao de email"+s);
		HttpServletResponse response=  ServletActionContext.getResponse();  
	    response.setContentType("text/html;charset=UTF-8");  
	    if(s != null){  
	        //存在  
	        response.getWriter().println("<font color='red'>该邮箱已被占用</font>");  
	    }else{  
	        response.getWriter().println("<font color='green'>该邮箱可以使用</font>");  
	    }  

		return NONE;		
	}
	
	
	public String active()throws ServiceException, ParseException{
		//获得原生态rquest
		          HttpServletRequest request = (HttpServletRequest) ActionContext
		                  .getContext()
		                  .get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
            //激活
        String email = request.getParameter("email");//获取email
        String validateCode = request.getParameter("validateCode");//激活码

        try {
           studentService.processActivate(email , validateCode);//调用激活方法
        } catch (Exception e) {
            request.setAttribute("message" , e.getMessage());
        }
        ServletActionContext.getRequest().setAttribute("message","激活成功，可以登录了");
		return "active_success";
	}
	public String listAllRegisted(){
		Student stu = (Student) ActionContext.getContext().getSession().get("student");
		String hql = "select i from Item i  join i.studentSet as s where s.sid= ?";
		List<Item> list = studentService.getStudentDao().find(hql,stu.getSid());
		for(Item i:list){
			System.out.println(i.getItemInfo()+"item info");
		}
		ServletActionContext.getRequest().setAttribute("list",list);
		return "success";
	}
	public String lookme(){
		String path= ServletActionContext.getServletContext().getRealPath("/");
		Student stu = (Student) ActionContext.getContext().getSession().get("student");
		stu.setValidateCode(path);
		System.out.println(stu.getValidateCode());
		ServletActionContext.getRequest().setAttribute("student",stu);
		return "success";
	}
}
