<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO, com.client.bean.ClientVO, com.client.bean.ClassVO, com.client.dao.ClassDAO, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	String userID = pageContext.getSession().getAttribute("userID").toString();
	String userPW = pageContext.getSession().getAttribute("userPW").toString(); 
	ClientDAO dao = new ClientDAO(); 
	ClientVO vo = dao.getClient(userID, userPW);
	
	pageContext.getSession().setAttribute("userID", userID);
	pageContext.getSession().setAttribute("userPW", userPW);
	
	ClassDAO classDAO = new ClassDAO();
	
	String lecture = request.getParameter("lectureName");
	
	if( lecture != null) { 
		List<ClassVO> listEven = classDAO.getListSearchEven(lecture);
		List<ClassVO> listOdd = classDAO.getListSearchOdd(lecture); 
		request.setAttribute("listEven",listEven);
		request.setAttribute("listOdd",listOdd);
	}else{
		List<ClassVO> listEven = classDAO.getListEven();
		List<ClassVO> listOdd = classDAO.getListOdd(); 
		request.setAttribute("listEven",listEven);
		request.setAttribute("listOdd",listOdd);
	}
	
%>

<!DOCTYPE html>
<html>
<title>Honey Lecture</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
<body class="w3-content" style="max-width:1200px">

<!— Sidebar/menu —>
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16" style="margin-bottom:0px">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide w3-center"><b>Honey Lecture</b></h3>
    <a href="list.jsp" class="w3-button w3-center">
		<img src="./img/mainimg.png" style="width:60%">
	</a>
  </div>
  
  <form action="list.jsp" method="post">
	  <div class="w3-container w3-display-container w3-padding-8">
	  	<p><input class="w3-input w3-border" type="text" placeholder="Search" name="lectureName" style="width:100%"></p>
	  	<input type="submit" class="w3-button w3-yellow w3-margin-bottom" style="width:100%" value="Search"/>
	  </div>
  </form>
  
   <div class="w3-container w3-display-container w3-padding-8" style="margin-top:30px; margin-bottom:30px">
   	<div class="w3-row-padding">
   		<div class="w3-col s6">
   			<img src="./img/person.png" style="width:100%">
   		</div>
   		<div class="w3-col s6 w3-justify">   	
   			<h3 class="w3-center"><b><%=vo.getNickname()%></b></h3>
   			<h6 class="w3-center" style="font-size:10pt"><%=vo.getHakbu() %></h6>
   		</div>
   	</div>
  </div>
  
  <div class="w3-padding-16 w3-large w3-text-grey" style="font-weight:bold">
  	<a href="list.jsp" class="w3-bar-item w3-button w3-light-grey">전체 평가</a>
  	<a href="mylist.jsp" class="w3-bar-item w3-button">내가 쓴 강의 평가</a>
  	<a href="addpost.jsp" class="w3-bar-item w3-button">강의 평가 작성하기</a>
    <a href="#" class="w3-bar-item w3-button">시간표 등록</a>
  </div>
   
  <a href="madeby.jsp" class="w3-bar-item w3-button w3-padding">Madeby</a>
</nav>

<!— Top menu on small screens —>
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24">Honey Lecture</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!— Overlay effect when opening sidebar on small screens —>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!— !PAGE CONTENT! —>
<div class="w3-main" style="margin-left:250px">

  <!— Push down content on small screens —>
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!— Top header —>
  <header class="w3-container w3-xlarge">
    <p class="w3-left">전체 평점</p>
    <p class="w3-right">
      <i class="fa fa-shopping-cart w3-margin-right"></i>
      <i class="fa fa-search"></i>
    </p>
  </header>
  
    <!— Product grid —>
  <div class="w3-row w3-grayscale w3-padding">
  
    <div class="w3-col l6 s6 w3-padding">
      <c:forEach items="${listEven}" var="u">
	      <div class="w3-container w3-margin-bottom w3-display-container" style="border-radius:20px; background-color:#FFE1A2">
	      	 <div class="w3-container w3-padding">
	      	 	<a href="view.jsp?id=${u.getUserID()}&ln=${u.getClassName()}" class="w3-button w3-left" style="padding:0px">
					<span class="w3-left" style="font-size:30px">${u.getClassName()}<br></span>
				</a>
	      		<span class="w3-right" style="font-size:12px; margin-top:5px;">5</span>
	      		<a href="#" class="w3-button w3-right" style="width:30px; height:30px; padding:0px; margin-top:5px;">
					<img class="w3-right" src="./img/good.png" style="width:30px; height:30px">
				</a>
	      	 </div>
	      	 <div class="w3-container">
	      		
	      		<span class="w3-right" style="font-size:20px">${u.getProfessor()}</span>
	      	 </div>
	      	 <div class="w3-container w3-row-padding">
	      		<div class="w3-col w3-right s1" style="padding:0px">
	   				<span class="w3-right" id="point_lecture1">${u.getPoint()}</span>
	   			</div>
	   			<!-- 별 수정 -->
	   			<!-- <script>
		   			function left_star(){
		   				var result = "";
		   				var point = document.getElementById('point_lecture1').value;
		   				alert(point);
		   				for(var i = parseInt(point); i < 5; i++){
		   					document.write("<div class='w3-col w3-right s1' style='padding:0px'><img src='./img/emptystar.png' style='width:100%'></div>"));
		   				}
		   				for(var i = 0 ; i < parseInt(point); i++){
		   					document.write("<div class='w3-col w3-right s1' style='padding:0px'><img src='./img/fullstar.png' style='width:100%'></div>");
		   				}
		   			}
	   				left_star();
	   			</script> -->
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
	      	<hr style="margin:10px"></hr>
	      	<div class="w3-container w3-padding">
	      		<span class="w3-center">${u.getClassEvaluation()}</span>
	      	</div>
	     </div>
   </c:forEach>
     </div>
     
     <div class="w3-col l6 s6 w3-padding">
      <c:forEach items="${listOdd}" var="u">
      <div class="w3-container w3-margin-bottom w3-display-container" style="border-radius:20px; background-color:#FFE1A2">
      	<div class="w3-container w3-padding">
	      	 <a href="view.jsp?id=${u.getUserID()}&ln=${u.getClassName()}" class="w3-button w3-left" style="padding:0px">
				<span class="w3-left" style="font-size:30px">${u.getClassName()}<br></span>
			</a>
	      	<span class="w3-right" style="font-size:12px; margin-top:5px;">5</span>
	      	<a href="#" class="w3-button w3-right" style="width:30px; height:30px; padding:0px; margin-top:5px;">
				<img class="w3-right" src="./img/good.png" style="width:30px; height:30px">
			</a>
	    </div>
      	<div class="w3-container">
      		
      		<span class="w3-right" style="font-size:20px">${u.getProfessor()}</span>
      	</div>
      	<div class="w3-container w3-row-padding">
      		<div class="w3-col w3-right s1" style="padding:0px">
   				<span class="w3-right" id="point_lecture2">${u.getPoint()}</span>
   			</div>
   			<script>right_star();</script>
   			
   			
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
      	<hr style="margin:10px"></hr>
      	<div class="w3-container w3-padding">
      		<span class="w3-center">${u.getClassEvaluation()}</span>
      	</div>
      </div>
      </c:forEach>
      
    </div>
  </div>
  


  <!— End page content —>
</div>


<script>
// Accordion 
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();

// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

function right_star(){
	var result = "";
	var point = document.getElementById('point_lecture2').value;
	for(var i = parseInt(point); i < 5; i++){
		document.write("<div class='w3-col w3-right s1' style='padding:0px'><img src='./img/emptystar.png' style='width:100%'></div>"));
	}
	for(var i = 0 ; i < parseInt(point); i++){
		document.write("<div class='w3-col w3-right s1' style='padding:0px'><img src='./img/fullstar.png' style='width:100%'></div>");
	}
}

</script>

</body>
</html>
