package com.pmd.drm;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.UserVO;

import mybatis.dao.BulletinDAO;

@Controller
public class LoginAction {

	@Autowired
	private BulletinDAO b_dao;
	@Autowired
	private HttpSession session;

	
	
	@RequestMapping("/login.inc")
	public ModelAndView naverLogin() {
		ModelAndView mv =  new ModelAndView();
		
		// state값의 랜덤 생성을 위한 문장
		String state = new BigInteger(130, new SecureRandom()).toString();
		
		// 네이버로 로그인하기 화면을 보기 위한 링크 주소 문자열
		String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=YeX1APr9UJODbfW6etcy&state="+state+"&redirect_uri=http://localhost:9090/drm/callback.inc";
		
		mv.addObject("url", url);
		mv.setViewName("login");
		
		return mv;
	}
	
	@RequestMapping(value = "/login.inc", method = RequestMethod.POST)
	public ModelAndView login(UserVO vo) {
		
		String path = "login";
		
		UserVO uvo = b_dao.login(vo.getU_id(), vo.getU_pw());
		
		if(uvo != null) {
			// 로그인 성공
			session.setAttribute("userInfo", uvo);			
			
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
			
		}
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("loginFail", "fail"); // 로그인실패
		mv.setViewName(path);
		
		return mv;
	}
}
