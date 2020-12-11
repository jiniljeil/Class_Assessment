<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.client.common.JDBCUtil, com.client.bean.ClientVO"%>
<% 
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userid");
	String userPW = request.getParameter("userpw");
	String M_LIST = "select * from client where client_id=? and client_pw=?";
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	conn = JDBCUtil.getConnection();
	stmt = conn.prepareStatement(M_LIST);
	stmt.setString(1, userID);
	stmt.setString(2, userPW); 
	
	rs = stmt.executeQuery();
	ClientVO client = new ClientVO();
	boolean check = false ;
	if(rs == null) {response.sendRedirect("home.jsp"); return;}
	if(rs.next()){
		if(userID.equals("root") && userPW.equals("root")){
			response.sendRedirect("root.jsp");
			return;
		}else{
			if( rs.getString("client_id").equals(userID) && rs.getString("client_pw").equals(userPW)){
				client.setClient_id(rs.getString("client_id"));
				client.setClient_pw(rs.getString("client_pw"));
				client.setNickname(rs.getString("nickname"));
				client.setNumofclass(rs.getInt("numofclass")); 
				check = true;
			}
		}
	}
	
	if(check){
		//method="post"
		pageContext.getSession().setAttribute("userID", userID);
		pageContext.getSession().setAttribute("userPW", userPW);
		response.sendRedirect("list.jsp");
		return;
	}else{
		out.write("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); </script>");
		response.sendRedirect("index.jsp");
		return;
	}
	
%>