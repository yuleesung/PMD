package com.pmd.drm;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.AdvVO;

import mybatis.dao.BulletinDAO;

@Controller
public class AdvInsertAction {
	
	private String imgPath = "resources/upload";
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private BulletinDAO b_dao;

	@RequestMapping(value = "/advInsert.inc", method = RequestMethod.GET)
	public String goAdvInsert() {
		return "advInsert";
	}
	
	@RequestMapping(value = "advInsert.inc", method = RequestMethod.POST)
	public ModelAndView InsertAdv(AdvVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getUpload();
		
		
		if(mf.getSize()>0 && mf!=null) {
			String path = application.getRealPath(imgPath);
			String file_name = mf.getOriginalFilename();
			
			vo.setFile_name(file_name);
			
			mf.transferTo(new File(path, file_name));
		}
		
		b_dao.addAdv(vo);
		
		mv.addObject("hometown", "fromInsertAdv");
		mv.setViewName("redirect:/admin.inc");
		
		return mv;
	}
	
}
