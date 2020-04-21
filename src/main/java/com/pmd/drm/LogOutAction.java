package com.pmd.drm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.MakePath;


@Controller
public class LogOutAction {

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/logout.inc")
	public ModelAndView logout(String active) {
		ModelAndView mv = new ModelAndView();
		
		session.removeAttribute("userInfo"); // 로그인정보 삭제
		session.setAttribute("active", active);
		MakePath mp = new MakePath();
		mv.setViewName(mp.decidePath(session));
		
		return mv;
	}
}
