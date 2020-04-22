package com.pmd.drm;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.UserVO;

import mybatis.dao.UsersDAO;

@Controller
public class MyPageAction {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private UsersDAO u_dao;
	
	
	@RequestMapping("/mypage.inc")
	public ModelAndView info() { // 내정보 페이지로 이동
		ModelAndView mv = new ModelAndView();

		mv.setViewName("mypage");
		
		return mv;
	}
	
	@RequestMapping("/mypage_menu.inc")
	public String mypage_menu(String menu) { // 내정보 카테고리 선택
		
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
	public ModelAndView mypage_edit(UserVO vo) { // 회원정보 수정
		
		UserVO uvo = (UserVO) session.getAttribute("userInfo");
		
		vo.setU_idx(uvo.getU_idx());
		
		boolean chk = u_dao.updateMember(vo);
		
		session.setAttribute("userInfo", u_dao.afterUpdateUserInfo(uvo.getU_idx()));
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("mypage");
		
		return mv;
	}

	
	@RequestMapping(value = "/mypage_leave.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mypage_leave(String u_idx, String u_pw) { // 회원탈퇴
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = u_dao.delMember(u_idx, u_pw); // 회원정보 탈퇴
		
		if(chk)  // 탈퇴성공 시, session을 지움
			session.removeAttribute("userInfo");
		
		map.put("chk", chk);
		
		return map;
	}
	
	@RequestMapping(value = "/checkPrePw.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkPrePw(String pre_pw){
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserVO uvo = (UserVO) session.getAttribute("userInfo");
		
		boolean chk = u_dao.checkPrePw(uvo.getU_idx(), pre_pw);
		
		map.put("chk", chk);
		
		return map;
	}
}
