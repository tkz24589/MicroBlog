package com.wb.model;

import com.wb.model.User;
public class UserInfo extends User{
	private int id;
	private String truename;
	private String address;
	private String sex;
	private String birthday;
	private String bloodtype;
	private String intro;
	private String email;
	private String student_id;
	private String school;
	private int uid;
	public UserInfo(){}
	public UserInfo(String truename,String address,String sex,String birthday,String bloodtype,String intro,String email,String student_id,int uid,String school){
		this.truename = truename;
		this.address = address;
		this.sex = sex;
		this.birthday = birthday;
		this.bloodtype = bloodtype;
		this.intro = intro;
		this.email = email;
		this.setStudent_id(student_id);
		this.uid = uid;
		this.setSchool(school);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
}
