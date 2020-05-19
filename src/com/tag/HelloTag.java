package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	
	//��ü�� ���� �±�
	@Override
	public int doStartTag() throws JspException {
		//�±״� JSP���� ���°� ����
		JspWriter out=pageContext.getOut();
		
		try {
			out.print("<b>�ݰ�����!!</b>");
		} catch (Exception e) {
			throw new JspException();
		}		
		return SKIP_BODY; //��ü�� ���� �±�
	}

}
