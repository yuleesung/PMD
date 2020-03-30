package com.pmd.drm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.UserVO;

import mybatis.dao.BulletinDAO;

@Controller
public class MyPageAction {

	@Autowired
	private HttpSession session;
	@Autowired
	private BulletinDAO b_dao;
	
	
	@RequestMapping("/mypage.inc")
	public ModelAndView info() { // 내정보 페이지로 이동
		ModelAndView mv = new ModelAndView();

		mv.setViewName("mypage");
		
		return mv;
	}
	
	@RequestMapping("/mypage_menu.inc")
	public String mypage_menu(String menu) { // 내정보 메뉴
		
		String path = null;
		
		if(menu.equals("0"))
			path = "mypage_info"; // 내정보
		else if(menu.equals("1"))
			path = "mypage_edit"; // 정보수정
		else if(menu.equals("2"))
			path = "mypage_leave"; // 회원탈퇴
			
		
		return path;
	}
	
	@RequestMapping(value = "/mypage_edit.inc", method = RequestMethod.POST)
	public ModelAndView mypage_edit(UserVO vo) {
		
		UserVO uvo = (UserVO) session.getAttribute("userInfo");
		
		vo.setU_idx(uvo.getU_idx());
		
		boolean chk = b_dao.updateMember(vo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage");
		
		return mv;
	}
	
}
