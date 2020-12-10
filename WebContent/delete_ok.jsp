<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- jsp directives: java 사용 가능, html 사용 가능, 페이지 인코딩 방식 (UTF-8)-->
<%@page import="com.client.dao.ClassDAO, com.client.bean.ClassVO"%> <!-- jsp directives: (class import) --> 
<%
	request.setCharacterEncoding("utf-8");
	String userid = pageContext.getSession().getAttribute("userID").toString();
	String className = pageContext.getSession().getAttribute("className").toString();
	if (userid != ""){  
		
		ClassDAO classDAO = new ClassDAO();
		classDAO.deleteClass(userid, className);
	}
	response.sendRedirect("list.jsp");
%>