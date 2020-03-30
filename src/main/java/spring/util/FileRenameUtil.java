package spring.util;

import java.io.File;

public class FileRenameUtil {

	public static String checkFileName(String path, String fname) {
		// 파일명에서 .을 중심으로 파일명과 확장자를 분리하자
		int period = fname.lastIndexOf("."); // . 기준으로
		String name = fname.substring(0, period); // 파일명
		String suffix = fname.substring(period); // 확장자
		
		// 전체경로
		String savePath = path + System.getProperty("file.separator")+fname;
		
		// 존재여부 확인을 위해 File객체 생성
		File f = new File(savePath);
		
		int idx = 1;
		while(f.exists()) {
			StringBuffer sb = new StringBuffer();
			sb.append(name);
			sb.append(idx++);
			sb.append(suffix);
			
			fname = sb.toString();
			
			savePath = path + System.getProperty("file.separator")+fname;
			
			f = new File(savePath); 
		} // 새로 만들어진 파일에 대한 체크 및 파일명 변경을 true일 동안 반복수행
		
		return fname;
	}
}
