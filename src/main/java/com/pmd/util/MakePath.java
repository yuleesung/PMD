package com.pmd.util;

import javax.servlet.http.HttpSession;

public class MakePath {
	
	public String decidePath(HttpSession session) {
		String path = "";
		
		if(session.getAttribute("active") == null) {
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
			else if(session.getAttribute("path").equals("viewChart"))
				path = "redirect:/chart.inc";
		}else {
			if(session.getAttribute("path").equals("main")) // Main
				path = "redirect:/main.inc";
			else if(session.getAttribute("path").equals("view")) // View 
				path = "redirect:/view.inc?srchTrprId="+session.getAttribute("srchTrprId")
						+"&srchTrprDegr="+session.getAttribute("srchTrprDegr")+"&traStartDate="+session.getAttribute("traStartDate")
						+"&traEndDate="+session.getAttribute("traEndDate")+"&trainstCstId="+session.getAttribute("trainstCstId")
						+"&superViser="+session.getAttribute("superViser")+"&trainTarget="+session.getAttribute("trainTarget")
						+"&regCourseMan="+session.getAttribute("regCourseMan")+"&yardMan="+session.getAttribute("yardMan");
			else if(session.getAttribute("path").equals("list")) // list
				path = "redirect:/list.inc?nowPage="+session.getAttribute("nowPage")+"&b_category="+session.getAttribute("b_category")+"&active="+session.getAttribute("active");
			else if(session.getAttribute("path").equals("viewBoard"))
				path = "redirect:/viewBoard.inc?nowPage="+session.getAttribute("nowPage")+"&b_category="+session.getAttribute("b_category")+"&b_idx="+session.getAttribute("b_idx")+"&active="+session.getAttribute("active");
			else if(session.getAttribute("path").equals("viewChart"))
				path = "redirect:/chart.inc?active="+session.getAttribute("active");
		}
		
		return path;
	}

}
