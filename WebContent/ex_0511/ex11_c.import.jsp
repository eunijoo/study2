<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>홈페이지 실행 결과</h3>
<c:import url="http://www.google.com" var="google"/>
<c:out value="${google}" escapeXml="false"/>
<hr> 

<h3>홈페이지 소스보기</h3>
<c:import url="https://www.naver.com" var="naver"/>
<c:out value="${naver}"/>
<hr>

<h3>홈페이지 실행 결과</h3>
<c:import url="https://www.naver.com" var="naver"/>
<c:out value="${naver}" escapeXml="false"/>
<hr>



</body>
</html>