<%@page import="com.tag.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%
	List<User> list=new ArrayList<>();
	list.add(new User("이미현",26));
	list.add(new User("한준익",27));
	list.add(new User("노현호",26));
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3>커스텀 태그 예제</h3>

<p><my:hello/></p>
<p><my:sum num="1000"/>
<hr>

<my:forEach var="n" begin="1" end="5">
${n}번째<br>
</my:forEach>
<hr>

<my:forEach var="n" begin="5" end="1" step="-1">
${n}번째<br>
</my:forEach>
<hr>

<h3>단순한 forEach(이터레이터 돌림)</h3>
<my:forEach2 items="${list}" var="dto">
	<p>${dto.name} | ${dto.age}</p>
</my:forEach2>

</body>
</html>