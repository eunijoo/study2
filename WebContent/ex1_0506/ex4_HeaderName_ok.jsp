<%@page import="java.util.Enumeration"%>
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

<%
	Enumeration<String> e=request.getHeaderNames();
	
	while(e.hasMoreElements()){
		String name=e.nextElement();
		String value=request.getHeader(name);
		out.print(name+":"+value+"<br>");
	}
%>
<p>
	이전주소:<%=request.getHeader("Referer") %>  <%--Referer은 해킹이 가능해서100%신뢰할수없다. 이전주소가 없을땐 null --%>
</p>
<p>
	유저 브라우저 및 OS:<%=request.getHeader("User-Agent") %><%--User-Agent: 지원하는 브라우저가 뭔지. --%>
</p>


</body>
</html>