package cn.zyan.regist.domain;

import java.util.Set;

public class Team {
	private Integer tid;
	private String name;
	private String password;
	private String teacher;
	private Item item;
	private Set<Student> student1Set;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public Set<Student> getStudent1Set() {
		return student1Set;
	}
	public void setStudent1Set(Set<Student> studentSet) {
		this.student1Set = studentSet;
	}
	
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Team(){
		
	}
	
	public Team(Integer tid, String name, String password, String teacher,
			Item item, Set<Student> studentSet) {
		super();
		this.tid = tid;
		this.name = name;
		this.password = password;
		this.teacher = teacher;
		this.item = item;
		this.student1Set = studentSet;
	}
	
	
}
