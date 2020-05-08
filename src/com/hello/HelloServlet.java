package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {  //������ Http�� ��ӹްų�. ���ʸ� ��ӹ޾ƾ��Ѵ�.
	private static final long serialVersionUID = 1L;

//Ŭ���̾�Ʈ ��û�� GET ����� ��� ����
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/*	�ּ�â��  http://localhost:9090/study2/hello?name=kim&age=20 �Է��ϸ�
    	GET ������� ��û
		kim�� �ݰ�����
		kim���� �����Դϴ�.
		��� ��µȴ�.
	 	=> ?�ڿ��� ������ �����̿���ȵȴ�.(�����ϸ� ������..)
	 	�ּ�â�� �ش� ���� �����̳���(����X => �Խ��Ǳۺ���,�޴����� ���� GET����� ����Ѵ�.(������ ��� �Ǵ°�))
	 */			
		try {
			
		//Ŭ���̾�Ʈ�� ���� ���� �ޱ�
			String name=req.getParameter("name");
			int age=Integer.parseInt(req.getParameter("age"));
			String msg=name+"�� �ݰ�����<br>";
		
		//age�� null���� string�� +���� ���Ѵ�.	
			if(age>=19) {
				msg+=name+"���� <span style='color:red;'>����</span>�Դϴ�.";
			}else {
				msg+=name+"���� <span style='color:red;'>�̼�����</span>�Դϴ�.";
			}
			
		//Ŭ���̾�Ʈ���� �����ϴ� ���� Ÿ��
			resp.setContentType("text/html;charset=utf-8");
		
		//Ŭ���̾�Ʈ���� ������ ������ �� �ִ� ��� ��Ʈ��
			PrintWriter out =resp.getWriter();
			out.println("<html>");
			out.print("<head><title>����</title></head>");
			out.print("<body>");
			out.print("<h3>GET ������� ��û</h3>");
			
			out.println(msg);
			out.print("</body>");
			out.println("</html>");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

//Ŭ���̾�Ʈ ��û�� POST ����� ��� ����
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/* ���ڵ��� ������ Ÿ���� ����������Ѵ�.
		http://localhost:9090/study2/hello ó�� �ּ�â�� ���� ������ �ȳ���(���ȵ� => �α���,ȸ������,�Խ��Ǳ۵��,���� ���� post������� ���)	
	*/	
		try {
		//Ŭ���̾�Ʈ�� ������ ���� Ÿ�Լ���(�������� ������ �ѱ�ó�� �Ұ�.
			req.setCharacterEncoding("UTF-8");
			
		//Ŭ���̾�Ʈ�� ���� ���� �ޱ�
			String name=req.getParameter("name");
			int age=Integer.parseInt(req.getParameter("age"));
			String msg=name+"�� �ݰ�����<br>";
		
		//age�� null���� string�� +���� ���Ѵ�.	
			if(age>=19) {
				msg+=name+"���� <span style='color:green;'>����</span>�Դϴ�.";
			}else {
				msg+=name+"���� <span style='color:green;'>�̼�����</span>�Դϴ�.";
			}
			
		//Ŭ���̾�Ʈ���� �����ϴ� ���� Ÿ��
			resp.setContentType("text/html;charset=utf-8");
		
		//Ŭ���̾�Ʈ���� ������ ������ �� �ִ� ��� ��Ʈ��
			PrintWriter out =resp.getWriter();
			out.println("<html>");
			out.print("<head><title>����</title></head>");
			out.print("<body>");
			out.print("<h3>POST ������� ��û</h3>");
			
			out.println(msg);
			
			out.print("</body>");
			out.println("</html>");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
