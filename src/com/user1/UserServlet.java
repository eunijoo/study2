package com.user1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//������ ����� ���޾ƾ��Ѵ�.
//���ʸ� ������ �߻�Ŭ�����̴�.�׷��� ���ʿ� ���ں��̸� �����Ƕ� serialVersionUID�� import �������.
//<!-- ȯ�漳���ϴ°�. ���� �̷��� ���������൵ �Ǵµ� 2��°�ٶ����� ������. -->
//<!-- http://localhost:9090/study2 :�̰� �츮 ����Ʈ �ּ�. -->
//<!-- http://localhost:9090/study2/first :�������� servlet-name�ۼ��ϸ�  UserServlet.java���� �ۼ��Ѱ� ���� �ּ� -->
//<!-- ��ü�� �츮�� ������. ��Ĺ�� ����°�. ���ʹ湮�ڰ� ������ init�� �����̵�.(ó���� �ѹ��� �����̵�) -->

public class UserServlet extends GenericServlet {

	private static final long serialVersionUID = 1L;
	private int count=0;

//������ü�� ó�� �����ɶ�(Ŭ���̾�Ʈ�� ó�� ���������� �׶� �ѹ��� ����ȴ�.) 	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("������ �ʱ�ȭ �� �� �� �ѹ� �����Ѵ�.");  
	}

//service �޼ҵ�� ��û�Ѱ� ó���� �Ŀ� �����Ѵ�. 
//ServletRequest req : Ŭ���̾�Ʈ�� ��û�Ҷ� �������ִ� ��ü  // ServletResponse res:��û�Ѱ� ������ �Ŀ� ������ ������ �������ִ� ��ü(��û���� ����� ó���ؼ� �ٽ� �������°�)
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	
	//Ŭ���̾�Ʈ�� ��ö�� ������ ����ȴ�.
		try {
			count++;
			String msg="���� �����Ͻ� ���� <b>"+count+"</b>��° �����Դϴ�.";
			String str=String.format("%1$tF %1$tA %1$tT", Calendar.getInstance());
		
		//Ŭ���̾�Ʈ���� ������ ������ Ÿ��
			res.setContentType("text/html; charset=utf-8");  //���� Ŭ���̾�Ʈ����, �ؽ�Ʈhtml�� utf-8Ÿ������ �����ְڴ�.
															 //������ utf-8�ڵ尡 �ȸ¾Ƽ� �۾��� ������.
															//���������� text�� �������ִµ� �̰� �ƴϸ� ���� ���Ѵ�.(�����߻�) <ex>test/html�� �ٲٸ� ���ϴٿ�ΰ� �ȴ�.(�ǵ�ġ���� �����߻�)
		//Ŭ���̾�Ʈ���� ������ ������ ��� ��ü
			PrintWriter out=res.getWriter();
			
		//Ŭ���̾�Ʈ���� HTML ���� ����
		//	out.println("<html>");
			out.print("<html>");
			out.print("<head><title>ù��°����</title></head>");
			out.print("<body>");
			
			out.print("<p>"+msg+"</p>");
			out.print("<p>"+str+"</p>");
			
			out.print("</body>");
			out.print("</html>");
					
		}catch (Exception e) {
			getServletContext().log("error in servlet",e); //�α����
		}
	}
	
//Ŭ���̾�Ʈ���� �Ⱥ���.���������׸� ����
	@Override
	public void destroy() {
		System.out.println("���� �ı� �ɶ� �� �ѹ� �����Ѵ�.");  //��������(������) �׶� �ѹ��� �����.
	}
}