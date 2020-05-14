<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStream"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<%
	//multipart/form=data인 경우:request.getParameter()로 파라미터를 넘겨받을수 없다.
	String contentType =request.getContentType();
	out.println("<p> contentType:"+contentType+"<p>");
	
	out.println("<hr>");
	out.println("<h3>request로 넘어온 데이터</h3>");
	
	InputStream is= request.getInputStream();
	byte[] b= new byte[1024];
	int size;
	String s;
	while((size=is.read(b))!=-1){
		//application/x-www-form-urlencoded인경우
		//s=new String(b,0,size);
		//s=URLDecoder.decode(s,"utf-8");
		
		//multipart/form-data인 경우
		s=new String(b,0,size,"utf-8");
		out.println(s+"<br>");
	}
%>

</body>
</html>