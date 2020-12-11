<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- jsp directives: java 사용 가능, html 사용 가능, 페이지 인코딩 방식 (UTF-8)-->
<%@page import="com.client.dao.ClientDAO, com.client.dao.ClassDAO "%> <!-- jsp directives: (class import) -->

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.client.bean.ClassVO" /> <!-- Action Tag: BoardVO 클래스를 id (u)로 지정하여 bean 사용. -->
<jsp:setProperty property="*" name="u"/> <!--Action Tag: BoardVO에 모든 값 세팅 -->

<%
	String userid = pageContext.getSession().getAttribute("userID").toString();
	String userpw = pageContext.getSession().getAttribute("userPW").toString();
	
	String className = request.getParameter("cn");
	String listenTime = request.getParameter("listenTime");
	String totalEvaluation = request.getParameter("total");
	String others = request.getParameter("row1") + request.getParameter("row2") + request.getParameter("row3") + request.getParameter("row4")+request.getParameter("total"); ;
	String classEvaluation = request.getParameter("classEvaluation");
	
	ClassDAO dao = new ClassDAO();
	int i= dao.reviseClass(classEvaluation,listenTime,others, Integer.parseInt(totalEvaluation) ,className, userid);
	
	pageContext.setAttribute("userID", userid);
	pageContext.setAttribute("userPW", userpw);
	%> <script>게시물 수정 완료!</script><%
	response.sendRedirect("mylist.jsp");
%>