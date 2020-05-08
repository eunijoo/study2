<%@page import="com.util.MyUtil_self"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("utf8");

MyUtil_self mus = new MyUtil_self();

String pageNum=request.getParameter("page");
int currPage=1;
if(pageNum!=null){
	currPage=Integer.parseInt(pageNum);
}

int allDataCount = 1001;
int rows = 10;
int totPage = mus.viewCount(rows, allDataCount);

String viewUrl = "paging_self.jsp";

String setPaging = mus.setPaging(currPage, totPage, viewUrl);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript"></script>
<style type="text/css">
*{
	padding: 0; margin: 0;
}

body{
	font-size: 14px; font-family: "맑은 고딕", 돋움;
}

a{
	text-decoration: none;
	color: #000;
}

a:hover,a:active {
	text-decoration: underline;
	color: tomato;
}

</style>
</head>
<body>
<div style="margin: 30px auto; width: 700px;">
<h3>게시판</h3>

<table style="width: 100%; margin-top: 10px;">
<tr height="30">
	<td>
		총페이지 수 : <%=totPage %>, 현재 페이지 : <%=currPage %>
	</td>
</tr>
<tr height="30" align="center">
	<td>
		<%=setPaging %>
	</td>
</tr>
</table>

</div>

</body>
</html>