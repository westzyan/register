package cn.zyan.regist.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Authentication extends Authenticator{
	String username = null;
	String password = null;
	public Authentication(){
		
	}
	public Authentication(String a,String b){
		this.username =a;
		this.password = b;
		
	}
	protected PasswordAuthentication getPasswordAuthentication(){
		PasswordAuthentication pa = new PasswordAuthentication(username, password);
	    return pa;
	}

}
