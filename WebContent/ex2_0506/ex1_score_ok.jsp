<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	int score=Integer.parseInt(request.getParameter("score"));
	
	String result="노력";
	if(score>=80){
		result="우수";
	}else if(score>=60){
		result="보통";
	}
	
	request.setAttribute("s",result); //setAttribute : 잠시보관(Map개념과 유사)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<p> 이 페이지에서 포워딩하는 경우 이 정보는 보이지 않는다. </p>
<jsp:forward page="ex1_score_result.jsp"/>

</body>
</html>