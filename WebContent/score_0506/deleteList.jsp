<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String haks[]=request.getParameterValues("haks");
	
	ScoreDAO dao=new ScoreDAO(); //메소드 생성.
	dao.deleteListScore(haks); //메소드 불러와서 사용하기

	response.sendRedirect("list.jsp");
	
%>
