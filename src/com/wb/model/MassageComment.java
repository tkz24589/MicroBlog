package com.wb.model;

import java.sql.Date;

public class MassageComment {
	private int id;
	private int mid;
	private int uid;
	private String info;
	private Date time;
	public MassageComment(){}
	public MassageComment(int mid,int uid,String info){
		this.setMid(mid);
		this.setUid(uid);
		this.setInfo(info);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

}
