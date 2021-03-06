package com.pmd.drm;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.MakePath;
import com.pmd.vo.UserVO;

import mybatis.dao.UsersDAO;

@Controller
public class LoginAction {

	@Autowired
	private UsersDAO u_dao;
	
	@Autowired
	private HttpSession session;

	
	@RequestMapping(value = "/login.inc", method = RequestMethod.GET)
	public ModelAndView naverLogin(String active) {
		ModelAndView mv =  new ModelAndView();
		
		// state값의 랜덤 생성을 위한 문장
		String state = new BigInteger(130, new SecureRandom()).toString();
		
		// 네이버로 로그인하기 화면을 보기 위한 링크 주소 문자열
		String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=YeX1APr9UJODbfW6etcy&state="+state+"&redirect_uri=http://localhost:9090/drm/callback.inc";
		
		session.setAttribute("active", active);
		
		mv.addObject("url", url);
		mv.setViewName("login");
		
		return mv;
	}
	
	@RequestMapping(value = "/loginGo.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(UserVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserVO uvo = u_dao.login(vo.getU_id(), vo.getU_pw());
		
		if(uvo != null) {
			// 로그인 성공
			if(uvo.getStatus().equals("0") || uvo.getStatus().equals("9")) {
				session.setAttribute("userInfo", uvo);
				MakePath mp = new MakePath();
				map.put("chk", "success");
				map.put("path", mp.decidePath(session).substring(10));
			}else if(uvo.getStatus().equals("1") || uvo.getStatus().equals("2")) {
				map.put("chk", "stopOrLeave");
			}
		} else {
			map.put("chk", "fail");
		}

		return map;
	}
	
	@RequestMapping(value = "/adminLogin.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminLogin(String u_id, String u_pw){
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserVO vo = u_dao.adminLogin(u_id, u_pw);
		boolean chk = false;
		if(vo != null) {
			// 로그인 성공상태
			chk = true;
			session.setAttribute("userInfo", vo);
			 
			MakePath mp = new MakePath();
			map.put("path", mp.decidePath(session).substring(10));
			map.put("chk", chk);
		} else {
			map.put("chk", chk);
		}
		
		return map;
	}
}
