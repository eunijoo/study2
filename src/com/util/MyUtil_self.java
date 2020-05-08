package com.util;

public class MyUtil_self {
	// ǥ���� ������ ��
	public int viewCount(int rows, int allDataCount) {
		if (allDataCount < 0) {
			return 0; // allDataCount : �� �������� �� => �����Ͱ� ������ 0�� ����
		}
		return allDataCount / rows + (allDataCount % rows > 0 ? 1 : 0);
	}

	// ����¡ �ϱ�
	// int currPage = ���� ������
	// int totPage = ��ü ������(viewCount���� ���� ��)
	// String viewUrl = ������ �������� url
	public String setPaging(int currPage, int totPage, String viewUrl) {
		StringBuilder sb = new StringBuilder();

		if (currPage < 1 || totPage < 1) {
			return ""; // ���� �������� 1���� ���ų� �� �������� 1���� ������ ����!
		}

		if (viewUrl.indexOf("?") != -1) { // �Ű��� �Ѱܿ� url�ּҿ� ?�� ������ �ʱ�ȭ�����ν� ?�� �ٿ������ �Ⱥ����� ����
			viewUrl += "&";
		} else {
			viewUrl += "?";
		}

		sb.append("<div id='paginate'>");

		// <, << ��ư �����
		int n = currPage - 1; // ���� ���������� �ٷ� ���� �ּҷ� �̵��ϱ� ���� ����
		if (currPage > 5) {
			sb.append("<a href='" + viewUrl + "page=1'>����</a>&nbsp;");
			sb.append("<a href='" + viewUrl + "page=" + n + "'>��</a>&nbsp;");
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
			sb.append("<a href='" + viewUrl + "page=" + nn + "'>��</a>&nbsp;");
			sb.append("<a href='" + viewUrl + "page=" + totPage + "'>����</a>&nbsp;");
		}

		sb.append("</div>");

		return sb.toString();
	}
}
