package com.client.bean;

import java.util.Date;

public class ClassVO {
	private String userID; 
	private String className;
	private String classEvaluation; // db 크기 변경 
	private Date currTime; 
	private int good; 
	private float point;
	private String hakbu;
	private String subject; 
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
	public Date getCurrTime() {
		return currTime;
	}
	public void setCurrTime(Date currTime) {
		this.currTime = currTime;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	public String getHakbu() {
		return hakbu;
	}
	public void setHakbu(String hakbu) {
		this.hakbu = hakbu;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
