package com.client.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.client.bean.ClientVO;
import com.client.common.JDBCUtil;

public class ClientDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	private final String C_SELECT = "select * from client where client_id=?";
	private final String C_DELETE = "delete from client where client_id=? and client_pw=?";
	private final String C_INSERT = "insert into client (client_id, client_pw, nickname, numofclass, hakbu, grade) values (?, ?, ?, ?, ?, ?)";
	private final String C_UPDATE_NIC = "update client set nickname=? where client_id=?";
	private final String C_UPDATE_PASS = "update client set password=? where client_id=?";
	// 회원 가입
	public int insertClient(ClientVO client) {
		int result = 0; 
		System.out.println("회원 가입");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_INSERT);
			stmt.setString(1, client.getClient_id());
			stmt.setString(2, client.getClient_pw());
			stmt.setString(3, client.getNickname());
			stmt.setInt(4, 0);
			stmt.setString(5,  client.getHarku());
			stmt.setInt(6,  client.getGrade());
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
	
	// 닉네임 변경 
	public int updateNickname(ClientVO client, String Nickname) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_UPDATE_NIC);
			stmt.setString(1, Nickname);
			stmt.setString(2, client.getClient_id());
			stmt.executeUpdate();
			return 1; 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return 0; 
	}
	
	// 패스워드 변경 
	public int updatePassword(ClientVO client, String NEW_PASS) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_UPDATE_PASS);
			stmt.setString(1, NEW_PASS);
			stmt.setString(2, client.getClient_id());
			stmt.executeUpdate();
			return 1; 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return 0;
	}
	
	// 계정 삭제 
	public void deleteClient(String client_id, String Password) {
		System.out.println("회원 탈퇴");
		try {
			conn = JDBCUtil.getConnection(); 
			stmt = conn.prepareStatement(C_DELETE);
			stmt.setString(1, client_id);
			stmt.setString(2, Password);
			stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
	}
	
	// 계정 데이터 가져오기 
	public ClientVO getClient(String client_id) {
		ClientVO client = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT);
			stmt.setString(1, client_id);
			rs = stmt.executeQuery();
			if( rs.next()) {
				client = new ClientVO(); 
				client.setClient_id(rs.getString("client_id"));
				client.setClient_pw(rs.getString("client_pw"));
				client.setNickname(rs.getString("nickname"));
				client.setNumofclass(rs.getInt("numofclass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return client; 
	}
	
	public boolean confirmID(String client_id) {
		boolean check = false; 
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(C_SELECT);
			stmt.setString(1, client_id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				check = true; 
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(SQLException s) {}
			try {stmt.close();}catch(SQLException s) {}
			try {conn.close();}catch(SQLException s) {}
		}
		return check ;
	}
	
}
