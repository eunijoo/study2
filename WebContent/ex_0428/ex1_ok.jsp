<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	String method = request.getMethod();

// 클라이언트가 보낸 정보를 넘겨받는다.
	String name= request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	
	String state="성인";
	if(age<19){
		state ="미성년자";
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

<h3> <%= method %>방식으로 데이터 전송 </h3>
<p>이름:<%=name %></p>
<p>나이:<%=age %></p>
<p><%=state %></p>

</body>
</html>