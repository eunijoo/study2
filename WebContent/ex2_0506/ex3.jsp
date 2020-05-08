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

<h3>include 지시어</h3>
<%@include file="ex3_inc.jsp" %>

<p>n:<%=n%></p>
<%--@include file="ex3_inc.jsp" --%> <!-- inc파일에 있는 n의 변수가 위에서 복붙되면서 선언이됐는데 여기서 또해주니까 오류.. -->

</body>
</html>