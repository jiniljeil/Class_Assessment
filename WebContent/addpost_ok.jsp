<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClassDAO,com.client.dao.ClientDAO, com.client.bean.ClientVO, com.client.bean.ClassVO" %>
<%
	String userid = pageContext.getSession().getAttribute("userID").toString();
	String userpw = pageContext.getSession().getAttribute("userPW").toString();
	/* userID, className, classEvaluation, listenTime, good, point, hakbu, subject, professor, others */
	
	String className = request.getParameter("className");
	String professor = request.getParameter("professor");
	String listenTime = request.getParameter("listenTime");
	String totalEvaluation = request.getParameter("");
	String others = request.getParameter("row1") + request.getParameter("row2") + request.getParameter("row3") + request.getParameter("row4") ;
	String classEvaluation = request.getParameter("classEvaluation");
	
	ClassDAO dao = new ClassDAO(); 
	ClientDAO client_dao = new ClientDAO();
	ClientVO client_vo = client_dao.getClient(userid, userpw);
	ClassVO vo = new ClassVO() ; 
	
	vo.setUserID(userid);
	vo.setClassName(className);
	vo.setClassEvaluation(classEvaluation);
	vo.setProfessor(professor);
	vo.setListenTime(listenTime);
	vo.setPoint(Integer.parseInt(totalEvaluation)); 
	vo.setGood(0);
	vo.setHakbu(client_vo.getHakbu());
	vo.setOthers(others);
	
	int result = dao.insertClass(vo);
	String msg =""; 
	if(result == 0 ){ // 
		msg = "게시물 업로드 실패";
	}else{
		msg = "게시물 업로드 성공!"; 
	}
	
	pageContext.setAttribute("userID", userid);
	pageContext.setAttribute("userPW", userpw);
	
%> 

<script>
	alert('<%=msg%>');
	location.href='list.jsp';
</script>
