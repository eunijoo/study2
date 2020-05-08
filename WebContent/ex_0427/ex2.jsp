<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%!  //!가 있으면 선언부.(필드) => 이런코드 작성안한다.
	//선언부 => 필드,메소드 정의하는 구문
	public int sum(int n){
		int s=0;
		for(int i=1;i<=n;i++){
			s+=n;
		}
		return s;
	}
	int x=0; 	//호출할때마다 ++이됨
%>

<%//Service(request)에 해당됨.
	//스크립 릿 : 소스가 service로 들어간다.(service메소드 속에 들어오는 소스) => 클라이언트가 요청할때마다 실행됨.
	int s;
	s=sum(50);
	
	int y=0;  //지역변수. 호출할때 0됬다가. 아래에서 ++이 됨.
	
	x++;
	y++;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<p>결과 :<%=s%></p>
<p>x :<%=x%></p>
<p>y :<%=y%></p>

</body>
</html>