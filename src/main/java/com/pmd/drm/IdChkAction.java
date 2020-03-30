package com.pmd.drm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import mybatis.dao.BulletinDAO;

@Controller
public class IdChkAction {

	@Autowired
	private BulletinDAO b_dao;
	
	
	
	@RequestMapping(value = "/idchk.inc", method = RequestMethod.POST)
	public ModelAndView idchk(String u_id) {
		ModelAndView mv = new ModelAndView();
		
		boolean value = b_dao.matchMember(u_id);
		
		mv.addObject("value", value);			
		mv.setViewName("join");
		
		return mv;
		
	}
}
