<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO, com.client.bean.ClientVO, com.client.bean.ClassVO, com.client.dao.ClassDAO, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	String userID = pageContext.getSession().getAttribute("userID").toString();
	String userPW = pageContext.getSession().getAttribute("userPW").toString(); 
	
	String writer = request.getParameter("id");
	String lectureName = request.getParameter("ln");
	System.out.println(writer+ " " + lectureName);
	ClientDAO dao = new ClientDAO(); 
	ClientVO vo = dao.getClient(userID, userPW);
	
	ClassDAO class_dao = new ClassDAO();
	ClassVO class_vo = class_dao.getClass(writer, lectureName);
	
	String others = class_vo.getOthers();
	String[] row = new String[5];
	
	if(((others.charAt(0)) == '1')){
		row[0] = "많음";
	}else if(((others.charAt(0)) == '2')){
		row[0] = "보통";
	}else if(((others.charAt(0)) == '3')){
		row[0] = "적음"; 
	}
	
	if(((others.charAt(1)) == '1')){
		row[1] = "많음";
	}else if(((others.charAt(1)) == '2')){
		row[1] = "보통";
	}else if(((others.charAt(1)) == '3')){
		row[1] = "적음"; 
	}
	
	if(((others.charAt(2)) == '1')){
		row[2] = "학점왕";
	}else if(((others.charAt(2)) == '2')){
		row[2] = "비율에 맞춰";
	}else if(((others.charAt(2)) == '3')){
		row[2] = "FM"; 
	}else if(((others.charAt(2)) == '4')){
		row[2] = "F폭격기"; 
	}
	
	if(((others.charAt(3)) == '1')){
		row[3] = "1번";
	}else if(((others.charAt(3)) == '2')){
		row[3] = "2번";
	}else if(((others.charAt(3)) == '3')){
		row[3] = "3번"; 
	}else if(((others.charAt(3)) == '4')){
		row[3] = "4번"; 
	}
	
	if(((others.charAt(4)) == '1')){
		row[4] = "1";
	}else if(((others.charAt(4)) == '2')){
		row[4] = "2점";
	}else if(((others.charAt(4)) == '3')){
		row[4] = "3점"; 
	}else if(((others.charAt(4)) == '4')){
		row[4] = "4점"; 
	}else if(((others.charAt(4)) == '5')){
		row[4] = "5점"; 
	}
	
	pageContext.setAttribute("userID", userID);
	pageContext.setAttribute("userPW", userPW);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
h3{margin-top: 15px; margin-bottom:5px;}
h6{margin-bottom: 5px;}
.classinput{
	width:35%;
	display:inline-block;
}
select{
	width:100%;
	height:40px;
}
	input[type="submit"]{
		width: 120px; 
		height: 48px;
		font-size: 15pt;
		background-color: #A0A6AB;
		border-radius:5px;
		color:white;
		margin-top : 15px;
		margin-bottom : 15px;
		margin-left : auto;
		margin-right : auto;
	}
	.w3-container{
		margin-bottom : 10px;
	}
</style>
<body class="w3-content" style="max-width:1200px">
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide w3-center"><b>Honey Lecture</b></h3>
    <a href="#" class="w3-button w3-center">
		<img src="./img/mainimg.png" style="width:60%">
	</a>
    
  </div>
  
  <div class="w3-container w3-display-container w3-padding-8">
  	<p><input class="w3-input w3-border" type="text" placeholder="Search" style="width:100%"></p>
  	<button type="button" class="w3-button w3-yellow w3-margin-bottom" style="width:100%">Search</button>
  </div>
  
   <div class="w3-container w3-display-container w3-padding-8">
   	<div class="w3-row-padding">
   		<div class="w3-col s6">
   			<img src="./img/person.png" style="width:100%">
   		</div>
   		<div class="w3-col s6 w3-justify">   	
   			<h3 class="w3-wide w3-center"><b><%=vo.getNickname()%></b></h3>
   			<h6 class="w3-center" style="font-size:6pt"><%=vo.getHakbu() %></h6>
   		</div>
   	</div>
  </div>
  
  <div class="w3-padding-16 w3-large w3-text-grey" style="font-weight:bold">
  	<a href="addpost.jsp" class="w3-bar-item w3-button">강의 평가 작성하기</a>
    <a href="#" class="w3-bar-item w3-button">내가 쓴 강의 평가</a>
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      별점 확인 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>내가 준 평점</a>
      <a href="#" class="w3-bar-item w3-button">남이 준 평점</a>
      <a href="#" class="w3-bar-item w3-button">별점 순위 확인</a>
    </div>
    <a href="#" class="w3-bar-item w3-button">시간표 등록</a>
  </div>
  
  <a href="#footer" class="w3-bar-item w3-button w3-padding">Contact</a> 
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding" onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a> 
  <a href="#footer"  class="w3-bar-item w3-button w3-padding">Subscribe</a>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">Honey Lecture</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge" style="margin-bottom : 0px">
    <p class="w3-left">상세 정보</p>
    <p class="w3-right">
      <i class="fa fa-shopping-cart w3-margin-right"></i>
      <i class="fa fa-search"></i>
    </p>
  </header>
  <hr style="margin-top:0px; margin-bottom:30px; color:black; background-color:black;"></hr>
  
  
    <!-- Product grid -->
  <div class="w3-row w3-grayscale w3-padding w3-center" style="background-color:#FFE1A2; width:60%; margin-left:auto; margin-right:auto; margin-bottom:50px; border-radius:20px">

	      	 <div class="w3-container w3-padding">
	      		<span class="w3-left" style="font-size:30px"><%=class_vo.getClassName()%><br></span>
	      	 </div>
	      	 <div class="w3-container">
	      		<span class="w3-right" style="font-size:20px"><%=class_vo.getProfessor()%></span>
	      	 </div>
	      	 <div class="w3-container w3-row-padding">
	      		<div class="w3-col w3-right s1" style="padding:0px; vertical-align:middle; display:inline-block">
	   				<span class="w3-right" style="font-size:28px;"><%=row[4] %></span>
	   			</div>
	   			<!-- 별 수정 -->
	      		<div class="w3-col w3-right s1" style="padding:0px">
	   				<img src="./img/emptystar.png" style="width:100%">
	   			</div>
	   			<div class="w3-col w3-right s1" style="padding:0px">
	   				<img src="./img/fullstar.png" style="width:100%">
	   			</div>
	   			<div class="w3-col w3-right s1" style="padding:0px">
	   				<img src="./img/fullstar.png" style="width:100%">
	   			</div>
	   			<div class="w3-col w3-right s1" style="padding:0px">
	   				<img src="./img/fullstar.png" style="width:100%">
	   			</div>
	   			<div class="w3-col w3-right s1" style="padding:0px">
	   				<img src="./img/fullstar.png" style="width:100%">
	   			</div>
	      	</div>
	      	<div class="w3-container">
	      		<span class="w3-left" style="font-size:20px; font-weight:bold">수강한 학기</span>
	      		<span class="w3-right" style="font-size:20px"><%=class_vo.getListenTime() %></span>
	      	</div>
	      	<div class="w3-container">
	      		<span class="w3-left" style="font-size:20px; font-weight:bold">과제</span>
	      		<span class="w3-right" style="font-size:20px"><%=row[0]%></span>
	      	</div>
	      	<div class="w3-container">
	      		<span class="w3-left" style="font-size:20px; font-weight:bold">팀플</span>
	      		<span class="w3-right" style="font-size:20px"><%=row[1] %></span>
	      	</div>
	      	<div class="w3-container">
	      		<span class="w3-left" style="font-size:20px; font-weight:bold">학점비율</span>
	      		<span class="w3-right" style="font-size:20px"><%=row[2] %></span>
	      	</div>
	      	<div class="w3-container">
	      		<span class="w3-left" style="font-size:20px; font-weight:bold">시험 횟수</span>
	      		<span class="w3-right" style="font-size:20px"><%=row[3] %></span>
	      	</div>
	      	
	      	<hr style="margin:10px"></hr>
	      	<div class="w3-container w3-padding">
	      		<span class="w3-left"><%=class_vo.getClassEvaluation() %></span>
	      	</div>
	     </div>


</div>
</body>
</html>