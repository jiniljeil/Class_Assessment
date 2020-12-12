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
	
	private final String C_INSERT = "insert into Class (userID, className, classEvaluation, listenTime, good, point, hakbu, professor, others) values (?,?,?,?,?,?,?,?,?) ";
	private final String C_DELETE = "delete from Class where userID=? and className=?";
	private final String C_UPDATE = "update Class set classEvaluation=?, listenTime=?, others=?, point=? where className=? and userID=?";
	private final String C_GOOD = "update Class set good=? where className=? and classEvaluation=?";
	private final String C_SELECT = "select * from Class";
	private final String C_SELECT_USER = "select * from Class where userID=?";
	private final String C_SELECT_SEARCH = "select * from Class";
	private final String C_SELECT_VIEW = "select * from Class where className=? and userID=?";
	
	public ClassVO getClass(String userID, String className) { 
		ClassVO one = null; 
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT_VIEW);
			stmt.setString(1, className );
			stmt.setString(2, userID);
			rs = stmt.executeQuery();
			
			if( rs.next()) {
				one = new ClassVO(); 
				one.setUserID(rs.getString("userID"));
				one.setClassName(rs.getString("className"));
				one.setClassEvaluation(rs.getString("classEvaluation"));
				one.setListenTime(rs.getString("listenTime"));
				one.setGood(rs.getInt("good"));
				one.setPoint(rs.getInt("point"));
				one.setHakbu(rs.getString("hakbu"));
				one.setProfessor(rs.getString("professor"));
				one.setOthers(rs.getString("others"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return one; 
	}
	// 게시물 뷰 
	public ArrayList<ClassVO> getList() { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				ClassVO one = new ClassVO();
				one.setUserID(rs.getString("userID"));
				one.setClassName(rs.getString("className"));
				one.setClassEvaluation(rs.getString("classEvaluation"));
				one.setListenTime(rs.getString("listenTime"));
				one.setGood(rs.getInt("good"));
				one.setPoint(rs.getInt("point"));
				one.setHakbu(rs.getString("hakbu"));
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
	
	public ArrayList<ClassVO> getListEven() { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT);
			rs = stmt.executeQuery();
			int count = 0 ;
			while(rs.next()) {
				if(count % 2 == 0) {
					ClassVO one = new ClassVO();
					one.setUserID(rs.getString("userID"));
					one.setClassName(rs.getString("className"));
					one.setClassEvaluation(rs.getString("classEvaluation"));
					one.setListenTime(rs.getString("listenTime"));
					one.setGood(rs.getInt("good"));
					one.setPoint(rs.getInt("point"));
					one.setHakbu(rs.getString("hakbu"));
					one.setProfessor(rs.getString("professor"));
					one.setOthers(rs.getString("others"));
					list.add(one);
				}
				count++;
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
	
	public ArrayList<ClassVO> getListOdd() { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT);
			rs = stmt.executeQuery();
			int count = 0; 
			while(rs.next()) {
				if( count % 2 != 0) {
					ClassVO one = new ClassVO();
					one.setUserID(rs.getString("userID"));
					one.setClassName(rs.getString("className"));
					one.setClassEvaluation(rs.getString("classEvaluation"));
					one.setListenTime(rs.getString("listenTime"));
					one.setGood(rs.getInt("good"));
					one.setPoint(rs.getInt("point"));
					one.setHakbu(rs.getString("hakbu"));
					one.setProfessor(rs.getString("professor"));
					one.setOthers(rs.getString("others"));
					list.add(one);
				}
				count++;
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
	
	public ArrayList<ClassVO> getListUserEven(String userID) { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT_USER);
			stmt.setString(1, userID);
			rs = stmt.executeQuery();
			int count = 0; 
			while(rs.next()) {
				if( count % 2 == 0 ) {
					ClassVO one = new ClassVO();
					one.setUserID(rs.getString("userID"));
					one.setClassName(rs.getString("className"));
					one.setClassEvaluation(rs.getString("classEvaluation"));
					one.setListenTime(rs.getString("listenTime"));
					one.setGood(rs.getInt("good"));
					one.setPoint(rs.getInt("point"));
					one.setHakbu(rs.getString("hakbu"));
					one.setProfessor(rs.getString("professor"));
					one.setOthers(rs.getString("others"));
					list.add(one);
				}
				count++;
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
	
	public ArrayList<ClassVO> getListUserOdd(String userID) { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT_USER);
			stmt.setString(1, userID);
			rs = stmt.executeQuery();
			int count = 0 ;
			while(rs.next()) {
				if( count % 2 != 0) {
					ClassVO one = new ClassVO();
					one.setUserID(rs.getString("userID"));
					one.setClassName(rs.getString("className"));
					one.setClassEvaluation(rs.getString("classEvaluation"));
					one.setListenTime(rs.getString("listenTime"));
					one.setGood(rs.getInt("good"));
					one.setPoint(rs.getInt("point"));
					one.setHakbu(rs.getString("hakbu"));
					one.setProfessor(rs.getString("professor"));
					one.setOthers(rs.getString("others"));
					list.add(one);
				}
				count++;
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
	
	public ArrayList<ClassVO> getListSearchEven(String lectureName) { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT_SEARCH);
//			stmt.setString(1, lectureName);
			rs = stmt.executeQuery();
			int count = 0; 
			while(rs.next()) {
				if( rs.getString("className").contains(lectureName)) {
					if( count % 2 == 0 ) {
						ClassVO one = new ClassVO();
						one.setUserID(rs.getString("userID"));
						one.setClassName(rs.getString("className"));
						one.setClassEvaluation(rs.getString("classEvaluation"));
						one.setListenTime(rs.getString("listenTime"));
						one.setGood(rs.getInt("good"));
						one.setPoint(rs.getInt("point"));
						one.setHakbu(rs.getString("hakbu"));
						one.setProfessor(rs.getString("professor"));
						one.setOthers(rs.getString("others"));
						list.add(one);
					}
					count++;
				}
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
	
	public ArrayList<ClassVO> getListSearchOdd(String lectureName) { 
		ArrayList<ClassVO> list = new ArrayList<ClassVO>();;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT_SEARCH);
//			stmt.setString(1, lectureName);
			rs = stmt.executeQuery();
			int count = 0 ;
			while(rs.next()) {
				if( rs.getString("className").contains(lectureName)) {
					if( count % 2 != 0) {
						ClassVO one = new ClassVO();
						one.setUserID(rs.getString("userID"));
						one.setClassName(rs.getString("className"));
						one.setClassEvaluation(rs.getString("classEvaluation"));
						one.setListenTime(rs.getString("listenTime"));
						one.setGood(rs.getInt("good"));
						one.setPoint(rs.getInt("point"));
						one.setHakbu(rs.getString("hakbu"));
						one.setProfessor(rs.getString("professor"));
						one.setOthers(rs.getString("others"));
						list.add(one);
					}
					count++;
				}
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
			stmt.setString(1, cv.getUserID());
			stmt.setString(2, cv.getClassName());
			stmt.setString(3, cv.getClassEvaluation());
			stmt.setString(4, cv.getListenTime());
			stmt.setInt(5,  0);
			stmt.setFloat(6, cv.getPoint());
			stmt.setString(7, cv.getHakbu());
			stmt.setString(8,  cv.getProfessor());
			stmt.setString(9, cv.getOthers());
			result = stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
	}
	
	// 게시물 수정 
	public int reviseClass(String classEvaluation, String listenTime, String others, int point, String className, String userID) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_UPDATE);
			stmt.setString(1, classEvaluation);
			stmt.setString(2, listenTime);
			stmt.setString(3, others);
			stmt.setInt(4, point);
			stmt.setString(5, className);
			stmt.setString(6, userID);
			stmt.executeUpdate();
			return 1; 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return 0;
	}
	
	public int goodAdd(ClassVO vo) {
		try {
			conn = JDBCUtil.getConnection(); 
			stmt = conn.prepareStatement("update Class set good=? where className=? and userID=?");
			stmt.setInt(1, vo.getGood()+1);
			stmt.setString(2, vo.getClassName());
			stmt.setString(3, vo.getUserID());
			stmt.executeUpdate();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return 0;
	}
}