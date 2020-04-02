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

import com.pmd.util.MakePath;
import com.pmd.vo.UserVO;

import mybatis.dao.BulletinDAO;

@Controller
public class LoginAction {

	@Autowired
	private BulletinDAO b_dao;
	@Autowired
	private HttpSession session;

	
	
	@RequestMapping(value = "/login.inc", method = RequestMethod.GET)
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
		ModelAndView mv = new ModelAndView();
		
		UserVO uvo = b_dao.login(vo.getU_id(), vo.getU_pw());
		
		if(uvo != null) {
			// 로그인 성공
			session.setAttribute("userInfo", uvo);
			
			MakePath mp = new MakePath();
			mv.setViewName(mp.decidePath(session));
		} else {
			mv.setViewName("redirect:/login.inc");
		}
		
		mv.addObject("loginFail", "fail"); // 로그인실패
		
		return mv;
	}
}
