package com.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/bbs/*") //이미 JSP폴더가 있어서 안된다.중복이 되면 서버 터진다.
@WebServlet("/cbbs/*") 

//서블릿은 HttpServlet 서블릿을 상속받아야한다.
//doGet, doPost 재정의한다.
//우선순위가 servlet이 더 높다.
public class BoardServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp); //프로세스로 넘어가겠다.
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp); //프로세스로 넘어가겠다.
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String path) throws ServletException, IOException {
		//포워딩
		RequestDispatcher rd=req.getRequestDispatcher(path); //RequestDispatcher의 객체생성
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
	//cp부터 끝까지 주소
		String uri=req.getRequestURI();
	//게시글 리스트	
		if(uri.indexOf("list.do")!=-1) {
			list(req,resp);
	//글 등록폼
		} else if(uri.indexOf("created.do")!=-1) {
			created(req,resp);	
	//글 등록 완료
		} else if(uri.indexOf("created_ok.do")!=-1) {
			created_ok(req,resp);	
	//글 보기
		} else if(uri.indexOf("article.do")!=-1) {
			article(req,resp);
	//글 수정폼
		} else if(uri.indexOf("update.do")!=-1) {
			update(req,resp);
	//글 수정 완료
		} else if(uri.indexOf("update_ok.do")!=-1) {
			update_ok(req,resp);
	//글 삭제
		} else if(uri.indexOf("delete.do")!=-1) {				
			delete(req,resp);
		}
	}
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
	
	}
	protected void created(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "created");
		forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
	}
	protected void created_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		BoardDAO dao=new BoardDAO();
		BoardDTO dto=new BoardDTO();
		
		dto.setName(req.getParameter("name"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setIpAddr(req.getRemoteAddr());
		
		try {
			dao.insertBoard(dto);
		} catch (Exception e) {
		}
		
		resp.sendRedirect(cp+"/cbbs/list.do");
	}
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
	
	}
	protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "update");
		forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
	}
	protected void update_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		resp.sendRedirect(cp+"/cbbs/list.do");
	}
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		resp.sendRedirect(cp+"/cbbs/list.do");
	}
}
