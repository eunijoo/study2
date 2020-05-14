package com.file;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/upload/*")

@MultipartConfig( location="c:/temp", //���ε� ������ �ӽ÷� �����ϴ� ���. ������ ������ ���ε� �ȵ�
  fileSizeThreshold=1024*1024, //���ε�� ������ �ӽð���� ������ �ʰ� �޸𸮿��� ��Ʈ������ �ٷ� ������ ũ��
  maxFileSize = 1024*1024*5, //���ε��� ������ ũ��. �⺻�� �������̿��� �Ⱦ��� �����ѵ�(�⺻�� ������������ ��Ĺ��������) 
  maxRequestSize = 1024*1024*10 //�� ��ü �뷮 
) 
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
		
		if(uri.indexOf("write.do")!=-1) {
			RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/file/write.jsp");
			rd.forward(req, resp);
		}else if(uri.indexOf("write_ok.do")!=-1) {
			//������ �޴� ��
			HttpSession session=req.getSession();
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"pds";
			File f=new File(pathname);
			
			if(!f.exists()) {
				f.mkdirs();
			}
			
			//�Ķ���� �ϳ��� Part �ϳ�
			// Collection<Part> pp = req.getPart(); // �� �Ѿ�´�. �������� ���� �˾Ƴ����ִ�. 
			String subject=req.getParameter("subject");
			Part p=req.getPart("selectFile");
			String originalFilename=getOriginalFilename(p);
			String saveFilename=null;
			
			if(originalFilename!=null) {
				//����Ͻú���+nano�ð����� �ؼ� ���� ����ڴ�.
				String fileExt=originalFilename.substring(originalFilename.lastIndexOf("."));  //lastIndexOf�� ã�ƾ� �ǵں��� ã�´�.
				saveFilename=String.format("%1$tY%1$tm%1$td%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());  //�ڹ� ��ҹ��� ����. 1$: 
				saveFilename+=System.nanoTime(); //milsecond ���ϸ�  �ߺ���
				saveFilename+=fileExt; //����Ȯ���ڱ��� ���ؼ� ���ϸ� ����
				
				String fullpath=pathname+File.separator+saveFilename;  //separator : �ּҿ��� ������� \ ,��.�������� /�� �ڵ� �ν��� ����.
				p.write(fullpath);
			}
			req.setAttribute("subject", subject);
			req.setAttribute("saveFilename", saveFilename);
			req.setAttribute("originalFilename", originalFilename);
			
			RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/file/result.jsp");
			rd.forward(req, resp);
		}
	}
	//�������� ���ϸ� Ȯ��(��������)
	private String getOriginalFilename(Part p) {
		for(String s:p.getHeader("content-disposition").split(";")) {  
			if(s.trim().startsWith("filename")) { //filename�� ���� �����ð�(�������� �̸��� �����ð�)
				 return s.substring(s.indexOf("=")+1).trim().replaceAll("\"", ""); 				
			}
		}
		return null;
	}
}