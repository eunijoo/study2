<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="dto" class="com.member.MemberDTO"/> 
	
	<jsp:setProperty property="*" name="dto"/>
	<%--jsp:useBean id 이름과 jsp:setProperty name 이름이 동일해아한다.--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<%=dto.getUserId() %><br>
	<%=dto.getUserName() %> <br>
	<%=dto.getUserPwd() %><br>
	<%=dto.getBirth() %><br>
	<%=dto.getEmail1() %>@
	<%=dto.getEmail2() %><br>
	<%=dto.getTel1() %>-
	<%=dto.getTel2() %>-
	<%=dto.getTel3() %><br>
	<%=dto.getZip() %><br>
	<%=dto.getAddr1() %><br>
	<%=dto.getAddr2() %><br>
	<%=dto.getJob() %>
</body>
</html>