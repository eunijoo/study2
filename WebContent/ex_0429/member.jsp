<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

a{
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: tomato;
}

.btn {
	color:#333333;
	font-weight:500;
	border:1px solid #cccccc;
	background-color:#fff;
	text-align:center;
	cursor:pointer;
	padding:3px 10px 5px;
	border-radius:4px;
}
.btn:active, .btn:focus, .btn:hover {
	background-color:#e6e6e6;
	border-color: #adadad;
	color: #333333;
}
.boxTF {
	border:1px solid #999999;
	padding:4px 5px 5px;
	border-radius:4px;
	background-color:#ffffff;
}
.selectField {
	border:1px solid #999999;
	padding:2px 5px 6px;
	border-radius:4px;
	font-size: 12px;
}

.member {
	width: 600px; margin: 30px auto 0px;
}

.title {
	width:100%;
	height:45px;
	line-height:45px;
	font-weight: bold;
	font-size:15px;
}

.member-body {
	margin-top: 5px;
}

.member-body table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

.member-body .list-row-2 {
	height: 40px;
	border-top: 2px solid #507CD1;
}

.member-body .list-row-1 {
	height: 40px;
	border-top: 1px solid #cccccc;
}
</style>

<script type="text/javascript">
function sendOk() {
	var f=document.memberForm;
	
	//id검사(첫글짜 영문자,숫자,_허용, 5-10글자) //i:대소문자 구분하지 않겠다.
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(f.userId.value)){
		alert("아이디는 5~10자 이내이며,첫글자는 영문자이고,영문자/숫자 만 가능합니다.");
		f.userId.focus();
		return;
	}
	//pwd검사((?=.*[a-z]) : a-z가 어디든 존재하기만 한다면 )
	if(!/^(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&*+-=_]).{5,10}$/i.test(f.userPwd.value)){
		alert("패스워드는 5~10자 이내이며, 영문자와 숫자 또는 특수문자가 포함되어야합니다.");
		f.userPwd.focus();
		return;
	}
	//pwd
	if(f.userPwd.value!=f.userPwd1.value){
		alert("패스워드가일치하지 않습니다.");
		f.userPwd.focus();
		return;
	}

	//이름 2자-5자
	if(!/^[가-힣]{2,5}$/.test(f.userName.value)){
		alert("이름은 2~5자이내입니다.");
		f.userName.focus();
		return;
	}
	//생년월일 날짜 검증
	if(! isValidDateFormat(f.birth.value)){
		f.birth.focus();
		return;
	}

	//이메일은 입력했는지 검증
	if(!f.email1.value){ // if(f.email1.value==""){ 과 같은 말.
		alert("이메일을 입력해주세요.")
		f.email1.focus();
		return;
	}
	
	if(!f.email2.value){
		alert("이메일을 입력해주세요.")
		f.email2.focus();
		return;
	}
	
	//전화번호 앞(3-4자리)(4자리)
	if(!/^[0-9]{4}$/.test(f.tel2.value)){
		f.tel2.focus();
		return;
	}
	if(!/^[0-9]{4}$/.test(f.tel3.value)){
		f.tel3.focus();
		return;
	}
	
	//서버로 보내는 코드
	f.action="member_ok.jsp";
	f.submit();
	
//	alert("성공");
}
	
//이메일
function changeEmail() {
	var f=document.memberForm;
	
	var s=f.selectEmail.value;
	if(s!="direct"){  //도메인이 넘겨줌
		f.email2.value=s;
		f.email2.readOnly=true;
		f.email1.focus();
	}else{   //공백넘겨줌(직접입력)
		f.email2.value="";
		f.email2.readOnly=false;
		f.email1.focus();		
	}
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




//우편번호,주소,직업 검증x

</script>


</head>
<body>

<div class="member">
	<div class="title">
	   <h3><span>|</span> 회원 가입</h3>
	</div>
	
	<div class="member-body">
		<form name="memberForm" method="post">
			<table>
			<tr class="list-row-2">
				<td width="100" align="center" bgcolor="#E6E6E6">아&nbsp;이&nbsp;디</td>
				<td style="padding-left: 5px;">
					<input type="text" name="userId" id="userId"  maxlength="10"  class="boxTF">
				    <span id="userIdState" style='display:none;'></span>
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">패스워드</td>
				<td style="padding-left: 5px;">
					<input type="password" name="userPwd" class="boxTF" maxlength="10">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">패스워드 확인</td>
				<td style="padding-left: 5px;">
					<input type="password" name="userPwd1" class="boxTF" maxlength="10">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td style="padding-left: 5px;">
					<input type="text" name="userName" maxlength="20"  class="boxTF">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">생년월일</td>
				<td style="padding-left: 5px;">
					<input type="text" name="birth" maxlength="20"  class="boxTF">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">이 메 일</td>
				<td style="padding-left: 5px;">
						  <select name="selectEmail" class="selectField" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com">네이버 메일</option>
								<option value="hanmail.net">한 메일</option>
								<option value="hotmail.com">핫 메일</option>
								<option value="gmail.com">지 메일</option>
								<option value="direct">직접입력</option>
						  </select>
						  <input type="text" name="email1" maxlength="30"  class="boxTF"> @ 
						  <input type="text" name="email2" maxlength="30"  class="boxTF" readonly="readonly">
				</td>
			</tr>
			
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">전화번호</td>
				<td style="padding-left: 5px;">
						  <select name="tel1" class="selectField">
								<option value="">선 택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						  </select>
						  <input type="text" name="tel2" maxlength="4"  class="boxTF"> -
						  <input type="text" name="tel3" maxlength="4"  class="boxTF" >
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">우편번호</td>
				<td style="padding-left: 5px;">
					<input type="text" id="zip" name="zip" size="25" maxlength="7"  class="boxTF" readonly="readonly">
					<button type="button" class="btn" onclick="daumPostcode()">우편번호검색</button>
				</td>
			</tr>
			
			<tr class="list-row-1" style="height: 70px;">
				<td width="100" align="center" bgcolor="#E6E6E6" valign="top" style="padding-top: 10px;">
				주&nbsp;&nbsp;&nbsp;&nbsp;소
				</td>
				<td style="padding-left: 5px;">
					<label style="display: block; margin-top: 5px;">
						<input type="text" id="addr1" name="addr1" maxlength="50"  class="boxTF"  readonly="readonly" style="width: 96%;">
					</label>
					<label style="display: block; margin-top: 5px; margin-bottom: 5px;">
						<input type="text" id="addr2" name="addr2" maxlength="50"  class="boxTF" style="width: 96%;">
					</label>
				</td>
			</tr>
			
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">직&nbsp;&nbsp;&nbsp;&nbsp;업</td>
				<td style="padding-left: 5px;">
					<input type="text" name="job" maxlength="7" class="boxTF">
				</td>
			</tr>
		
			<tr class="list-row-2" style="height: 50px;">
				<td align="center" colspan="2">
				    <button type="button" class="btn" onclick="sendOk();"> 회원가입 </button>
				    <button type="reset" class="btn"> 다시입력 </button>
				    <button type="button" class="btn"> 가입취소 </button>
				</td>
			</tr>
			
			<tr height="40">
				<td align="center" colspan="2">
					<span style="color: blue;"></span>
				</td>
			</tr>
			</table>
		</form>
	</div>
	
	<%-- 주소창 팝업뜨는 코드 --%>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <%--소스는 여기 사이트에 다 들어있음 --%>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>	
	
	
</div>	

</body>
</html>