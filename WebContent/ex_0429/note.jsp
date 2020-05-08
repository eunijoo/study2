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
	margin: 0; padding: 0;
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
.boxTA {
    border:1px solid #999999;
    height:150px;
    padding:3px 5px;
    border-radius:4px;
    background-color:#ffffff;
    resize: none;
}
.title {
	width:100%;
	height:45px;
	line-height:45px;
	text-align:left;
	font-weight: bold;
	font-size:15px;
}
</style>

<script type="text/javascript">
    function itemAdd() {
    	var f=document.noteForm;
    	var item=f.itemLeft;
	
    	//Option : 자바스크립트에서 지원하는 생성자 value:서버로 보내느 값 . text: 우리가 보이는 글
    	item[0]=new Option("이미현","lee");
    	item[1]=new Option("한준익","han");
    	item[2]=new Option("고은진","go");
    	item[3]=new Option("근육맨","choi");
    	item[4]=new Option("어린자매","jeong");
    	item[5]=new Option("큰자매","jeong2");
    	item[6]=new Option("김종완","kim");
    }
	//하나씩 옮기기
    function itemMove(ob) { 
    	var f=document.noteForm;
    	var source,target;   //source : 원본
	
    	if(ob=="left"){
    		source=f.itemRight;
    		target=f.itemLeft;
    	}else{
    		source=f.itemLeft;
    		target=f.itemRight;
    	}
    	var n=target.length;
    	var len=source.length;
    /*
    	//여러개 옮길때 짝수번째꺼 안옮겨짐	
    	for(var i=0;i<len;i++){
    		if(source.options[i].selected){ //option태그가 options
    			target[n++]=new Option(source.options[i].text,source.options[i].value);//인덱스는 0부터 시작이니까 target 뒤에 n++을 해줌=>실제로는 1이니까 
        		source[i]=null; 
    		}
    	}
    */  
    	
    	for(var i=0;i<len;i++){
    		if(source.options[i].selected){ //option태그가 options
    			target[n++]=new Option(source.options[i].text,source.options[i].value);//인덱스는 0부터 시작이니까 target 뒤에 n++을 해줌=>실제로는 1이니까 
        		source[i]=null; 
    			i--;
    			len--;
    		}
    	}
    
    /*
    	//잘 돌아가긴하는데 순서가 다름
    	for(var i=len-1;i>=0;i--){
    		if(source.options[i].selected){ //option태그가 options
    			target[n++]=new Option(source.options[i].text,source.options[i].value);//인덱스는 0부터 시작이니까 target 뒤에 n++을 해줌=>실제로는 1이니까 
        		source[i]=null; 
    		}
    	}
     */	
     	
    }
	
  //전체옮기기
    function itemAllMove(ob) {  
    	var f=document.noteForm;
    	var source,target;   //source : 원본
	
    	if(ob=="left"){     
    		source=f.itemRight;
    		target=f.itemLeft;
    	}else{
    		source=f.itemLeft;
    		target=f.itemRight;
    	}
    	var n=target.length;
    	var len=source.length;
    	
    	for(var i=0;i<len;i++){
    		target[n++]=new Option(source.options[0].text,source.options[0].value);//인덱스는 0부터 시작이니까 target 뒤에 n++을 해줌=>실제로는 1이니까 
    		source[0]=null; 	//삭제
    	}   	
    }

    function sendOk() {
    	var f=document.noteForm;
    	
    	if(f.itemRight.length==0){
    		alert("받는 사람을 먼저 추가해주세요..");
    		f.itemRight.focus();
    		return;
    	}
    	if(!f.msg.value){
    		alert("메세지를 입력하세요..");
    		f.msg.focus();
    		return;
    	}
    	
    	for(var i=0;i<f.itemRight.length;i++){
    		f.itemRight[i].selected=true;
    	}
    	
    	f.action="note_ok.jsp";
    	f.submit();
    }
    
    window.onload = function() { //윈도우에 로드이벤트가 발생했을때 itemAdd 호출 
    	itemAdd();
    };
</script>

</head>
<body>

<div style="width: 400px; margin: 30px auto 0px;">

	<div style="title">
	   <h3><span>|</span> 쪽지 보내기</h3>
	</div>

	<form name="noteForm" method="post">
	<table style="width: 100%; margin-top: 10px; box-sizing:border-box; padding: 5px 5px 0;">
	
	<tr height="25">
	    <td width="150"><span>친구목록</span></td>
	    <td width="100">&nbsp;</td>
	    <td width="150"><span>받는사람</span></td>
	</tr>
	
	<tr align="center" >
	    <td style="padding: 3px;">
	        <select name="itemLeft" multiple="multiple" class="selectField" style="width:130px; height:120px;"></select>
	    </td>
	    <td>
		    <button type="button" class="btn" onclick="itemMove('right');" style="display:block; width:80px;"> &gt; </button>
		    <button type="button" class="btn" onclick="itemAllMove('right');" style="display:block;width:80px;"> &gt;&gt; </button>
		    <button type="button" class="btn" onclick="itemMove('left');" style="display:block;width:80px;"> &lt; </button>
		    <button type="button" class="btn" onclick="itemAllMove('left');" style="display:block;width:80px;"> &lt;&lt; </button>
	    </td>
	    <td style="padding: 2px;">
	        <select name="itemRight" multiple="multiple" class="selectField" style="width:130px; height:120px;">
	        </select>
	    </td>
	</tr>
	<tr height="25">
	    <td colspan="3" align="left" style="padding-top: 5px;">
	       <span>메시지</span>
	    </td>
	</tr>
	<tr>
	    <td colspan="3" style="padding: 3px;">
	        <textarea name="msg" class="boxTA" style="height:60px; width: 95%;"></textarea>
	    </td>
	</tr>
	</table>
	
	<table style="width: 100%;">
	<tr height="30">
	    <td align="right" style="padding-right: 4%;">
	        <button type="button" class="btn" onclick="sendOk();"> 쪽지보내기 </button>
	    </td>
	</tr>
	</table>
	</form> 
</div>

</body>
</html>