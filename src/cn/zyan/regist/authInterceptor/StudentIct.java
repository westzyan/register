package cn.zyan.regist.authInterceptor;

import org.apache.struts2.ServletActionContext;

import cn.zyan.regist.domain.Student;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class StudentIct extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("权限拦截器开始执行");
		Student obj = (Student) ActionContext.getContext().getSession().get("student");

		if(obj!=null)
		{
		    String str =  arg0.invoke();
		    System.out.println("权限拦截器结束执行");
		    return str;
		}
		else	
		{
			ServletActionContext.getRequest().setAttribute("message", "您没有权限进行此操作");
			return "message";
		}
	}

}
