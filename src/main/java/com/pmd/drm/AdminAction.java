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
	public ModelAndView adminPage(String hometown, String a_idx, String nowPage, String fromUpdate) {
		ModelAndView mv = new ModelAndView();
		
		// 관리자 로그인을 한 사람만 admin페이지를 보여준다. 보안을 생각하여 노파심에 한 작업
		UserVO vo = (UserVO) session.getAttribute("userInfo");
		
		if(vo != null) { // 로그인 안 한 상태여부 확인
			if(vo.getStatus().equals("9"))
				if(hometown == null && a_idx == null && nowPage == null && fromUpdate == null) // 관리자페이지에서 광고글을 추가하지 않은 경우
					mv.setViewName("admin");
				else if(hometown != null && a_idx == null && nowPage == null && fromUpdate == null){ // 관리자페이지에서 광고글을 추가한 경우
					mv.addObject("hometown", hometown);
					mv.setViewName("admin");
				} else if(hometown == null && a_idx != null && nowPage != null && fromUpdate == null){ // 광고글 수정을 눌렀을 경우
					mv.addObject("a_idx", a_idx);
					mv.addObject("nowPage", nowPage);
					mv.setViewName("admin");
				} else if(hometown == null && a_idx == null && nowPage != null && fromUpdate != null) { // 수정된 후 광고목록으로 가는 경우
					mv.addObject("nowPage", nowPage);
					mv.addObject("hometown", fromUpdate);
					mv.setViewName("admin");
				}
			else {
				mv.setViewName("redirect:/login.inc");
			}
		} else {
			mv.setViewName("redirect:/login.inc");
		}
		
		return mv;
	}
	
}
