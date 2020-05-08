<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	int a=10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<h3>표현식과 out.print()</h3>

<p>a:<%=a%></p> <%-- <%=a%> : 표현식(위에서 선언해준 변수a를 호출함) => %와 =사이에 공백이 있으면 안된다. --%>
<p>
<%
	out.print("a:"+a); 
%>

</p>




</body>
</html>