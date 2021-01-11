package com.wb.model;

import java.sql.Date;

public class UserMassage {
	private int id;
	private String info;
	private Date time;
	private int collectnum;
	private int commentnum;
	private int transpondnum;
	private int agreenum;
	private int readnum;
	private int user_id;
	public UserMassage(){}
	public UserMassage(String info,int collectnum,int commentnum,int transpondnum,int agreenum,int readnum,int user_id){
		this.info = info;
		this.collectnum = collectnum;
		this.commentnum = commentnum;
		this.transpondnum = transpondnum;
		this.agreenum = agreenum;
		this.readnum = readnum;
		this.user_id = user_id;	
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getCollectnum() {
		return collectnum;
	}
	public void setCollectnum(int collectnum) {
		this.collectnum = collectnum;
	}
	public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}
	public int getTranspondnum() {
		return transpondnum;
	}
	public void setTranspondnum(int transpondnum) {
		this.transpondnum = transpondnum;
	}
	public int getAgreenum() {
		return agreenum;
	}
	public void setAgreenum(int agreenum) {
		this.agreenum = agreenum;
	}
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}
