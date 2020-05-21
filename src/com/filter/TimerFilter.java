package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter {
	private FilterConfig filterConfig;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig =filterConfig;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//���۾� : request����
		long before=System.currentTimeMillis();		
		
		//���� ����(���Ͱ� ������), �Ǵ� ������ �����̸� ��û ������(JSP,������ ��)���� �̵�
		chain.doFilter(request, response); //���� ���. �̰� Ÿ�� �Խ������� ����, �̰� ��Ÿ�� �ٽ� �α��� �������� ��.
		
		//���۾� : response����
		long after=System.currentTimeMillis();
		
		String uri;
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req=(HttpServletRequest)request;
			uri=req.getRequestURI();
			
			filterConfig.getServletContext().log(uri+":"+(after-before)+"ms!!");
		}
	}
	@Override
	public void destroy() {
		
	}
}