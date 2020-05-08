<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<form name="reserve" action="reserve_ok" method="post">
	<table>
		<% for(int i=1;i<15;i++){ %>
		<tr>						
			<%for(int j=1;j<10;j++){%>
			<td> <input type="checkbox"></td>						
			}		
		}
		

	
	
	</table>

</form>

</body>
</html>