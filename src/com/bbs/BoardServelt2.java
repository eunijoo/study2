package com.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

public class BoardServelt2 extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);			
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
	
	protected void list(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		BoardDAO dao=new BoardDAO();
		MyUtil myUtil=new MyUtil();
		String cp=req.getContextPath();
		
		String page=req.getParameter("page");
		int current_page=1;
		if(page!=null) {
			current_page=Integer.parseInt(page);
		}
		
		String condition =req.getParameter("condition");
		String keyword=req.getParameter("keyword");
		
		if(condition==null) {
			condition="subject";
			keyword="";
		}
		
	}
	protected void created(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		
	}
	protected void created_ok(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		
	}
	protected void article(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		
	}
	protected void update(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		
	}
	protected void update_ok(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		
	}
	protected void delete(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{

	}

}
