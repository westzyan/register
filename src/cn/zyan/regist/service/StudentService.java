package cn.zyan.regist.service;

import java.text.ParseException;
import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import cn.zyan.regist.dao.StudentDao;
import cn.zyan.regist.domain.Student;
import cn.zyan.regist.exception.ServiceException;
import cn.zyan.regist.utils.MD5Util;
import cn.zyan.regist.utils.SendEmail;
//@Transactional
public class StudentService {
	private StudentDao studentDao;

	public StudentDao getStudentDao() {
		return studentDao;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public Student findByNumber(String number){
		return studentDao.findByNumber(number);
	}
	
	public void save(Student student){
		studentDao.save(student);
		System.out.println("service student save");
	}
	
	public void update(Student student){
		studentDao.update(student);
		System.out.println("service student update");
	}
	
	public boolean login(String number,String password){
		boolean flag = false;
		flag = studentDao.login(number, password);
		System.out.println("login service");
		return flag;
	}

	public void processregister(Student student) {
		student.setRegisterTime(new Date());
		student.setStatus(0);
		student.setValidateCode(MD5Util.encode2hex(student.getEmail()));
		
		studentDao.save(student);
		
		StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8080/regist/active.action?email=");
        sb.append(student.getEmail()); 
        sb.append("&validateCode="); 
        sb.append(student.getValidateCode());
        sb.append("\">http://localhost:8080/regist/active.action?email="); 
        sb.append(student.getEmail());
        sb.append("&validateCode=");
        sb.append(student.getValidateCode());
        sb.append("</a>");

        //发送邮件
        SendEmail.send(student.getEmail(), sb.toString());
        System.out.println("发送邮件");
	}

	public void processActivate(String email, String validateCode)throws ServiceException, ParseException {
		 //验证用户是否存在 
		Student student = studentDao.findStudentByEmail(email);
        if(student!=null) {  
            //验证用户激活状态  
            if(student.getStatus()==0) { 
                ///没激活
                Date currentTime = new Date();//获取当前时间  
                //验证链接是否过期 
                currentTime.before(student.getRegisterTime());
                if(currentTime.before(student.getLastActivateTime())) {  
                    //验证激活码是否正确  
                    if(validateCode.equals(student.getValidateCode())) {  
                        //激活成功， //并更新用户的激活状态，为已激活 
                        System.out.println("==sq==="+student.getStatus());
                        student.setStatus(1);//把状态改为激活
                        System.out.println("==sh==="+student.getStatus());
                        studentDao.update(student);
                    } else {  
                       throw new ServiceException("激活码不正确");  
                    }  
                } else { throw new ServiceException("激活码已过期！");  
                }  
            } else {
               throw new ServiceException("邮箱已激活，请登录！");  
            }  
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");  
        }  

    }
		
	
	
	
}
