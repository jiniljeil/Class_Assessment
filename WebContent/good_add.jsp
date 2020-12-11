<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO, com.client.bean.ClientVO, com.client.bean.ClassVO, com.client.dao.ClassDAO, java.util.*" %>
<!DOCTYPE html>
<%  
	request.setCharacterEncoding("utf-8");
	String userID = pageContext.getSession().getAttribute("userID").toString();
	String userPW = pageContext.getSession().getAttribute("userPW").toString(); 
	
	ClassDAO classDAO = new ClassDAO(); 
	String good = request.getParameter("good");
	String writer_user = request.getParameter("user");
	String class_name = request.getParameter("lectureN");
	
	if( good != null && Integer.parseInt(good) == 1 && writer_user != null && class_name != null){
	  	System.out.println(writer_user + " " + class_name);
     	ClassVO class_vo = classDAO.getClass(writer_user, class_name);
	  	classDAO.goodAdd(class_vo);
	}
	%><script>alert("추천 완료!"); location.href='list.jsp';</script> <%
	pageContext.getSession().setAttribute("userID", userID);
	pageContext.getSession().setAttribute("userPW", userPW);
	
%>

