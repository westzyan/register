package cn.zyan.regist.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.zyan.regist.dao.StudentDao;
import cn.zyan.regist.domain.Student;

public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao{
	
	@Override
	public void save(Student student) {
		this.getHibernateTemplate().save(student);
	}

	@Override
	public void update(Student student) {
		this.getHibernateTemplate().update(student);
	}

	@Override
	public boolean login(String number, String password) {
		boolean flag = false;
		String hql = "from Student s where s.number = ? and s.password = ?";
		List<Student> list = this.getHibernateTemplate().find(hql,number,password);
		if(list.size() > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public Student findStudentByEmail(String email) {
		String hql = "from Student s where s.email = '"+ email+"'";
		List<Student> list = this.getHibernateTemplate().find(hql);
		for(Student student:list){
			return student;
		}
		return null;
	}

	@Override
	public Student findByNumber(String number) {
		String hql = "from Student s where s.number = ?";
		
		List<Student> list = this.getHibernateTemplate().find(hql,number);
		for(Student student:list){
			return student;
		}
		return null;
	}

	@Override
	public List find(String hql,int id) {
		return this.getHibernateTemplate().find(hql,id);
	}

	@Override
	public List find(String hql) {
		return this.getHibernateTemplate().find(hql);
	}
	

}
