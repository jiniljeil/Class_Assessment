<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join_ok.jsp" method="post" onSubmit="return check()">
		<input type="text" id="userid" placeholder="아이디를 입력해주세요." autofocus required/>
		<button onclick="confirmid()">중복 확인</button><br>
		<input type="password" onchange="checker()" name="password" id="password" placeholder="비밀번호를 입력해주세요." required/><br>
		<input type="password" onchange="checker()" id="cpassword" placeholder="비밀번호를 다시 입력해주세요." required/><br>
		<input type="text" placeholder="이름을 입력해주세요." required/><br>
		<input type="text" placeholder="학부를 입력해주세요." required/><br>
		<input type="text" placeholder="학년을 입력해주세요." required/><br>
		<input type="submit" value="가입하기"/> 
	</form>	
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