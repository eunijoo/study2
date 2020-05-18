<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Cookie c1=new Cookie("subject",null);
	c1.setMaxAge(0);
	response.addCookie(c1);
	
	Cookie c2=new Cookie("name",null);
	c2.setMaxAge(0);
	response.addCookie(c2);
	
	Cookie c3=new Cookie("city",null);
	c3.setPath("/"); //setPath 설정한 것은 제거할때도 동리하게 setPath 설정
	response.addCookie(c3);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>쿠키제거</h3>
<p><a href="ex2.jsp">돌아가기</a></p>

</body>
</html>