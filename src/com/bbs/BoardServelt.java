package com.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/bbs/*") //�̹� JSP������ �־ �ȵȴ�.�ߺ��� �Ǹ� ���� ������.
@WebServlet("/cbbs/*") 

//������ HttpServlet ������ ��ӹ޾ƾ��Ѵ�.
//doGet, doPost �������Ѵ�.
//�켱������ servlet�� �� ����.
public class BoardServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp); //���μ����� �Ѿ�ڴ�.
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp); //���μ����� �Ѿ�ڴ�.
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String path) throws ServletException, IOException {
		//������
		RequestDispatcher rd=req.getRequestDispatcher(path); //RequestDispatcher�� ��ü����
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
	//cp���� ������ �ּ�
		String uri=req.getRequestURI();
	//�Խñ� ����Ʈ	
		if(uri.indexOf("list.do")!=-1) {
			list(req,resp);
	//�� �����
		} else if(uri.indexOf("created.do")!=-1) {
			created(req,resp);	
	//�� ��� �Ϸ�
		} else if(uri.indexOf("created_ok.do")!=-1) {
			created_ok(req,resp);	
	//�� ����
		} else if(uri.indexOf("article.do")!=-1) {
			article(req,resp);
	//�� ������
		} else if(uri.indexOf("update.do")!=-1) {
			update(req,resp);
	//�� ���� �Ϸ�
		} else if(uri.indexOf("update_ok.do")!=-1) {
			update_ok(req,resp);
	//�� ����
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
