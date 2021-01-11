package com.wb.model;

public class UserPic{
	private int id;
	private int user_id;
	private String url;
	public UserPic(){}
	public UserPic(int id,int user_id,String url){
		this.id = id;
		this.user_id = user_id;
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
