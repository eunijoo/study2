package com.util;

public class MyUtil_self {
	// 표시할 페이지 수
	public int viewCount(int rows, int allDataCount) {
		if (allDataCount < 0) {
			return 0; // allDataCount : 총 데이터의 수 => 데이터가 없으면 0을 리턴
		}
		return allDataCount / rows + (allDataCount % rows > 0 ? 1 : 0);
	}

	// 페이징 하기
	// int currPage = 현재 페이지
	// int totPage = 전체 페이지(viewCount에서 구한 값)
	// String viewUrl = 전송할 페이지의 url
	public String setPaging(int currPage, int totPage, String viewUrl) {
		StringBuilder sb = new StringBuilder();

		if (currPage < 1 || totPage < 1) {
			return ""; // 현재 페이지가 1보다 적거나 총 페이지가 1보다 적으면 리턴!
		}

		if (viewUrl.indexOf("?") != -1) { // 매개로 넘겨온 url주소에 ?가 없으면 초기화면으로써 ?를 붙여줘야함 안붙으면 터짐
			viewUrl += "&";
		} else {
			viewUrl += "?";
		}

		sb.append("<div id='paginate'>");

		// <, << 버튼 만들기
		int n = currPage - 1; // 현재 페이지에서 바로 이전 주소로 이동하기 위한 변수
		if (currPage > 5) {
			sb.append("<a href='" + viewUrl + "page=1'>◀◀</a>&nbsp;");
			sb.append("<a href='" + viewUrl + "page=" + n + "'>◀</a>&nbsp;");
		}

		for (int i = 5; i > 0; i--) {
			if ((currPage - i) < 1) {
				sb.append("");
			} else {
				sb.append("<a href='" + viewUrl + "page=" + (currPage - i) + "'>" + (currPage - i) + "</a>&nbsp;");
			}
		}

		sb.append("<span style='color:Fuchisa;'><b>" + currPage + "</b></span>&nbsp;");

		for (int i = 1; i <= 5; i++) {
			if (currPage + i > totPage) {
				continue;
			}
			sb.append("<a href='" + viewUrl + "page=" + (currPage + i) + "'>" + (currPage + i) + "</a>&nbsp;");
		}

		int nn = currPage + 1;
		if (totPage - currPage > 5) {
			sb.append("<a href='" + viewUrl + "page=" + nn + "'>▶</a>&nbsp;");
			sb.append("<a href='" + viewUrl + "page=" + totPage + "'>▶▶</a>&nbsp;");
		}

		sb.append("</div>");

		return sb.toString();
	}
}
