package com.pmd.drm;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pmd.vo.BulletinVO;

import spring.util.FileRenameUtil;

@Controller
public class NoteAction {

	private String imgPath = "resources/editor_img";
	@Autowired
	private ServletContext application;
	@Autowired
	private HttpServletRequest request;
	
	
	
	@RequestMapping(value = "/saveImage.inc", method = RequestMethod.POST )
	@ResponseBody
	public Map<String, String> saveImage(BulletinVO vo) throws Exception{
		MultipartFile upload = vo.getUpload();
		String f_name = null;
		
		if(upload!=null && upload.getSize()>0) {			
			String path = application.getRealPath(imgPath); // 절대경로
			f_name = upload.getOriginalFilename(); // 파일명 얻기
			// 동일한 파일명이 있다면, f_name을 변경
			f_name  = FileRenameUtil.checkFileName(path, f_name);
			// 파일첨부
			upload.transferTo(new File(path, f_name));
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", request.getContextPath()+"/resources/editor_img/"+f_name); // url이라는 곳에 경로를 저장시킴
		
		return map;
	}
}
