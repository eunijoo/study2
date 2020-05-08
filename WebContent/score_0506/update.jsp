<%@page import="com.score.ScoreDTO"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String hak=request.getParameter("hak");
	
	ScoreDAO dao=new ScoreDAO();
	ScoreDTO dto=dao.readScore(hak);
	if(dto==null){
		response.sendRedirect("list.jsp");
		return;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
function send() {
	var f= document.writeForm;
	
	if(!/^[0-9]{1,6}$/.test(f.hak.value)){
		alert("학번은 숫자만 입력가능합니다.");
		f.hak.focus();
		return;
	}
	
	if(!/^[가-힣]{2,5}$/.test(f.name.value)){
		alert("이름은 한글만 입력가능합니다.");
		f.name.focus();
		return;
	}
	
	if(! isValidDateFormat(f.birth.value)){
		alert("생년월일 다시 입력해주세요.[yyyy-mm-dd]");
		f.birth.focus();
		return;
	}
	
	if(!/^[0-9]{1,3}$/.test(f.kor.value)){	
		alert("국어점수를 다시 입력해주세요.");
		f.kor.focus();
		return;
	}
	if(f.kor.value<0||f.kor.value>100){
		alert("국어점수를 0-100점만 입력가능합니다..");
		f.kor.focus();
		return;
	}
	if(!/^[0-9]{1,3}$/.test(f.eng.value)){	
		alert("영어점수를 다시 입력해주세요.");
		f.eng.focus();
		return;
	}
	if(f.eng.value<0||f.eng.value>100){
		alert("영어점수는 0-100점만 입력가능합니다..");
		f.eng.focus();
		return;
	}
	if(!/^[0-9]{1,3}$/.test(f.mat.value)){	
		alert("수학점수를 다시 입력해주세요.");
		f.mat.focus();
		return;
	}
	if(f.mat.value<0||f.mat.value>100){
		alert("수학점수는 0-100점만 입력가능합니다..");
		f.mat.focus();
		return;
	}

	f.action="update_ok.jsp";
	f.submit();
}


//날짜입력검증
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

</script>


</head>
<body>

<form name="writeForm" action="update_ok.jsp" method="post">
	<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
	<tr height="35">
		<td align="left" class="title">
			| 성적처리
		</td>
	</tr>
	</table>
	<table>
		<tr>
			<td>학번</td>
			<td><input type="text" name="hak" readonly="readonly" value="<%=dto.getHak()%>"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth" value="<%=dto.getBirth() %>"></td>
		</tr>
		<tr>
			<td>국어</td>
			<td><input type="text" name="kor" value="<%=dto.getKor()%>"></td>
		</tr>
		<tr>
			<td>영어</td>
			<td><input type="text" name="eng" value="<%=dto.getEng()%>"></td>
		</tr>
		<tr>
			<td>수학</td>
			<td><input type="text" name="mat" value="<%=dto.getMat() %>"></td>
		</tr>
	</table>
	<table>
		<tr>
			<td><button type="button" onclick="send()">수정완료</button>  </td>
			<td><button type="reset">다시입력</button></td>
			<td><button type="button"  onclick="javascript:location.href='list.jsp';">수정취소</button>  </td>
		</tr>
	</table>
</form>
</body>
</html>