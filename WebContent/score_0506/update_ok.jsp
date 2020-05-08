<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.score.ScoreDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	ScoreDAO dao=new ScoreDAO();
	try{
		dao.updateScore(dto);	
	}catch(Exception e){
	}
	
	response.sendRedirect("list.jsp");
	//리다이렉트 : insert,delete,로그인,로그아웃 후에는 일반적으로 리다이렉트
%>
