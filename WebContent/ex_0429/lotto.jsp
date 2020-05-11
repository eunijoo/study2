<%@ page contentType="text/html; charset=UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
function send(){
	var f = document.lottoForm;
	var ln = f.lottoCount.value;
	if(!ln){
		alert("갯수를 입력하세요");
		return;	
	}else if(ln<1 || ln>5){
		alert("갯수는 1~5사이만 가능합니다.");
		return;
	}else if(!/^[0-9]$/.test(ln)){
		alert("숫자만 입력가능합니다.");
		return;
	}
	
	var chk_obj = document.getElementsByName("check");
	var checked = 0;
	
	for(var i=0;i< chk_obj.length; i++){
		if(chk_obj[i].checked==true){
			checked +=1;
		}
	}
	
	if(checked > 6){
		alert("포함할 수는 최대 6개까지 추가가능합니다.");
		return;
	}else{
		alert(checked+"개의 숫자 선택");
		
	}
	f.submit();
	
	
}


</script>
</head>
<body>
<form action="lotto_ok.jsp" method="post" name="lottoForm">
   <h3>꿈의 로또</h3>
   <p>*로또구매갯수[1~5]:<input type="text" name="lottoCount"></p>
   <p>*포함할 수[최대 6개까지 추가 가능]</p>
   <table>
      <%
      int cnt=1;
      for(int i=1; i<=5; i++){
         out.print("<tr>");
         for(int j=1; j<=9; j++){
            out.print("<td>"+cnt+"<input type='checkbox' name='check' value='"+cnt+"' ></td>");
            cnt++;
         }
         out.print("</tr>");
      }
      %>
   </table>
   <button type="button" onclick="send()">구매하기</button>
</form>



</body>
</html>