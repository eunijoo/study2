<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");	
	
	//redirect 된 페이지는 request가 초기화되어 redirect 전에 요청된 정보는 없어진다.
	String subject=request.getParameter("subject");  //null
	String score=request.getParameter("score"); //null
	String pageNum=request.getParameter("page"); //jsp에서 page는 예약어

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<h3>redirect 된 페이지</h3>
<p><%=subject %></p>
<p><%=score %></p>
<p><%=pageNum %></p>

<p>
	일반적으로 DB에 insert,update,delete하거나 <br>
	로그인 후, 로그아웃 후에 redirect한다.
</p>
</body>
</html>