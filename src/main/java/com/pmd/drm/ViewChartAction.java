package com.pmd.drm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewChartAction {

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/chart.inc")
	public ModelAndView viewChart() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("viewChart");
		session.setAttribute("path", "viewChart");
		
		return mv;
	}
	

}
