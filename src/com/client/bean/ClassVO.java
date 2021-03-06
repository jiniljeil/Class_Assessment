package com.client.bean;

import java.util.Date;

public class ClassVO {
	private String userID; 
	private String className;
	private String classEvaluation; // db 크기 변경 
	private String listenTime; 
	private int good; 
	private int point;
	private String hakbu; 
	private String professor; 
	private String others; // 성적 반영 
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassEvaluation() {
		return classEvaluation;
	}
	public void setClassEvaluation(String classEvaluation) {
		this.classEvaluation = classEvaluation;
	}
	public String getListenTime() {
		return listenTime;
	}
	public void setListenTime(String listenTime) {
		this.listenTime = listenTime;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getHakbu() {
		return hakbu;
	}
	public void setHakbu(String hakbu) {
		this.hakbu = hakbu;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	} 
}
