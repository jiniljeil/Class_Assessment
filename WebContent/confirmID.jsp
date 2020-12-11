<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	ClientDAO dao = new ClientDAO() ;
	boolean result = dao.confirmID(userid);
	String msg ;
	if(result){ 
		msg = "이미 사용중인 ID 입니다.";%>
		<script>
			alert('<%=msg%>');
		</script>
	<%} else { 
		msg = "입력하신 "+ userid+"는 사용하실 수 있는 ID 입니다.";
		%>
		<script>
			alert('<%=msg%>');
			location.href="join.jsp?user_id=<%=userid%>";
		</script>
	<%}
%>