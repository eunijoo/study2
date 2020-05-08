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
	var f=document.insaForm;
	
	if(! f.name.value){
		return false;
	}
	if(!/^(\d)+$/.test(f.brith.value)){
		return false;
	}
	
}
</script>


</head>
<body>
<form name="insaForm" action="insa_ok.jsp" method="post">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"> </td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth"> </td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="tel"> </td>
		</tr>
		<tr>
			<td>기본급</td>
			<td><input type="text" name="pay"> </td>
		</tr>
		<tr>
			<td>수당</td>
			<td><input type="text" name="bonus"> </td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="send();">등록하기</button>
			</td>		
		</tr>	
	</table>
</form>

</body>
</html>