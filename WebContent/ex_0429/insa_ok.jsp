<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String tel=request.getParameter("tel");
	String pay=request.getParameter("pay");
	String bonus=request.getParameter("bonus");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<table>
		<tr>
			<td>이름</td>
			<td><%=name %> </td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><%=birth%> </td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=tel %></td>
		</tr>
		<tr>
			<td>기본급</td>
			<td><%=pay %> </td>
		</tr>
		<tr>
			<td>수당</td>
			<td><%=bonus %> </td>
		</tr>
	</table>


</body>
</html>