package cn.zyan.regist.authInterceptor;

import org.apache.struts2.ServletActionContext;

import cn.zyan.regist.domain.Admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class AuthInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("权限拦截器开始执行");
		Admin obj = (Admin) ActionContext.getContext().getSession().get("admin");

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
