package com.wb.model;

import java.sql.Date;
/**
 *anthor:tkz
 *
 * */
public class User extends UserPic{
	private int id;
	private String email;
	private String password;
	private String nikename;
	private Date time;
	private String phone;
	public User(){};
	public User(String email,String password,String nikename,String phone){
		this.email = email;
		this.password = password;
		this.setNikename(nikename);
		this.phone = phone;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNikename() {
		return nikename;
	}
	public void setNikename(String nikename) {
		this.nikename = nikename;
	}
}
