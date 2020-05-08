<%@ page  contentType="text/html; charset=UTF-8"%> <%-- 해당 줄은 무조건 있어야한다. 안그럼 한글 깨짐 --%>
													<%-- res.setContentType("text/html; charset=utf-8"); 과 동일.나는 클라이언트한테, 텍스트html로 utf-8타입으로 보내주겠다.
															 없으면 utf-8코드가 안맞아서 글씨가 깨진다.
															브라우저에선 text를 읽을수있는데 이게 아니면 읽지 못한다.(문제발생) <ex>test/html로 바꾸면 파일다운로가 된다.(의도치않은 문제발생) --%>

<%
	//1~100까지 합
	int s=0;	
	for(int n=1;n<=100;n++){
		s+=n;
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
<!-- HTML주석 :클라이언트한테 보임 -->
<%--JSP주석:클라이언트한테 안보임 --%>
<p> 결과:<%=s%></p>


</body>
</html>

<!-- 서블릿 주소: 
	 C:\web\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\study2\org\apache\jsp\ex 
-->