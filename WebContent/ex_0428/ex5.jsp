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
	var f= document.myForm;

//입력이 올바르게 됐는지 검사
	if(! f.name.value){
		alert("이름을 다시 입력하세요..");
		return;
	}
	
	if(!/^(\d)+$/.test(f.age.value)){ 
		alert("나이를 다시 입력하세요...");
		return;
	}
	
	f.submit();
	//서버로 전송 할 수 없는 <button type="button"등으로 서버 전송시 호출
	//<button type="submit"에서 호출하면 서버로 두번 전송된다.(주의...)
}

</script>

</head>
<body>
<h3>일반 버튼은 서버로 전송할 수 있는 기능이 없다.</h3>
<form name="myForm" action="ex5_ok.jsp" method="post"> <%--ex1_ok :서버가 받을 주소이름 / method안쓰면 기본적으로 get --%>
	<p> 이름: <input type="text" name="name"> </p>
	<p> 나이: <input type="text" name="age"> </p>
	<p> 
		<button type="button" onclick="send();">보내기</button> 
	</p>
</form>

</body>
</html>