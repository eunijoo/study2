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
<%--인코딩은 자바가 함. 서버입장에서는 뭐로 인코딩해서 온지 몰라서 iso-8859-1로 디코딩됨.=>한글깨짐 --%>
<h3>POST 방식으로 서버로 전송</h3>
<form action="ex3_ok.jsp" method="post"> <%--ex1_ok :서버가 받을 주소이름 / method안쓰면 기본적으로 get --%>
	<p> 이름: <input type="text" name="name"> </p>
	<p> 나이: <input type="text" name="age"> </p>
	<p> 
		<button type="submit">보내기</button>
	</p>
</form>

</body>
</html>