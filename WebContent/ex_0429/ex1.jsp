<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<%--redio나 checked박스는 value가 있어야한다.없으면 서버로 값이 안넘어감. --%>

<form action="ex1_ok.jsp" method="post">
	<p>아이디: <input type="text" name="id"> </p>
	<p>패스워드: <input type="text" name="pwd"> </p>
	<p>이름: <input type="text" name="name"> </p>
	<p>성별: <input type="radio" name="gender" value="남" checked="checked">남자 
			<input type="radio" name="gender" value="여">여자
							<%--checked사용하면 자동으로 남자가 선택되어진다.남여 다하면 마지막에 checked한게 적용됨. --%>
	</p>	
	<p>학력:
		<select name="hak">
			<option value="">::선택::</option>
			<option value="대졸" selected="selected">대졸</option>
			<option value="고졸">고졸</option>
			<option value="기타">기타</option>
		</select> 
	</p>
	<p>
		<input type="checkbox" name="hobby" value="운동">근육맨만들기
		<input type="checkbox" name="hobby" value="게임">누워서 게임하기
		<input type="checkbox" name="hobby" value="영화">영화보기
		<input type="checkbox" name="hobby" value="독서">설마 책보는 사람
		<input type="checkbox" name="hobby" value="음악">귀아프겠다...
		<input type="checkbox" name="hobby" value="여행">집에있기싫다
	</p>	
	<p>
		좋아하는 과목: <%--쪽지보내기할때 select박스 사용하고 굳이 사용하지 않음(대부분 div로 묶음) --%>
		<select name="subject" multiple="multiple" size="5">
			<option value="java">자바</option>
			<option value="spring">스프링</option>
			<option value="oracle">오라클</option>
			<option value="html">HTML</option>
			<option value="css">CSS</option>
		
		</select>
	</p>
	<p>
		메모:<%--rows:높이(height쓰는게 더 좋음 / cols:폭(width쓰는게 더 좋음) /name은 무조건 소문자--%>
		<textarea rows="5" cols="60"name="memo"></textarea>
	</p>
	<p> <%-- type에 아무것도 안쓰면 자동으로 submit --%>
		<button type="submit">보내기</button>
		<button type="reset">다시입력</button>
	</p>
	
</form>

</body>
</html>