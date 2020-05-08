package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {  //서블릿은 Http를 상속받거나. 제너릭 상속받아야한다.
	private static final long serialVersionUID = 1L;

//클라이언트 요청이 GET 방식인 경우 실행
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/*	주소창에  http://localhost:9090/study2/hello?name=kim&age=20 입력하면
    	GET 방식으로 요청
		kim님 반가워요
		kim님은 성인입니다.
		라고 출력된다.
	 	=> ?뒤에는 무조건 공백이오면안된다.(띄어쓰기하면 오류남..)
	 	주소창에 해당 문서 내용이나옴(보안X => 게시판글보기,메뉴보기 등은 GET방식을 사용한다.(보안이 없어도 되는거))
	 */			
		try {
			
		//클라이언트가 보낸 정보 받기
			String name=req.getParameter("name");
			int age=Integer.parseInt(req.getParameter("age"));
			String msg=name+"님 반가워요<br>";
		
		//age가 null여서 string과 +하지 못한다.	
			if(age>=19) {
				msg+=name+"님은 <span style='color:red;'>성인</span>입니다.";
			}else {
				msg+=name+"님은 <span style='color:red;'>미성년자</span>입니다.";
			}
			
		//클라이언트에게 전송하는 문서 타입
			resp.setContentType("text/html;charset=utf-8");
		
		//클라이언트에게 정보를 전송할 수 있는 출력 스트림
			PrintWriter out =resp.getWriter();
			out.println("<html>");
			out.print("<head><title>예제</title></head>");
			out.print("<body>");
			out.print("<h3>GET 방식으로 요청</h3>");
			
			out.println(msg);
			out.print("</body>");
			out.println("</html>");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

//클라이언트 요청이 POST 방식인 경우 실행
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/* 인코딩이 깨져서 타입을 설정해줘야한다.
		http://localhost:9090/study2/hello 처럼 주소창에 문서 내용이 안나옴(보안됨 => 로그인,회원가입,게시판글등록,수정 등을 post방식으로 사용)	
	*/	
		try {
		//클라이언트가 전송한 문서 타입설정(설정하지 않으면 한글처리 불가.
			req.setCharacterEncoding("UTF-8");
			
		//클라이언트가 보낸 정보 받기
			String name=req.getParameter("name");
			int age=Integer.parseInt(req.getParameter("age"));
			String msg=name+"님 반가워요<br>";
		
		//age가 null여서 string과 +하지 못한다.	
			if(age>=19) {
				msg+=name+"님은 <span style='color:green;'>성인</span>입니다.";
			}else {
				msg+=name+"님은 <span style='color:green;'>미성년자</span>입니다.";
			}
			
		//클라이언트에게 전송하는 문서 타입
			resp.setContentType("text/html;charset=utf-8");
		
		//클라이언트에게 정보를 전송할 수 있는 출력 스트림
			PrintWriter out =resp.getWriter();
			out.println("<html>");
			out.print("<head><title>예제</title></head>");
			out.print("<body>");
			out.print("<h3>POST 방식으로 요청</h3>");
			
			out.println(msg);
			
			out.print("</body>");
			out.println("</html>");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
