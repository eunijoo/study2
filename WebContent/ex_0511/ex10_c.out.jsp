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
<h3>2의 몇승?</h3>
<c:set var="result" value="1"/> <%--c:set => setAttribute의 값을 request안에 저장하는 용도 --%>
<c:forEach var="a" begin="1" end="10">
	<c:set var="result" value="${result*2}"/>
	2의 ${a}승=${result}<br>
</c:forEach>
<hr>

<c:out value="<p>jstl을 이용한 출력입니다.<p>"/> <%-- html강좌 만들때 사용함.(태그가 태그로 출력됨) --%>
<hr>

<c:out value="<p>jstl을 이용한<b>출력<p>" escapeXml="true"/> 
<hr>

<c:out value="<p>jstl을 이용한 <b>출력<p>" escapeXml="false"/> <%--태그로 인식돼서 태그 출력안됨 --%>





</body>
</html>