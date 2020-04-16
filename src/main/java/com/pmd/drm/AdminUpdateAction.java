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
public class AdminUpdateAction {
	
	private String imgPath = "resources/upload";
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping(value = "/advUpdate.inc", method = RequestMethod.GET)
	public ModelAndView showAdv(String a_idx, String nowPage) { // admin.inc를 거쳐가야 분할 화면으로 보여줄 수 있기 때문에 쓰이는 함수
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("a_idx", a_idx);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("redirect:/admin.inc");
		
		return mv;
	}
	
	@RequestMapping("/showAdvUpdate.inc")
	public ModelAndView showAdvUpdate(String a_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		AdvVO vo = b_dao.viewAdv(a_idx);
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("advUpdate");
		
		return mv;
	}
	
	@RequestMapping("/doAdvUpdate.inc")
	public ModelAndView doUpdateAdv(AdvVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getUpload();
		
		
		if(mf.getSize()>0 && mf!=null) {
			String path = application.getRealPath(imgPath);
			String file_name = mf.getOriginalFilename();
			
			vo.setFile_name(file_name);
			
			mf.transferTo(new File(path, file_name));
		}
		
		b_dao.updateAdv(vo);
		
		mv.addObject("fromUpdate", "fromUpdateAdv");
		mv.addObject("nowPage", vo.getNowPage());
		mv.addObject("adv_group", vo.getAdv_group());
		mv.setViewName("redirect:/admin.inc");
		
		return mv;
	}
}
