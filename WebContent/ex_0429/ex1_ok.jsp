<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String hak=request.getParameter("hak");
	
	//String hobby=request.getParameter("hobby"); //파라미터이름이 동일하면 하나만 넘겨받는다.
	//파라미터의 이름이 동일한 경우
	String []hh=request.getParameterValues("hobby");
	String hobby="";
	if(hh!=null){
		for(String h:hh){
			hobby+=h+"";
		}
	}
	String subject="";
	String []ss=request.getParameterValues("subject");
	if(ss!=null){
		for(String s:ss){
			subject+=s+"";
		}
	}
	String memo=request.getParameter("memo");
	memo=memo.replaceAll("\n", "<br>");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<p>아이디:<%=id %></p>
<p>패스워드:<%=pwd %></p>
<p>이름:<%=name %></p>
<p>성별:<%=gender %></p>
<p>학력:<%=hak %></p>
<p>취미:<%=hobby %></p>
<p>좋아하는과목:<%=subject %></p>
<p>메모:<%=memo %></p>

</body>
</html>