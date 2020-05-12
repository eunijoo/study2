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
