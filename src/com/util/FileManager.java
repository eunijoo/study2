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
			
			//클라이언트에게 전송할 문서 타입 :파일
			resp.setContentType("application/octet-stream");
			
			//클라이언트에게 파일명을 헤더에 실어서 전송.
			resp.setHeader("Content-disposition", "attachment;filename="+originalFilename);
			
			//클라이언트에게 파일내용을 전송
			byte[] b=new byte[1024];
			bis=new BufferedInputStream(new FileInputStream(f));
			
			//클라이언트에게 전송할 출력 스트림
			os=resp.getOutputStream();
			
			int n;
			while((n=bis.read(b))!=-1) {
				os.write(b,0,n);
			}
			os.flush(); //flush하지않으면 문제생긴다.
			flag=true; // true이면 성공, false면 실패
			
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
