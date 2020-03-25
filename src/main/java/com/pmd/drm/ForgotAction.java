package com.pmd.drm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ForgotAction {

	@RequestMapping("/forgot.inc")
	public ModelAndView forgot() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("forgot");
		return mv;
	}
}
