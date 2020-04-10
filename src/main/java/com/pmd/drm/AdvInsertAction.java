package com.pmd.drm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdvInsertAction {

	@RequestMapping("/advInsert.inc")
	public String goAdvInsert() {
		return "advInsert";
	}
	
}
