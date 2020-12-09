<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.client.dao.ClientDAO, com.client.bean.ClientVO" %>
<% 
	
	ClientDAO dao = new ClientDAO() ; 
	ClientVO vo = new ClientVO(); 
	
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String hakbu = request.getParameter("hakbu");
	String grade = request.getParameter("grade");
	
	vo.setClient_id(userid);
	vo.setClient_pw(password);
	vo.setNumofclass(0);
	vo.setNickname(nickname);
	vo.setHarku(hakbu);
	vo.setGrade(Integer.parseInt(grade));
	
	int result = dao.insertClient(vo);
	String msg =""; 
	if(result == 0 ){ // 
		msg = "회원 가입 실패";
	}else{
		msg = "회원 가입 성공!"; 
	}
%>

<script>
	alert('<%=msg%>');
	location.href='home.jsp';
</script>