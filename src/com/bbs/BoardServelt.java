package com.bbs;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

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
		BoardDAO dao=new BoardDAO();
		MyUtil myUtil=new MyUtil();
		String cp=req.getContextPath();
		
		String page=req.getParameter("page");
		int current_page=1;
		if(page!=null) {
			current_page=Integer.parseInt(page);
		}
		
		String condition=req.getParameter("condition");
		String keyword=req.getParameter("keyword");
		if(condition==null) {  //condition가 null일때 keyword가 검색이 아님...
			condition="subject";
			keyword="";
		} 
		//검색버튼 누르면 Post로 넘어옴
		
		//인코딩을 해야하니까 디코딩을 해줌
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword,"utf-8");
		}
		
		int dataCount;
		if(keyword.length()==0) {
			dataCount=dao.dataCount();
		}else {
			dataCount=dao.dataCount(condition,keyword);
		}
		
		int rows=10;
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		List<BoardDTO>list;
		if(keyword.length()==0) {
			list=dao.listBoard(start, end);
		}else {
			list=dao.listBoard(start, end,condition,keyword);
		}
		
		// 게시물 번호를 재정의, 시퀀스가 삭제되면 중구난방이라서
		int listNum,n=0;
		Iterator<BoardDTO> it=list.iterator();
		while(it.hasNext()) {
			BoardDTO dto=it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		if(keyword.length()!=0) {
			query="condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
		}
		
		String listUrl=cp+"/cbbs/list.do";
		String articleUrl=cp+"/cbbs/article.do?page="+current_page;
		if(query.length()!=0) {
			listUrl+="?"+query;
			articleUrl+="&"+query;
		}
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		//list.jsp에 넘겨줄 데이터
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("total_page", total_page);
		req.setAttribute("articleUrl", articleUrl);
		
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
	
	// 글목록 => 글보기(파라미터 최소2~최대4개)
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String page = req.getParameter("page");
		
		String condition = req.getParameter("condition");
		String keyword = req.getParameter("keyword");
		if(condition==null) {
			condition = "subject";
			keyword = "";
		}
		
		//디코딩 후에 인코딩을해야함(문제가 생길 수 있음)
		keyword = URLDecoder.decode(keyword,"utf-8");
		
		String query = "page=" + page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"UTF-8");
		}
		
		try {
			//조회수
			dao.updateHitCount(num);

			//게시글
			BoardDTO dto = dao.readBoard(num);
			if(dto==null) {
				resp.sendRedirect(cp+"/cbbs/list.do?"+query);
				return;
			}
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			BoardDTO preReadDto = dao.preReadBoard(num, condition, keyword);
			BoardDTO nextReadDto = dao.nextReadBoard(num, condition, keyword);
			
			req.setAttribute("dto", dto);
			req.setAttribute("preReadDto", preReadDto);
			req.setAttribute("nextReadDto", nextReadDto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
	}
	//수정 폼
	protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  //
		BoardDAO dao=new BoardDAO();
		String cp=req.getContextPath();
		
		int num=Integer.parseInt(req.getParameter("num"));
		String page=req.getParameter("page");
		
		BoardDTO dto=dao.readBoard(num);
		if(dto==null) {
			resp.sendRedirect(cp+"/cbbs/list.do?page="+page);
			return;
		}
		req.setAttribute("dto", dto);
		req.setAttribute("page", page);
		req.setAttribute("mode", "update");
		
		forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
	}
	//수정 완료하는 DB
	protected void update_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao=new BoardDAO();
		String cp=req.getContextPath();
		
		String page=req.getParameter("page");
		
		BoardDTO dto=new BoardDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setName(req.getParameter("name"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setPwd(req.getParameter("pwd"));
		
		try {
			dao.updateBoard(dto);
		} catch (Exception e) {
		}
		
		resp.sendRedirect(cp+"/cbbs/list.do?page="+page);
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		req.setCharacterEncoding("utf-8");   
		
		BoardDAO dao=new BoardDAO();
		
		int num=Integer.parseInt(req.getParameter("num"));
		String pageNum=req.getParameter("page");
		
		String condition=req.getParameter("condition");
		String keyword=req.getParameter("keyword");
		if(condition==null){  //검색이 아닌경우
			   condition="subject"; //subject가 아닌 다른거 써줘도 됨
			   keyword=""; //length가 0이 아닐때가 잇으니까 해줌
		}
		keyword=URLDecoder.decode(keyword,"UTF-8");
		
		String query="page="+pageNum;
		if(keyword.length()!=0){
			   query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
		}

		try {
			dao.deleteBoard(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		resp.sendRedirect(cp+"/cbbs/list.do?"+query);
	}
}
