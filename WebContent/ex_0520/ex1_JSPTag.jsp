<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<h5>JSP태그 실습</h5>
<p>지금은 <tf:now/> 입니다.</p>
<hr>

<h5>JSP태그 실습</h5>
<tf:header title="안녕하세요..."/>
<tf:header title="안녕하세요..." level="3"/>
<hr>

<h5>fragment태그 실습</h5>
<tf:header2>
	<jsp:attribute name="title">예제..</jsp:attribute>
</tf:header2>
<hr>

<h5>attribute태그 실습</h5>
<p>
	<tf:grade subject="자바" score="90"/>
</p>
<hr>

<h5>dynamic-attributes태그 실습</h5>
<p>
	<tf:select name="city" seoul="서울" busan="부산" incheon="인천"/>
</p>

</body>
</html>