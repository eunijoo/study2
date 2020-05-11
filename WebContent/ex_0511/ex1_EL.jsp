<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<p> ${3+5} </p> <%=3%> 을 대신하는 표현식.
<p> ${"3"+5} </p>
<p> ${3+null} </p>
<p> ${"A"+5} </p> 오류..
<p> ${10/5} </p>
<p> ${3/2} </p> 자동으로 double형으로 변환됨
<p> ${3>2 ? '큼' : '작음'} </p>
<p> ${empty "" ? '없음':'있음'} </p>
<p> ${empty null ? 'null':'null아님'} </p>
 <p> ${3==3?"같음":"다름"} </p>
 <p> ${3 eq 3?"같음":"다름"} </p>

<p> ${"서울" += "부산" } </p>
<p> ${1+2;2+3} </p> ;기준으로 좌변에 있는것은 출력 안해줌.
<p> ${a=10}${a} </p>
<p> ${a=10;a} </p>

<p> ${n=["a","b","c"]} </p>
<p> ${x=["x","y","z"];""} </p>
<p> ${x[1]} </p>

</body>
</html> --%>