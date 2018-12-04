package cn.zyan.regist.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.zyan.regist.domain.Admin;


public class AdminDao extends HibernateDaoSupport{
	public boolean login(String name,String password){
		boolean flag = false;
		String hql = "from Admin a where a.name = ? and a.password = ?";
		List<Admin> list = this.getHibernateTemplate().find(hql,name,password);
		if(list.size() > 0){
			flag = true;
		}
		return flag;
		
	}
}
