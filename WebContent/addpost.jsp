<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.client.dao.ClientDAO, com.client.bean.ClientVO" %>
<%	
	String userid = pageContext.getSession().getAttribute("userID").toString();
	String userpw = pageContext.getSession().getAttribute("userPW").toString(); 
	ClientDAO dao = new ClientDAO(); 
	ClientVO vo = dao.getClient(userid, userpw);
	
	pageContext.getSession().setAttribute("userID", userid);
	pageContext.getSession().setAttribute("userPW", userpw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addpost_ok.jsp" method="post">
		<h5>과목</h5>
		<input type="text" name="className" placeholder="강의 이름"/>
		<input type="text" name="professor" placeholder="교수님 이름"/> 
		<label><%= vo.getHakbu()%></label>
		<h5>수강한 학기</h5>
		<select name="listenTime">
			<option value="202001">2020년 1학기</option>
			<option value="202002">2020년 2학기</option>
			<option value="201901">2019년 1학기</option>
			<option value="201902">2019년 2학기</option>
			<option value="201801">2018년 1학기</option>
			<option value="201802">2018년 2학기</option>
		</select>
		<h5>성적 반영</h5>
		
		과제 <input style="display:none;"type="text" name="row1"/><h3 onclick="first(this.id);" id="1">많음</h3><h3 onclick="first(this.id);" id="3">보통</h3><h3 onclick="first(this.id);" id="3">적음</h3><br>
		팀플 <button>많음</button><button>보통</button><button>적음</button><br>
		학점 비율 <button>학점왕</button><button>비율</button><button>FM</button><button>F폭격기</button><br>
		시험 횟수 <button>4회</button><button>3회</button><button>2회</button><button>1회</button><br>
		<h5>총평</h5><button>5점</button><button>4점</button><button>3점</button><button>2점</button><button>1점</button>
		
		<label>강의 평가</label>
		<textarea rows="300px" cols="200px" placeholder="강의 버전"></textarea>
	</form>
	<script>
		function first(var id){
			document.getElementsByName('row1').value = id; 
		}
	</script>
</body>
</html>
