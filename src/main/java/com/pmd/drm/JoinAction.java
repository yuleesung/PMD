package com.pmd.drm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.UserVO;

@Controller
public class JoinAction {

	
	@RequestMapping("/join.inc")
	public String join() {
		return "join";
	}
	
	
	@RequestMapping(value = "join.inc", method = RequestMethod.POST)
	public ModelAndView join(UserVO vo) {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}
