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

<h3>서버로 전송 : text객체가 하나이면 엔터를 누르면 서버로 submit.</h3>

<form name="myForm" action="ex6_ok.jsp" method="post"> 
	<p> 이름: <input type="text" name="name"> </p> <%--input type="text"하면 이름 쓰고 엔터하면 서버로 간다. --%>
	
</form>

</body>
</html>