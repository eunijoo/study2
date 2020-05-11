<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%
	request.setCharacterEncoding("UTF-8");
int lottoCount = Integer.parseInt(request.getParameter("lottoCount"));
String[] chk_num = request.getParameterValues("check");
if (chk_num == null) {
	chk_num = new String[0];
}
int[] chk_num2 = new int[chk_num.length];
for (int i = 0; i < chk_num.length; i++) {
	chk_num2[i] = Integer.parseInt(chk_num[i]);
}
%>
</head>
<body>
	<p>
		체크한 숫자 :
		<%
		if (chk_num2.length == 0) {
		out.print("없음");
	}
	if (chk_num2 != null) {
		for (int s : chk_num2) {
			out.print(s + " ");
		}
	}
	%>
	</p>

	
		<%
			int[] lotto = new int[6];
			for (int i = 0; i < lottoCount; i++) {
			out.print("<p> 로또번호 : ");
			if (chk_num2.length == 0) {
				for (int k = 0; k < lotto.length; k++) {
					lotto[k] = (int) (Math.random() * 45 + 1);
						 for (int j = 0; j < k; j++) {
							while (true) {
								if (lotto[k] == lotto[j]) {
									lotto[k] = (int)(Math.random() * 45 + 1);
								} else {
									break;
								}
							}
						} 
				}
			}
			
			if(chk_num2 != null){
				for(int n =0; n<chk_num2.length; n++){
					lotto[n] = chk_num2[n];
				}
				for(int k = chk_num2.length; k<lotto.length; k++){
					lotto[k] = (int)(Math.random()*45+1);
					for (int j = 0; j < k; j++) {
						while (true) {
							if (lotto[k] == lotto[j]) {
								lotto[k] = (int)(Math.random() * 45 + 1);
							} else {
								break;
							}
						}
					}
				}
			}
			
			
			
			Arrays.sort(lotto);
			
			
			for (int k = 0; k < 6; k++) {
				out.print(lotto[k] + " ");
			}
			out.print("</p>");
		}
		%>
	
</body>
</html>