<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page isErrorPage="true" %> <%--나는 에러페이지에요..를 나타냄 --%>

<%
	//IE는 자체적인 에러메시지가 출력되므로 내가 작성한 에러페이지를 출력하도록 설정.
	response.setStatus(HttpServletResponse.SC_OK);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<p>실행 중 오류 발생</p>
<p><%=exception.getClass().getName() %> </p>
<p><%=exception.toString() %> </p>
<p><%=exception.getMessage() %> </p>

</body>
</html>