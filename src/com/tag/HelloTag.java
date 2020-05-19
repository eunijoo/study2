package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	
	//몸체가 없는 태그
	@Override
	public int doStartTag() throws JspException {
		//태그는 JSP에서 쓰는걸 말함
		JspWriter out=pageContext.getOut();
		
		try {
			out.print("<b>반가워요!!</b>");
		} catch (Exception e) {
			throw new JspException();
		}		
		return SKIP_BODY; //몸체가 없는 태그
	}

}
