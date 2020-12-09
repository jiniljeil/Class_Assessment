<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h5>과목</h5>
	<input type="text" name="className" placeholder="강의 이름"/>
	<input type="text" name="professor" placeholder="교수님 이름"/> 
	<h5>수강한 학기</h5>
	<select name="listenTime">
		<option>2020년 1학기</option>
		<option>2020년 2학기</option>
		<option>2019년 1학기</option>
		<option>2019년 2학기</option>
		<option>2018년 1학기</option>
		<option>2018년 2학기</option>
	</select>
	<h5>성적 반영</h5>
	과제 <button>많음</button><button>보통</button><button>적음</button><br>
	팀플 <button>많음</button><button>보통</button><button>적음</button><br>
	학점 비율 <button>학점왕</button><button>비율</button><button>FM</button><button>F폭격기</button><br>
	시험 횟수 <button>4회</button><button>3회</button><button>2회</button><button>1회</button><br>
	<h5>총평</h5><button>5점</button><button>4점</button><button>3점</button><button>2점</button><button>1점</button>
	
	<label>강의 평가</label>
	<textarea rows="300px" cols="200px" placeholder="강의 버전"></textarea>
	
</body>
</html>