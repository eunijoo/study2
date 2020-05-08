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

<h3>출력방법</h3>
<%--표현식 통해서 출력하는 방법 --%> 
<%=(3+5) %><br>  

<%--out객체 통해서 출력하는 방법 --%>
<%
	out.print((3+5)+"<br>");
%>

<h3>pageContext</h3>
<p>
	<%=request == pageContext.getRequest() %>
</p>

<p>
	<%=out == pageContext.getOut() %>
</p>

<h3>파일업로드할때 사용하는 경로</h3>
<p>
	<%=pageContext.getServletContext().getRealPath("/")%>
</p>

<p>
	<%=page == this %>
</p>
</body>
</html>