package com.pmd.drm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LogOutAction {

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/logout.inc")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView();
		
		session.removeAttribute("userInfo");
		
		mv.setViewName("redirect:/main.inc");
		
		return mv;
	}
}
