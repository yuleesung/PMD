package com.pmd.drm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BulletinDAO;

@Controller
public class MemSetAction {

	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping("/memSet.inc")
	public ModelAndView memSetting(String u_idx, String status) {
		ModelAndView mv = new ModelAndView();
		
		
		
		
		mv.setViewName("memSet");
		return mv;
	}
}
