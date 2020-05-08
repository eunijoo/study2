<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	
Calendar cal=Calendar.getInstance();
	
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	
	String sy=request.getParameter("year");
	String sm=request.getParameter("month");
	
	if(sy!=null){  //넘어온게 없으면 null, 넘어온게있으면 숫자로 변환
		year=Integer.parseInt(sy);
	}
	if(sm!=null){  
		month=Integer.parseInt(sm);
	}
	
	cal.set(year,month-1,1);
	year=cal.get(Calendar.YEAR);
	month=cal.get(Calendar.MONTH)+1;
	
	int week=cal.get(Calendar.DAY_OF_WEEK);//1~7
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
*{
	margin: 0;
	padding: 0;	
}
body{
	font-size: 14px;font-family: 맑은고딕,돋움;
}
a{
	color: #000;
	text-decoration: none;
}

a:hover,a:action{
	color: tomato;
	text-decoration: underline;
}

#layout{
	margin: 30px auto;
	width: 210px;
}

#layout table{
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

#layout table tr{
	height: 30px;
	text-align: center;		
}
.calender td{
	width: 30px;
	color: black;
}
.calender td:nth-child(7n+1){
	color: red;
}
.calender td:nth-child(7n){
	color: blue;
}

.calender td.gray{
	color: gray;
}

</style>

</head>
<body>

<div id="layout">
	<table>
		<tr>
			<td>
				<a href="calender.jsp?year<%=year%>&month=<%=month-1%>">(¬_¬)ﾉ</a>
				<%=year %>년 <%=month %>월
				<a href="calender.jsp?year<%=year%>&month=<%=month+1%>">(¬‿¬)</a>
			</td>
		</tr>			
	</table>
	<table border="1" class="calender">
		<tr bgcolor="#eeeeee">
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		
		<%
			int col=0;
			out.print("<tr>");
			
			Calendar preCal=(Calendar)cal.clone();
			preCal.set(Calendar.DATE,-(week-1-1));
			int preDate = preCal.get(Calendar.DATE);
			
		  //1일 앞 처리
			for(int i=1;i<week;i++){
			//out.print("<td>&nbsp;</td>");  //공백처리
				out.print("<td class='gray'>"+(preDate++)+"</td>");
				col++;
			}
		  //1~말일까지 출력하기
		  	int lastDay=cal.getActualMaximum(Calendar.DATE);
			for(int i=1;i<=lastDay;i++){
				out.print("<td>"+i+"</td>");
				col++;
				if(col==7&&i!=lastDay){
					out.print("</tr><tr>");
					col=0;
				}
			}
			
		 //마지막 주 마지막 일자 다음 처리
		 	int n=1;
		 	
			while(col>0&&col<7){
			//	out.print("<td>&nbsp;</td>");  //공백처리
				out.print("<td class='gray'>"+(n++)+"</td>");
				col++;
			}
			out.print("</tr>");
		%>
		
		
	</table>
</div>

</body>
</html>