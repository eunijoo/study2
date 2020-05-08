<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	int rows=15;
	int cols=15;
	
	int width=cols*30+20*(cols/5)+30;  //통로 +왼쪽에 숫자 위치
	if(cols/5==0){
		cols-=20;
	}
	String []cc={"2:3","2:4","5:6","8:2","8:3"};  //2행 3렬,2행4열,,,,	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
function sendOk() {
	var f=document.forms[0];
	
	var cnt=0;
	for(var i=0;i<f.chks.length;i++){
		if(f.chks[i].disabled){
			continue;
		}
		if(f.chks[i].checked){
			cnt++;
		}
	}

	if(cnt<1||cnt>4){
		alert("좌석은 1~4까지 예약가능합니다.");
		return;
	}
	f.submit();
}

</script>

</head>
<body>

<div style="margin:30px auto; width: <%=width%>px;"> 
	<table style="width: 100%; border-spacing: 0;">
		<tr height="30" align="center" style="background:#e4e4e4">
					<td>스크린</td>
		</tr>
	</table>
  <form action="reserveEx_ok.jsp"method="post">
	<table style="width: 100%; margin-top:10px; border-spacing: 0; border-collapse: collapse;">
		<tr height="30"align="center">
		<%
			out.print("<td width='30'>&nbsp;</td>");
			for(int i=1;i<=cols;i++){
				if(i!=1&&i%5==1){
					out.print("<td width='20'>&nbsp;</td>");
				}
				out.print("<td width='30'>"+i+"</td>");
			}
		%>
		</tr>	
		<% //i행 j열
			String s;
			for(int i=1;i<=rows;i++){
				out.print("<tr height='25' align='center'>");
				out.print("<td>"+i+"</td>");
				
				for(int j=1;j<=cols;j++){ //좌석 번호
					if(j!=1 && j%5==1){
						out.print("<td bgcolor='#e4e4e4'>&nbsp;</td>");	
					}
					s=i+":"+j+" ";
					
					boolean b=false;
				
					for(int k=0;k<cc.length;k++){
						if(s.equals(cc[k])){
							b=true;
							break;
						}
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
			}
		%>	
	</table>
  	
  	<%--버튼은 폼테그 안에 안감싸도 된다. submit일 경우는 무조건 감싸야한다. --%>
	<table style="width: 100%;margin-top:5px;">
		<tr height="35" align="right">
			<td>
				<button type="button" onclick="sendOk();">좌석예약</button>
			</td>
		</tr>
	</table>
  </form>
</div>

</body>
</html>