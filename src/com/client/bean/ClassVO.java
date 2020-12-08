package com.client.bean;

import java.util.Date;

public class ClassVO {
	private String userID; 
	private String className;
	private String classEvaluation; 
	private Date currTime; 
	private int good; 
	private int point;
	
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	} 
}
