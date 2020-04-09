package com.pmd.drm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminAction {

	@RequestMapping("/admin.inc")
	public String adminPage() {
		return "admin";
	}
	
}
