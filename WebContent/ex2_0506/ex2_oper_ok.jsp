<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="vo" class="com.calc.CalcVO"/> 
	<%--	jsp:useBean:객체 생성함.
			CalcVO vo=new CalcVO();와 유사.
	--%>


<jsp:setProperty property="*" name="vo"/> <%--이름이 같은것만 넘겨준다. --%>
<jsp:setProperty property="operator" name="vo" param="oper"/> <%--이름다르게 주는거.이렇게 짤 일이 없다. param:폼태그 이름 --%>
	<%--  setProperty 
		  vo.setNum1(Integer.parseInt(request.getParameter("num1"));
	--%>


<%
	String s="";
	switch(vo.getOperator()){
		case "+" : s="합: "+(vo.getNum1()+vo.getNum2()); break;
		case "-" : s="차: "+(vo.getNum1()+vo.getNum2()); break;
		case "*" : s="곱: "+(vo.getNum1()+vo.getNum2()); break;
		case "/" : s="몫: "+(vo.getNum1()+vo.getNum2()); break;
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

<%=s %>

</body>
</html>