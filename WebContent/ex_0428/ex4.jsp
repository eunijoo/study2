<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript">
function check() {
	//form접근방법 : form 이름으로 접근(myForm), 배열로 접근
	var f= document.myForm;
	//입력이 올바르게 됐는지 검사
	if(! f.name.value){
		alert("이름을 다시 입력하세요..");
		return false;
	}
	if(!/^(\d)+$/.test(f.age.value)){ 
		alert("나이를 다시 입력하세요...");
		return false;
	}
	return true;
}


</script>

</head>
<body>
<%--인코딩은 자바가 함. 서버입장에서는 뭐로 인코딩해서 온지 몰라서 iso-8859-1로 디코딩됨.=>한글깨짐 --%>

<form name="myForm" action="ex4_ok.jsp" method="post" onsubmit="return check();"> <%--ex1_ok :서버가 받을 주소이름 / method안쓰면 기본적으로 get --%>
	<p> 이름: <input type="text" name="name"> </p>
	<p> 나이: <input type="text" name="age"> </p>
	<p> 
		<button type="submit">보내기</button> <%--submit을 누르면 무조건 서버로 간다. --%>
	</p>
</form>

</body>
</html>