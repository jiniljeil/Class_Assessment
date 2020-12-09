<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.login{
		display: block ;
		margin-left: auto;
		margin-right: auto;
	}
	.mark{
		display: block ;
		margin-left: auto;
		margin-right: auto;
	}
	form input[type="text"], form input[type="password"]{
		width: 15%; 
		height: 10%;
		margin-bottom: 10px;
	}
	form input[type="button"], form input[type="submit"]{
		width: 80px; height: 100px;
		font-size: 15pt;
	}
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
</head>
<body>
	<div style="text-align:center; margin-top: 10%;" class="mark"> 
		<h3 style="font-size: 20pt;">Honey Lecture</h3>
		<img src="./img/mainimg.png" width="200px" height="200px" alt="img"/>
		<h3>꿀강에 오신걸 환영합니다~</h3>
		<form action="login.jsp" method="post" class="login">
			<input type="text" name="userid" placeholder="아이디를 입력하세요"/><br>
			<input type="password" name="userpw" placeholder="비밀번호를 입력하세요"/><br> 
			<input type="button" onclick="location.href='join.jsp'" value="회원 가입"/> 
			<input type="submit" value="로그인"/>
		</form>
	</div>
</body>
</html>