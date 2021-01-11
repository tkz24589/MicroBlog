package com.wb.model;

public class MassageAgree {
	private int id;
	private int mid;
	private int uid;
	public MassageAgree(){
		
	}
	public MassageAgree(int mid,int uid){
		this.setMid(mid);
		this.setUid(uid);
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

}
