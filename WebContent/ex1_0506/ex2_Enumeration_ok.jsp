<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//서버로 전송된 파라미터 이름 (클라이언트가 보낸 이름을 모르겟다할때)
	Enumeration<String> e=request.getParameterNames();
%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<%	//Elements는 while돌려야한다.
	while(e.hasMoreElements()){
		String pname=e.nextElement();
		String[] ss=request.getParameterValues(pname);  //getParameterValues를 통해서 배열로 받는다.
		for(String s:ss){
			out.print(pname+":"+s+"<br>");
		}
	}

%>

</body>
</html>