package com.wb.model;

public class MassagePic {
	private int id;
	private String url;
	private int mid;
	public MassagePic() {
		// TODO Auto-generated constructor stub
	}
	public MassagePic(String url,int mid){
		this.url = url;
		this.mid = mid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
}
