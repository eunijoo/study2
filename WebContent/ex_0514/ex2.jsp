<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<form action="ex1_ok.jsp" method="post" enctype="multipart/form-data"> <%-- enctype="multipart/form-data 넣으면 getParameter가 못받음(null) --%>
	<p> 이름:<input type="text" name="name"></p>
	<p> 제목:<input type="text" name="subject"></p>
	<p> 파일:<input type="file" name="upload"></p>
	<button type="submit">확인</button>	


</form>

</body>
</html>