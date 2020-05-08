<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	request.setCharacterEncoding("utf-8");

	String []cs=request.getParameterValues("chks");
	String chks="";
	if(cs!=null){
		for(String c:cs){
			chks+=c+"";
		}
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
<p>예약한 좌석: <%=chks %></p>


</body>
</html>