package com.client.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.client.bean.ClassVO;
import com.client.common.JDBCUtil;

public class ClassDAO {
	/*
	private String userID; 
	private String className;
	private String classEvaluation; // db 크기 변경 
	private Date currTime; 
	private int good; 
	private float point;
	private String hakbu;
	private String subject; 
	private String professor; 
	private String ohters; // 성적 반영 
	*/
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	private final String C_INSERT = "insert into from Class (className, classEvaluation, currTime, good, point, hakbu, subject, professor, others) values (?,?,?,?,?,?,?,?,?) ";
	private final String C_DELETE = "delete from Class where userID=? and className=?";
	private final String C_UPDATE = "update Class set classEvaluation=? where className=?";
	private final String C_GOOD = "update Class set good=? where className=? and classEvaluation=?";
	private final String C_SELECT = "select * from Class";
	
	// 게시물 뷰 
	public ArrayList<ClassVO> getList() { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				ClassVO one = new ClassVO();
				one.setClassName(rs.getString("className"));
				one.setClassEvaluation(rs.getString("classEvaluation"));
				one.setCurrTime(rs.getDate("currTime"));
				one.setGood(rs.getInt("good"));
				one.setPoint(rs.getFloat("point"));
				one.setHakbu(rs.getString("hakbu"));
				one.setSubject(rs.getString("subject"));
				one.setProfessor(rs.getString("professor"));
				one.setOthers(rs.getString("others"));
				list.add(one);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return list;
	}
	
	// 게시물 생성
	public int insertClass(ClassVO cv) {
		int result = 0 ; 
		conn = JDBCUtil.getConnection();
		try {
			stmt =  conn.prepareStatement(C_INSERT);
			stmt.setString(1, cv.getClassName());
			stmt.setString(2, cv.getClassEvaluation());
//			stmt.setDate(3, cv.getCurrTime());
			stmt.setInt(4,  0);
			stmt.setFloat(5, cv.getPoint());
			stmt.setString(6, cv.getHakbu());
			stmt.setString(7, cv.getSubject());
			stmt.setString(8,  cv.getProfessor());
			stmt.setString(9, cv.getOthers());
			result = stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return result; 
	}
	
	// 게시물 Good
	public void updateGood(ClassVO cv) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(C_GOOD);
			stmt.setInt(1,cv.getGood()+1);
			stmt.setString(2, cv.getClassName());
			stmt.setString(3, cv.getClassEvaluation());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
	}
	
	// 게시물 삭제
	public void deleteClass(String userID, String className) {
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(C_DELETE);
			stmt.setString(1, userID);
			stmt.setString(2, className);
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
	}
	
	// 게시물 수정 
	public void reviseClass(ClassVO cv) {
		
	}
}
