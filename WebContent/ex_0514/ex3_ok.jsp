<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");

	//localhost:9090/study2의 실제 computer의 경로
	//컴퓨터의 진짜 경로를 알지 못하면 파일처리를 하지 못한다. 정확하게 알고있어야 파일처리 가능.
	String root=pageContext.getServletContext().getRealPath("/");
	
	//System.out.println(root); // C:\web\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\study2\
	String pathname =root+"uploads"+File.separator+"pds";
	
	//진짜 없는지 확인하겠다.
	File f=new File(pathname);
	if(!f.exists()){ //폴더가 없으면
		f.mkdirs(); //생성됨
	} 
	
	//enctype="multipart/form-data"로 넘어온 데이터는 request.getParameter()로 넘겨받지 못한다.
	//못하니깐 cos.jar(servelt에서 다운받은 파일)이 도와줄거다.
	
	String encType="utf-8";
	int max=5*1024*1024;//최대 업로드 용량(5MB)
	
	MultipartRequest mreq=null;
						  //request,파일저장경로,최대용량,파라미터인코딩,동일한 파일명 보호여부
	mreq=new MultipartRequest(request,pathname,max,encType,new DefaultFileRenamePolicy());
	
	String name= mreq.getParameter("name"); //requset.getParater과 유사
	String subject=mreq.getParameter("subject");
	//클라이언트가 업로드한 실제 파일명
	String originalFilename=mreq.getOriginalFileName("upload");

	//서버에 저장된 파일명
	String saveFilename=mreq.getFilesystemName("upload");
	long fileSize=0;
	if(mreq.getFile("upload")!=null){
		fileSize=mreq.getFile("upload").length();
	}
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<p>이름:<%=name%></p>
<p>subject:<%=subject%>
<p>originalFilename:<%=originalFilename%>
<p>saveFilename:<%=saveFilename%>
<p>fileSize:<%=fileSize%>

<p> <a href="down.jsp?file1=<%=saveFilename%>&file2=<%=originalFilename%>">다운로드</a></p>
 

</body>
</html>