<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8"); %>
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
		text-align:center; 
		margin-top: 5%;
	}
	.innerbox{
		margin-left: auto;
		margin-right: auto;
		margin-top:20px;
		padding : 20px;
		text-align : center; 
		width : 500px;
		background-color : #FFF3C8;
		border-radius : 20px;
		
	}
	.imgbox{
		margin-left: auto;
		margin-right: auto;
		width:150px;
	}
	.imgbox:hover {
		background-color:#FFF3C8;
	}
	h4{
		margin : 10px;
		text-align : left;
	}
	form input[type="text"], form input[type="password"]{
		width: 90%; 
		height: 40px;
		margin-bottom: 20px;
	}
	#userid{
		width: 66%; 
	}
	form input[type="button"], form input[type="submit"]{
		width: 120px; 
		height: 48px;
		font-size: 15pt;
		background-color: #A0A6AB;
		border-radius:5px;
		color:white;
		margin-top : 10px;
	}
	select{
		width: 90%; 
		height: 40px;
		margin-bottom: 20px;
	}
	button{
		width: 110px; 
		height: 48px;
		font-size: 15pt;
		background-color: #A0A6AB;
		border-radius:5px;
		color:white;
	}
	
</style>
</head>
<body>
	<div class="mark">
		<h3 style="font-size: 20pt;">Honey Lecture</h3>
		<div class="imgbox">
			<img src="./img/mainimg.png" width="150px" height="150px" alt="img" onclick="location.href='home.jsp'"/>
		</div>
		<div class="innerbox">
		<form action="join_ok.jsp" method="post" onSubmit="return check()">
			<h4>아이디</h4>
			<input type="text" id="userid" placeholder="아이디를 입력해주세요." autofocus required/>
			<button type="button" class="btn btn-secondary" onclick="confirmid()">중복 확인</button><br>
			<h4>비밀번호</h4>
			<input type="password" onchange="checker()" name="password" id="password" placeholder="비밀번호를 입력해주세요." required/><br>
			<h4>비밀번호 확인</h4>
			<input type="password" onchange="checker()" id="cpassword" placeholder="비밀번호를 다시 입력해주세요." required/><br>
			<h4>이름</h4>
			<input type="text" placeholder="이름을 입력해주세요." required/><br>
			<h4>학부</h4>
			<select size="1" name="hakbu" >
             	<option selected value="전체">-- 학부 선택 --</option>
				<option value="0001">글로벌리더십학부</option>
                <option value="0007">창의융합교육원(자연과학)</option>
                <option value="0008">창의융합교육원(인문사회)</option>
                <option value="0009">창의융합교육원(공학)</option>
                <option value="0011">국제어문학부</option>
                <option value="0012">언론정보문화학부</option>
                <option value="0013">커뮤니케이션학부</option>
                <option value="0021">경영경제학부</option>
                <option value="0022">법학부</option>
                <option value="0024">상담심리사회복지학부</option>
                <option value="0033">생명과학부</option>
                <option value="0041">ICT창업학부</option>
                <option value="0071">전산전자공학부</option>
                <option value="0077">기계제어공학부</option>
                <option value="0078">공간환경시스템공학부</option>
                <option value="0079">콘텐츠융합디자인학부 </option>
                <option value="0090">산업교육학부</option>
            </select>
			<h4>학년</h4>
			<select size="1" name="grade">
				<option selected value="전체">-- 학년 선택 --</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
			<input type="submit" value="가입하기"/> 
		</form>	
		</div>
	</div>

	<script>
		function check(){
	        var p = document.getElementById('password').value;
	        var cp = document.getElementById('cpassword').value;
			if(!documnet.getElementById('userid').value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!document.getElementByID('password').value){
				alert("비밀번호를 입력하세요.");
				return false; 
			}
	        if(p != cp){
	            alert("비밀번호가 서로 다릅니다. 다시 입력해주시기 바랍니다.");
	            return false;
	        }
	    }
		function checker() {
	        var pwd = document.getElementById('password').value;
	        var cpwd = document.getElementById('cpassword').value;
	        
	        if(pwd.length < 6 || pwd.length > 16 ){
	            window.alert('비밀번호는 6자리 이상, 16자리 이하만 사용 가능합니다.');
	            document.getElementById('password').value = document.getElementById('cpassword').value = '';
	            document.getElementById('same').innerHTML = '';
	        }
			
	        if(document.getElementById('password').value != '' && document.getElementById('cpassword').value != ''  ){
	            if(document.getElementById('password').value == document.getElementById('cpassword').value){
	                document.getElementById('same').innerHTML = "비밀번호가 일치합니다.";
	                document.getElementById('same').style.color = 'white';
	            }else{
	                document.getElementById('same').innerHTML="비밀번호가 일치하지 않습니다.";
	                document.getElementById('same').style.color = 'red';
	            }
	        }
			
	        if(cpwd != '' && pwd != cpwd){
	            alert("비밀번호가 서로 다릅니다. 다시 입력해주시기 바랍니다.");
	            return false;
	        }
	    }

	    function confirmid(){
			if(document.getElementById('userid').value == ""){
				alter("ID를 입력하세요.");
				return; 
			}
			var url = "confirmID.jsp?userid="+document.getElementById('userid').value; 
			open(url,"confirm","location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=5, height=2");
		}
	    
	</script>
</body>
</html>