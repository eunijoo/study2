<%@page import="com.user.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String s=(String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<h3>EL을 이용한 출력</h3>

<p> ${param.name} </p>
<p> ${vo.name} </p> <%--getter/setter 있어야 가능하다. --%>
<p> ${vo.age} </p>   <%--대소문자 명확하게 작성해야한다. --%>
<p> ${result} </p>


</body>
</html>