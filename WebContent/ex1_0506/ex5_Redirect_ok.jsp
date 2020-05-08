<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	String subject=request.getParameter("subject");
	int score=Integer.parseInt(request.getParameter("score"));
	String result="노력";
	if(score>=80){
		result="우수";
	}else if(score>=60){
		result="보통";
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

<p>다른페이지로 리다이렉트 되었으므로 이 페이지는 보이지 않는다.</p>
<p>subject:<%=subject %></p>
<p>score:<%=score %></p>
<p>result:<%=result %></p>

<%
	response.sendRedirect("ex5_Redirect_result.jsp?page=1");  //주석으로 막아도 정상작동됨.
%>

</body>
</html>