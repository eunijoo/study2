<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Map<String,Object> map=new HashMap<>();
	map.put("name","이자바");
	map.put("city","서울");
	map.put("tel","010-1111-1111");
	
	List<Map<String,Object>> list =new ArrayList<>();
	Map<String,Object> map1=new HashMap<>();

	map1.put("name","호호호");
	map1.put("subject","히히히");
	list.add(map1);

	map1=new HashMap<>();
	map1.put("name","마마마");
	map1.put("subject","미미미");
	list.add(map1);
	
	map1=new HashMap<>();
	map1.put("name","수수수");
	map1.put("subject","시시시");
	list.add(map1);
	
	request.setAttribute("map", map);
	request.setAttribute("list", list);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<jsp:forward page="ex9_Map_ok.jsp"/>

</body>
</html>