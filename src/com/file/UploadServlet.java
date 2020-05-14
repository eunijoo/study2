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

@MultipartConfig( location="c:/temp", //업로드 파일을 임시로 저장하는 경로. 폴더가 없으면 업로드 안됨
  fileSizeThreshold=1024*1024, //업로드된 파일을 임시결오로 보내지 않고 메모리에서 스트림으로 바로 보내는 크기
  maxFileSize = 1024*1024*5, //업로드할 파일의 크기. 기본은 무제한이여서 안쓰면 무제한됨(기본은 무제한이지만 톰캣에서막음) 
  maxRequestSize = 1024*1024*10 //폼 전체 용량 
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
			//보낸거 받는 곳
			HttpSession session=req.getSession();
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"pds";
			File f=new File(pathname);
			
			if(!f.exists()) {
				f.mkdirs();
			}
			
			//파라미터 하나당 Part 하나
			// Collection<Part> pp = req.getPart(); // 다 넘어온다. 파일인지 뭔지 알아낼수있다. 
			String subject=req.getParameter("subject");
			Part p=req.getPart("selectFile");
			String originalFilename=getOriginalFilename(p);
			String saveFilename=null;
			
			if(originalFilename!=null) {
				//년월일시분초+nano시간까지 해서 내가 만들겠다.
				String fileExt=originalFilename.substring(originalFilename.lastIndexOf("."));  //lastIndexOf로 찾아야 맨뒤부터 찾는다.
				saveFilename=String.format("%1$tY%1$tm%1$td%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());  //자바 대소문자 구분. 1$: 
				saveFilename+=System.nanoTime(); //milsecond 더하면  중복됨
				saveFilename+=fileExt; //파일확장자까지 더해서 파일명 만듦
				
				String fullpath=pathname+File.separator+saveFilename;  //separator : 주소에서 윈도우면 \ ,맥.리눅스면 /로 자동 인식을 해줌.
				p.write(fullpath);
			}
			req.setAttribute("subject", subject);
			req.setAttribute("saveFilename", saveFilename);
			req.setAttribute("originalFilename", originalFilename);
			
			RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/file/result.jsp");
			rd.forward(req, resp);
		}
	}
	//오리지날 파일명 확인(가져오기)
	private String getOriginalFilename(Part p) {
		for(String s:p.getHeader("content-disposition").split(";")) {  
			if(s.trim().startsWith("filename")) { //filename의 값만 가져올거(변수명빼고 이름만 가져올거)
				 return s.substring(s.indexOf("=")+1).trim().replaceAll("\"", ""); 				
			}
		}
		return null;
	}
}