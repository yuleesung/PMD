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
		
		String path = "redirect:/main.inc";
		
		session.removeAttribute("userInfo"); // 로그인정보 삭제
		
		if(session.getAttribute("path").equals("main")) // Main
			path = "redirect:/main.inc";
		else if(session.getAttribute("path").equals("view")) // View 
			path = "redirect:/view.inc?srchTrprId="+session.getAttribute("srchTrprId")
					+"&srchTrprDegr="+session.getAttribute("srchTrprDegr")+"&traStartDate="+session.getAttribute("traStartDate")
					+"&traEndDate="+session.getAttribute("traEndDate")+"&trainstCstId="+session.getAttribute("trainstCstId")
					+"&superViser="+session.getAttribute("superViser")+"&trainTarget="+session.getAttribute("trainTarget")
					+"&regCourseMan="+session.getAttribute("regCourseMan")+"&yardMan="+session.getAttribute("yardMan");
		else if(session.getAttribute("path").equals("list")) // list
			path = "redirect:/list.inc?nowPage="+session.getAttribute("nowPage")+"&b_category="+session.getAttribute("b_category");
		else if(session.getAttribute("path").equals("viewBoard"))
			path = "redirect:/viewBoard.inc?nowPage="+session.getAttribute("nowPage")+"&b_category="+session.getAttribute("b_category")+"&b_idx="+session.getAttribute("b_idx");
		
	
		mv.setViewName(path);
		
		return mv;
	}
}
