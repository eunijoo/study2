<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%> <%-- 소스보기에서 맨위에 공백화된 것을 제거해줌.(클라이언트한테 불필요한 공백을 안줌.ㅋ --%>
<%
	String s=String.format("%1$tF %1$tA %1$tT",Calendar.getInstance());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<h3>메인화면</h3>
<p>
	최근 접속시간은<%=s%>입니다.
</p>
<button>클릭클릭</button>



</body>
</html>