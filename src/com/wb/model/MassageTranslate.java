package com.wb.model;

public class MassageTranslate {
	private int id;
	private int uid;
	private int mid;
public MassageTranslate(){}
public MassageTranslate(int uid,int mid){
	this.setUid(uid);
	this.setMid(mid);
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public int getMid() {
	return mid;
}
public void setMid(int mid) {
	this.mid = mid;
}
}
