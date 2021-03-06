package com.util;

public class MyUtil {
	/**
	 * 페이지수 구하기
	 * @param rows 한 화면에 표시할 데이터 개수
	 * @param dataCount 전체 데이터 수 
	 * @return 페이지 수 
	 */
	public int pageCount(int rows, int dataCount) {
		if (dataCount <= 0)
			return 0;

		return dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
	}
	
	
	/**
	 * 페이징 처리(GET방식)
	 * @param current_page 현재 표시할 페이지
	 * @param total_page   전체페이지수
	 * @param list_url     링크를 설정할 url(주소)
	 * @return 			      페이징 처리 결과
	 */
	public String paging(int current_page,int total_page,String list_url) {
		StringBuilder sb=new StringBuilder();
		
		int numPerBlock=10;
		int currentPageSetup;
		int n,page;
	
		if(current_page<1 || total_page<1)
			return "";
		if(list_url.indexOf("?")!=-1) { //?가 있을 경우
			list_url+="&";   //?를 이미 사용했으면 값연결할때는 &으로 연결
		}else {
			list_url+="?";  //?가 없을때 ?로 작성함.
		}
		
		//currentPageSetup:표시할  첫페이지-1
		currentPageSetup=(current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock==0) {
			currentPageSetup=currentPageSetup-numPerBlock;
		}
	
		sb.append("<div id='paginate'>");
		
		 //처음,이전(10페이지 전)
			n=current_page-numPerBlock;
			if(total_page>numPerBlock&&currentPageSetup>0) {
				sb.append("<a href='"+list_url+"page=1'>[처음]</a>");
				sb.append("&nbsp;<a href='"+list_url+"page="+n+"'>[이전]</a>");
			}
		 //페이징
			page=currentPageSetup+1;
			while(page<=total_page&&page<=(currentPageSetup+numPerBlock)){
				if(page==current_page) {
					sb.append("&nbsp;<span style='color:Fuchsia;'>"+page+"</span>");
				}else {
					sb.append("&nbsp;<a href='"+list_url+"page="+page+"'>"+page+"</a>");
				}
				page++;
			}
			
		 //다음(10페이지 후),마지막페이지
			n=current_page+numPerBlock;
			if(n>total_page)n=total_page;
			
			if(total_page-currentPageSetup>numPerBlock) {
				sb.append("&nbsp;<a href='"+list_url+"page="+n+"'>[다음]</a>");
				sb.append("&nbsp;<a href='"+list_url+"page="+total_page+"'>[끝]</a>");
			}

		sb.append("</div>");

		return sb.toString();
	}
}
