package com.pmd.drm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.UserVO;

@Controller
public class AdminAction {

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/admin.inc")
	public ModelAndView adminPage() {
		ModelAndView mv = new ModelAndView();
		
		// 관리자 로그인을 한 사람만 admin페이지를 보여준다. 보안을 생각하여 노파심에 한 작업
		UserVO vo = (UserVO) session.getAttribute("userInfo");
		
		if(vo != null) { // 로그인 안 한 상태여부 확인
			if(vo.getStatus().equals("9"))
				mv.setViewName("admin");
			else {
				mv.setViewName("redirect:/login.inc");
			}
		} else {
			mv.setViewName("redirect:/login.inc");
		}
		
		return mv;
	}
	
}
