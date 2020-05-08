<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name=request.getParameter("name");
	String subject=request.getParameter("con");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


</head>
<body>


<div style="width: 600px;margin: 30px auto;">
	<div>
		<h4>|방명록</h4>
	</div>

	<form action="guest.jsp" method="post">
		<table style="width: 100%;margin-top: 10px;border-spacing: 0;border-collapse: collapse;">
			<tr height="30" style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
				<td align="center" width="100px">작성자</td>
				<td> <input type="text"> 
				</td>	
			</tr>
			<tr height="30" style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
				<td align="center">내용</td>
				<td> <textarea name="content" style="width: 98%;height: 50px;"></textarea> </td>	
			</tr>
			<tr>
				<td > 
					<button type="button">등록하기</button> 
					<button type="reset">다시입력</button> 
				</td>	
			</tr>
		</table>
		
	</form>
</div>

</body>
</html>