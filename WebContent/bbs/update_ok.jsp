<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%

	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");	

%>
<jsp:useBean id="dto" class="com.bbs.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	BoardDAO dao=new BoardDAO();

	String pageNum=request.getParameter("page");

	dao.updateBoard(dto);
	
	//두개 중에 쓰고싶은거 쓰면됨
	// response.sendRedirect(cp+"/bbs/list.jsp?page="+pageNum);
	response.sendRedirect(cp+"/bbs/article.jsp?num="+dto.getNum()+"&page="+pageNum);

%>