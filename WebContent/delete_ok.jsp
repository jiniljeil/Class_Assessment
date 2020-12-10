<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- jsp directives: java 사용 가능, html 사용 가능, 페이지 인코딩 방식 (UTF-8)-->
<%@page import="com.client.dao.ClassDAO, com.client.bean.ClassVO"%> <!-- jsp directives: (class import) --> 
<%
	request.setCharacterEncoding("utf-8");
	String userid = pageContext.getSession().getAttribute("userID").toString();
	String userpw = pageContext.getSession().getAttribute("userPW").toString();
	
	String lectureName = request.getParameter("ln");
	
	if (userid != null){ 
		ClassDAO classDAO = new ClassDAO();
		classDAO.deleteClass(userid,lectureName);
		
		pageContext.getSession().setAttribute("userID", userid);
		pageContext.getSession().setAttribute("userPW", userpw);
		%><script>alert("데이터가 삭제 되었습니다!")</script><%
		response.sendRedirect("mylist.jsp");
	}
%>