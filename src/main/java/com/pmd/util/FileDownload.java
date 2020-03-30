package com.pmd.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */

// 톰캣의 Dynamic Web Project에서는 서블릿을 자동으로 등록시켜줬지만,
// STS에서는 web.xml에 직접 등록해야 함
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String filename = request.getParameter("f_name");
		String dir = request.getParameter("dir");
		
		String path = getServletContext().getRealPath(dir);
		
		// 다시 위의 절대경로를 파일명과 연결시키기
		String fullPath = path+System.getProperty("file.separator")+filename; 
			//System.getProperty("file.separatoer") <<< 운영채제에 따라서 /냐 \냐 알아서 들어감
		
		// 파일을 보내기 위한 File객체
		File f = new File(fullPath);
		
		byte[] buf = new byte[2048]; // 바구니
		
		// 전송할 데이터가 스트림 처리될 때 문자셋을 지정해야 함
		response.setContentType("application/octet-stream;charset=8859_1");
		
		response.setHeader("Content-Disposition","attachment;filename="+new String(filename.getBytes(), "8859_1"));
		
		response.setHeader("Content-transfer-Encoding", "binary");
		
		
		if(f.isFile()) {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			// 요청한 곳으로 보내기 위해(응답하기 위해)
			// 스트림을 요청객체로 부터 얻어낸다
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int size = -1;
			
			try {
				// 읽어오자마자 보내기를 수행
				while((size = bis.read(buf)) != -1) {
					bos.write(buf, 0, size); // 스트림 보내기
					bos.flush(); // 스트림 비우기
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
		}
	}

}
