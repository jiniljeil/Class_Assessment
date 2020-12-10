<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO, com.client.bean.ClientVO, com.client.bean.ClassVO, com.client.dao.ClassDAO" %>
<%	
	request.setCharacterEncoding("utf-8");

	String userid = pageContext.getSession().getAttribute("userID").toString();
	String userpw = pageContext.getSession().getAttribute("userPW").toString(); 
	
	ClientDAO client_dao = new ClientDAO(); 
	ClientVO vo = client_dao.getClient(userid, userpw);
	
	String className = request.getParameter("ln_ed");
	
	ClassDAO class_dao = new ClassDAO(); 
	ClassVO class_vo = class_dao.getClass(userid, className);
	
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
	
	pageContext.setAttribute("userID", userid);
	pageContext.setAttribute("userPW", userpw);
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
  <div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left">평점 주기</p>
    <p class="w3-right">
      <i class="fa fa-shopping-cart w3-margin-right"></i>
      <i class="fa fa-search"></i>
    </p>
  </header>
  
      <!-- Product grid -->
  <div class="w3-row w3-grayscale w3-padding w3-center" style="background-color:#FFE1A2; width:60%; margin-left:auto; margin-right:auto; margin-bottom:50px">

	<form action="edit_ok.jsp?cn=<%=class_vo.getClassName()%>" method="post">
		<h3 class="w3-wide w3-center">과목</h3>
		<div class="w3-container" style="padding-left:0px; padding-right:0px">
		<label class="w3-input w3-border w3-left classinput"><%=class_vo.getClassName()%></label>
		<label class="w3-input w3-border w3-left classinput"><%=class_vo.getProfessor() %></label>
		<div class="w3-center-align" style="margin-left: auto;margin-right: auto;display:inline-block;width:30%"><label class="w3-border w3-center" ><%= vo.getHakbu()%></label>
		</div>
		
		</div>

		<h3 class="w3-center">수강한 학기</h3>
		<select class="w3-container" name="listenTime">
			<option selected value="<%=class_vo.getListenTime()%>"><%=class_vo.getListenTime() %></option>
			<option value="2020년 1학기">2020년 1학기</option>
			<option value="2020년 2학기">2020년 2학기</option>
			<option value="2019년 1학기">2019년 1학기</option>
			<option value="2019년 2학기">2019년 2학기</option>
			<option value="2018년 1학기">2018년 1학기</option>
			<option value="2018년 2학기">2018년 2학기</option>
		</select>
		
		<h3  class="w3-center">성적 반영</h3>

		<h6 class="w3-left">과제</h6> 
		<select class="w3-container" name="row1">
			<option selected value="<%=others.charAt(0)%>"><%=row[0] %></option>
			<option value="1">많음</option>
			<option value="2">보통</option>
			<option value="3">적음</option>
		</select>
		<h6 class="w3-left">팀플</h6> 
		<select class="w3-container" name="row2">
			<option selected value="<%=others.charAt(1)%>"><%=row[1] %></option>
			<option value="1">많음</option>
			<option value="2">보통</option>
			<option value="3">적음</option>
		</select>
		<h6 class="w3-left">학점 비율</h6> 
		<select class="w3-container" name="row3">
			<option selected value="<%=others.charAt(2)%>"><%=row[2] %></option>
			<option value="1">학점왕</option>
			<option value="2">비율에 맞춰</option>
			<option value="3">FM</option>
			<option value="4">F폭격기</option>
		</select>
		<h6 class="w3-left">시험 횟수</h6> 
		<select class="w3-container" name="row4">
			<option selected value="<%=others.charAt(3)%>"><%=row[3] %></option>
			<option value="1">1번</option>
			<option value="2">2번</option>
			<option value="3">3번</option>
			<option value="4">4번</option>
		</select>

		<h3  class="w3-center">총평</h3>
		<select class="w3-container" name="total">
			<option selected value="<%=others.charAt(4)%>"><%=row[4] %></option>
			<option value="1">1점</option>
			<option value="2">2점</option>
			<option value="3">3점</option>
			<option value="4">4점</option>
			<option value="5">5점</option>
		</select>
		
		<h3  class="w3-center">강의 평가</h3>
		<textarea rows="5px" cols="58%" name="classEvaluation" placeholder="강의 버전"><%=class_vo.getClassEvaluation() %></textarea>
		
		<input class="w3-button w3-center" type="submit" value="작성하기"/> 
		
	</form>
	
	</div>
</div>
</body>
</html>