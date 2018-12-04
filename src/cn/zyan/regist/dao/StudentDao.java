package cn.zyan.regist.dao;

import java.util.List;

import cn.zyan.regist.domain.Student;

public interface StudentDao {
	public void save(Student student);
	public void update(Student student);
	public boolean login(String number,String password);
	public Student findStudentByEmail(String email);
	public Student findByNumber(String number);
	
	public List find(String hql,int id);
	public List find(String hql);
	
}
