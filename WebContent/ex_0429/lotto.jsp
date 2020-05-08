<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	int rows=9;
	int cols=5;
	
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
		<td>꿈의 로또</td>
	</tr>
	<tr>
		<td>* 로또 구매 갯수[1~5]:</td>
		<td><input type="text"> </td>
	</tr>
</table>
	<form action="lotto_ok.jsp" method="post"></form>
		<table>
			<tr>
				<td>* 포함 가능 수[최대 6개까지 추가 가능]</td>
			</tr>
			<tr>
			<%
				String s;
				for(int i=1;i<=rows;i++){
					out.print("<tr height='25' align='center");
					out.print("<td>"+i+"</td>");
					
					for(int j=1;j<=cols;j++){
						s=i+":"+j+" ";
					}
					boolean b=false;
				
					}
					out.print("<td>");
					//좌석 체크박스
					if(b){
						out.print("<input type='checkbox'name='chks'value='"+s+"'checked='checked'disabled='disabled'>");  //체크되어있음=>변경 못함
					}else{
						out.print("<input type='checkbox'name='chks'value='"+s+"'>"); //체크 안되어있음		
					}
					out.print("</td>");
				}
				out.print("</td>");		
			%>
			</tr>
		</table>


</body>
</html>