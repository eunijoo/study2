package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	public static boolean doFiledownload(String saveFilename, String originalFilename, String pathname,
			HttpServletResponse resp) {

		boolean flag = false;
		BufferedInputStream bis = null;
		OutputStream os = null;

		try {
			originalFilename=new String(originalFilename.getBytes("euc-kr"),"8859_1");
			pathname=pathname+File.separator+saveFilename;
			File f= new File(pathname);
			
			if(!f.exists()) {
				return flag;
			}
			
			//Ŭ���̾�Ʈ���� ������ ���� Ÿ�� :����
			resp.setContentType("application/octet-stream");
			
			//Ŭ���̾�Ʈ���� ���ϸ��� ����� �Ǿ ����.
			resp.setHeader("Content-disposition", "attachment;filename="+originalFilename);
			
			//Ŭ���̾�Ʈ���� ���ϳ����� ����
			byte[] b=new byte[1024];
			bis=new BufferedInputStream(new FileInputStream(f));
			
			//Ŭ���̾�Ʈ���� ������ ��� ��Ʈ��
			os=resp.getOutputStream();
			
			int n;
			while((n=bis.read(b))!=-1) {
				os.write(b,0,n);
			}
			os.flush(); //flush���������� ���������.
			flag=true; // true�̸� ����, false�� ����
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null) {
				try {
					bis.close();
				} catch (Exception e2) {
				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (Exception e2) {
				}
			}
		}
		return flag;
	}
}
