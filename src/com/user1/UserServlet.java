package com.user1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//서블릿은 상속을 꼭받아야한다.
//제너릭 서블릿은 추상클래스이다.그래서 왼쪽에 엑박보이면 재정의랑 serialVersionUID를 import 해줘야함.
//<!-- 환경설정하는곳. 요즘엔 이렇게 설정안해줘도 되는데 2번째줄때문에 설정함. -->
//<!-- http://localhost:9090/study2 :이게 우리 사이트 주소. -->
//<!-- http://localhost:9090/study2/first :마지막에 servlet-name작성하면  UserServlet.java에서 작성한거 들어가는 주소 -->
//<!-- 객체는 우리가 못만듬. 톰캣이 만드는거. 최초방문자가 있을때 init이 실행이됨.(처음에 한번만 실행이됨) -->

public class UserServlet extends GenericServlet {

	private static final long serialVersionUID = 1L;
	private int count=0;

//서블릿객체는 처음 생성될때(클라이언트가 처음 접속했을때 그때 한번만 실행된다.) 	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("서블릿이 초기화 될 때 단 한번 실행한다.");  
	}

//service 메소드는 요청한걸 처리한 후에 응답한다. 
//ServletRequest req : 클라이언트가 요청할때 가지고있는 객체  // ServletResponse res:요청한걸 실행한 후에 응답할 정보를 가지고있는 객체(요청받은 결과를 처리해서 다시 돌려보는거)
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	
	//클라이언트가 요철할 때마다 실행된다.
		try {
			count++;
			String msg="지금 접속하신 분은 <b>"+count+"</b>번째 접속입니다.";
			String str=String.format("%1$tF %1$tA %1$tT", Calendar.getInstance());
		
		//클라이언트에게 보내는 문서의 타입
			res.setContentType("text/html; charset=utf-8");  //나는 클라이언트한테, 텍스트html로 utf-8타입으로 보내주겠다.
															 //없으면 utf-8코드가 안맞아서 글씨가 깨진다.
															//브라우저에선 text를 읽을수있는데 이게 아니면 읽지 못한다.(문제발생) <ex>test/html로 바꾸면 파일다운로가 된다.(의도치않은 문제발생)
		//클라이언트에게 문서를 전송할 출력 객체
			PrintWriter out=res.getWriter();
			
		//클라이언트에게 HTML 문서 전송
		//	out.println("<html>");
			out.print("<html>");
			out.print("<head><title>첫번째예제</title></head>");
			out.print("<body>");
			
			out.print("<p>"+msg+"</p>");
			out.print("<p>"+str+"</p>");
			
			out.print("</body>");
			out.print("</html>");
					
		}catch (Exception e) {
			getServletContext().log("error in servlet",e); //로그출력
		}
	}
	
//클라이언트한테 안보임.개발자한테만 보임
	@Override
	public void destroy() {
		System.out.println("서블릿 파괴 될때 단 한번 실행한다.");  //서블릿종료(죽을때) 그때 한번만 실행됨.
	}
}