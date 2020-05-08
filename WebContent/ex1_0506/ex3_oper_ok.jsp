
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	String s;
	try{
		int num1=Integer.parseInt(request.getParameter("num1"));
		int num2=Integer.parseInt(request.getParameter("num2"));
		String oper=request.getParameter("oper");
		
		s=num1+"+"+num2+"=";
		//switch방식
		switch(oper){
			case "+":s+=(num1+num2); break;
			case "-":s+=(num1-num2); break;
			case "*":s+=(num1*num2); break;
			case "/":s+=(num1/num2); break;
		}
		//if방식
		// if(oper.equals("+")){  //String이여서 equals 써야함( '==' 안됨)
		// }		
	}catch(Exception e){
		s="자료입력이 잘못되었거나 시스템문제발생";
		e.printStackTrace();
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
<p>결과 :<%=s %></p>


</body>
</html>