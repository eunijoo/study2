<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript">
function send() {
	var name="자&바";
	var age=20;
//	var query="name="+name+"&age="+age;  //크롬은 &바 를 넘겨받지 못하고, IE는 400오류 => name을 인코딩해서 보내야함
	
	//자바스크립트로 인코딩
	var query="name="+encodeURIComponent(name)+"&age="+age; 
	var url="ex2_ok.jsp?"+query;
	
	location.href=url;
}

function send2() {
	//자바로 인코딩
	var name='<%=URLEncoder.encode("자&바","UTF-8")%>';
	var age=20;
	
	var query="name="+encodeURIComponent(name)+"&age="+age; 
	var url="ex2_ok.jsp?"+query;
	
	location.href=url;
}


</script>

</head>
<body>

<h3>GET 방식으로 파라미터 전송</h3>

<a href="ex2_ok.jsp?name=자+바&age=20">확인1</a> <%--자바스크립트는여기서 인코딩못함/자바는 가능함 --%>
<p><button type="button" onclick="send();">확인2</button></p>
<p><button type="button" onclick="send2();">확인3</button></p>

</body>
</html>