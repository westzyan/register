package cn.zyan.regist.domain;

import java.util.Set;

public class Item {
	private Integer iid; 
	private String name;
	private String itemInfo;
	private String iort;
	private Set<Student> studentSet;
	public Integer getIid() {
		return iid;
	}
	public void setIid(Integer itemId) {
		this.iid = itemId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getItemInfo() {
		return itemInfo;
	}
	public void setItemInfo(String itemInfo) {
		this.itemInfo = itemInfo;
	}
	public String getIort() {
		return iort;
	}
	public void setIort(String iort) {
		this.iort = iort;
	}
	public Set<Student> getStudentSet() {
		return studentSet;
	}
	public void setStudentSet(Set<Student> studentSet) {
		this.studentSet = studentSet;
	}
	
	public Item(){
		
	}
}
