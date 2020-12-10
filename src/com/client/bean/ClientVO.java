package com.client.bean;

public class ClientVO {
	private String client_id; // primary key 
	private String client_pw;
	private String nickname; 
	private int numofclass;
	private String hakbu; 
	private int grade; 
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getClient_pw() {
		return client_pw;
	}
	public void setClient_pw(String client_pw) {
		this.client_pw = client_pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getNumofclass() {
		return numofclass;
	}
	public void setNumofclass(int numofclass) {
		this.numofclass = numofclass;
	}
	public String getHakbu() {
		return hakbu;
	}
	public void setHakbu(String hakbu) {
		this.hakbu = hakbu;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	} 
}
