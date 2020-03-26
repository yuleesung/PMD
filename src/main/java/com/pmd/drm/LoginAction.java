package com.pmd.drm;

import java.math.BigInteger;
import java.security.SecureRandom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginAction {

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
	
}
