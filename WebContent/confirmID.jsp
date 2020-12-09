<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO"%>
<%
	String userid = request.getParameter("userid");
	ClientDAO dao = new ClientDAO() ;
	boolean result = dao.confirmID(userid);
	
	if(result){ %>
		<center>
		<br/><br/>
		<h4>이미 사용중인 ID 입니다.</h4>
		</center>
	<%} else { %>
		<center>
		<br/><br/>
		<h4>입력하신 <%=userid %>는 사용하실 수 있는 ID 입니다.</h4>
		</center>
	<%}
%>