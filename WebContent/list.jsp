<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   			<h3 class="w3-wide w3-center"><b>ê¹ì§ì¼</b></h3>
   			<h6 class="w3-center" style="font-size:6pt">ì ì°ì ìê³µíë¶</h6>
   		</div>
   	</div>
  </div>
  
  <div class="w3-padding-16 w3-large w3-text-grey" style="font-weight:bold">
  	<a href="#" class="w3-bar-item w3-button">ì¬ê¸°ë</a>
    <a href="#" class="w3-bar-item w3-button">ë­ë£ì§</a>
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      ë³ì  íì¸ <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>ë´ê° ì¤ íì </a>
      <a href="#" class="w3-bar-item w3-button">ë¨ì´ ì¤ íì </a>
      <a href="#" class="w3-bar-item w3-button">ë³ì  ìì íì¸</a>
    </div>
    <a href="#" class="w3-bar-item w3-button">ìê°í ë±ë¡</a>
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
    <p class="w3-left">내가 준 평점</p>
    <p class="w3-right">
      <i class="fa fa-shopping-cart w3-margin-right"></i>
      <i class="fa fa-search"></i>
    </p>
  </header>
  
    <!-- Product grid -->
  <div class="w3-row w3-grayscale w3-padding">
  
    <div class="w3-col l6 s6 w3-padding">
      <div class="w3-container w3-white w3-margin-bottom" style="border-radius:20px">
      	<div class="w3-container w3-padding">
      		<span class="w3-left" style="font-size:30px">기독교와 비교종교<br></span>
      	</div>
      	<div class="w3-container">
      		
      		<span class="w3-right">김기호 교수</span>
      	</div>
      	<div class="w3-container w3-row-padding">
      		<div class="w3-col w3-right s1" style="padding:0px">
   				<span class="w3-right">별점</span>
   			</div>
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
      	<div class="w3-container w3-padding">
      		<span class="w3-center">This class is nice!</span>
      	</div>
      </div>
      <div class="w3-container w3-yellow w3-margin-bottom" style="border-radius:20px">
      	<div class="w3-container w3-padding">
      		<span class="w3-left" style="font-size:30px">기독교와 비교종교<br></span>
      	</div>
      	<div class="w3-container">
      		<span class="w3-right">김기호 교수</span>
      	</div>
      	<div class="w3-container">
      		<span class="w3-right">별점</span>
      	</div>
      	<div class="w3-container w3-padding">
      		<span class="w3-center">This class is nice!</span>
      	</div>
      </div>
    </div>


    <div class="w3-col l6 s6 w3-padding">
    
      <div class="w3-container w3-yellow w3-margin-bottom" style="border-radius:20px">
      	<div class="w3-container w3-padding">
      		<span class="w3-left" style="font-size:30px">기독교와 비교종교<br></span>
      	</div>
      	<div class="w3-container">
      		<span class="w3-right">김기호 교수</span>
      	</div>
      	<div class="w3-container">
      		<span class="w3-right">별점</span>
      	</div>
      	<div class="w3-container w3-padding">
      		<span class="w3-center">This class is nice!</span>
      	</div>
      </div>
      
       <div class="w3-container w3-yellow w3-margin-bottom" style="border-radius:20px">
      	<div class="w3-container w3-padding">
      		<span class="w3-left" style="font-size:30px">기독교와 비교종교<br></span>
      	</div>
      	<div class="w3-container">
      		<span class="w3-right">김기호 교수</span>
      	</div>
      	<div class="w3-container">
      		<span class="w3-right">별점</span>
      	</div>
      	<div class="w3-container w3-padding">
      		<span class="w3-center">This class is nice!</span>
      	</div>
      </div>
      
    </div>

  </div>
  


  <!-- End page content -->
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
</script>

</body>
</html>
