<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	String []nu=request.getParameterValues("nums");
	String nums="";
	if(nu!=null){
		for(String n:nu){
			nums+=n+"";
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
<p>삭제한 번호: <%=nums %></p>

</body>
</html>