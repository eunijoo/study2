<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
	
	String pageNum = request.getParameter("page");
	int current_page=1;
	if(pageNum!=null){
		current_page = Integer.parseInt(pageNum);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<div style="text-align: center;">
	<tf:paginate total_page="2555" uri="ex2_paginate.jsp" current_page="<%=current_page%>"/>
</div>

</body>
</html>