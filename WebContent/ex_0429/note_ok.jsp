<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String []user=request.getParameterValues("itemRight");
	String msg=request.getParameter("msg");
	
	String s="";
	if(user!=null){
		for(String id:user){
			s+=id+""+" ";
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
<p>받는사람:<%=s %> </p>
<p>내용... </p>
<pre><%=msg %></pre>
</body>
</html>