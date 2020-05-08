<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-size: 14px;
	font-family: 맑은 고딕, 돋움;
}
.btn {
	 color:#333;
 	 font-weight:500;
	 font-family: 맑은 고딕, 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 text-align: center;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
.boxTF {
	border:1px solid #999;
	padding:4px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: 맑은 고딕, 돋움, sans-serif;
}
</style>

<script type="text/javascript">
function isValidKorean(data) {  //이름검사
	var p=/^[가-힣]+$/; //가-힣까지 1자이상(처음부터 끝까지)
	return p.test(data);
}

function isValidDateFormat(data) { 
	var p=/^[12][0-9]{3}[\.|\-|\/]?[0-9]{2}[\.|\-|\/]?[0-9]{2}$/; //0-9까지 3개
	if(!p.test(data)){
		return false;
	}
	//g을 안붙여주면 첫번째 일치하는것만 없애줌.ex>2020-04-04에서 202004-04가 됨
	p = /(\.)|(\-)|(\/)/g;
	data=data.replace(p,"");  
	
	var y=parseInt(data.substr(0,4));
	var m=parseInt(data.substr(4,2));
	if(m<1 || m>12){
		return false;
	}
	
	var d=parseInt(data.substr(6));
	var lastDay=(new Date(y,m,0)).getDate();
	if(d<1||d>lastDay){
		f.birth.focus();
		return false;
	}
	return true;
	
	
	
	
	
}

function sendOk() {
	//var f=document.forms[0];//폼의 이름이 없을때 접근하는 방법.
	var f=document.insaForm; //폼의 이름으로 접근하는 방법.

	if(! isValidKorean(f.name.value)){
		f.name.focus();
		return;
	}
	
	if(! isValidDateFormat(f.birth.value)){
		f.birth.focus();
		return;
	}
	if(!/^(010)-[0-9]{4}-[0-9]{4}$/.test(f.phone.value)){
		f.phone.focus();
		return;
	}
	
	// /^\d{5,10}$/
	if(!/^(\d+)$/.test(f.salary.value)){
		f.salary.focus();
		return;
	}

	if(!/^\d{0,7}$/.test(f.bonus.value)){
		f.bonus.focus();
		return;
	}
	
	f.submit();

}
</script>

</head>
<body>

<div style="width: 500px; margin:30px auto 5px;">
	<h3>| 인사관리</h3>
	
	<form name="insaForm" action="insaEx_ok.jsp" method="post">
	<table border="1" style="width: 100%; margin-top:7px; border-spacing: 0; border-collapse: collapse;">
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">이름</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="name" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">생년월일</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="birth" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">전화번호</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="phone" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">기본급</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="salary" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">수당</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="bonus" class="boxTF">
		   </td>
		</tr>
	</table>
	
	<table style="width: 100%; margin-top:10px; border-spacing: 0;border-collapse: collapse;">
	<tr height="40" align="center">
	   <td><input type="button" value=" 등록하기 " class="btn" onclick="sendOk();"></td>
	</tr>
	</table>
	</form>
</div>

</body>
</html>