<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	//jsp:param 액션태그는 request.getParameter()로 넘겨받는다.
	String menuItem=request.getParameter("menuItem");
	if(menuItem==null) menuItem="";
%>

<ul>
	<li><a href="main.jsp"class="menuItem">홈</a></li>
<% if(menuItem.equals("guest")){ %>	
	<li style="font-weight: 700;">방명록</li>
<%} else { %>	
	<li><a href="guest.jsp"class="menuItem">방명록</a></li>
<% } %>	
	<li><a href="bbs.jsp"class="menuItem">게시판</a></li>
	<li><a href="#"class="menuItem">일정관리</a></li>
	<li><a href="#"class="menuItem">공지사항</a></li>
</ul>