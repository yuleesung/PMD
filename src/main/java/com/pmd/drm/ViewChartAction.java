package com.pmd.drm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewChartAction {

	@RequestMapping("/chart.inc")
	public ModelAndView viewChart() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("viewChart");
		
		return mv;
	}
	
}
