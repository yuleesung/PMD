package com.pmd.drm;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.Paging_UsersList;
import com.pmd.vo.UserVO;

import mybatis.dao.BulletinDAO;

@Controller
public class MemSetAction {
	
	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 5;	// 페이지당 보여질 회원 수
	public final int BLOCK_PAGE = 5; 	// 한 블록당 보여질 페이지 수
	
	int nowPage; 	// 현재 페이지 값
	int rowTotal; 	// 전체 회원 수
	String pageCode;// 페이징처리된 HTML코드값
	

	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping("/memSet.inc")
	public ModelAndView memSetting(String nowPage) {
		
		// 현재페이지 값 받기
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		rowTotal = b_dao.getCountUser();
		
		/**** 페이징 ****/
		// 메서드 호출
		Paging_UsersList page = new Paging_UsersList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 버튼 코드
		pageCode = page.getSb().toString();
		
		// JSP에서 표현할 회원들 목록
		int begin = page.getBegin(); 
		int end = page.getEnd();

		UserVO[] ar = b_dao.listUser(String.valueOf(begin), String.valueOf(end));
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("pageCode", pageCode); // 페이지 버튼
		mv.addObject("nowPage", page.getNowPage());	// 현재 페이지
		mv.addObject("rowTotal", rowTotal);	// 총 회원 수
		mv.addObject("blockList", BLOCK_LIST);	// 한 페이지당 보여질  회원들 수
		
		mv.setViewName("memSet");
		return mv;
	}
	
	
	@RequestMapping(value = "/memLock.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userStatus(String u_idx, String status, String nowPage){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(u_idx != null && status != null) {
			Boolean chk = b_dao.blockOrRelUser(u_idx, status);
		}
		
		// 현재페이지 값 받기
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		rowTotal = b_dao.getCountUser();
		
		/**** 페이징 ****/
		// 메서드 호출
		Paging_UsersList page = new Paging_UsersList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 버튼 코드
		pageCode = page.getSb().toString();
		
		// JSP에서 표현할 회원들 목록
		int begin = page.getBegin(); 
		int end = page.getEnd();
		
		UserVO[] ar = b_dao.listUser(String.valueOf(begin), String.valueOf(end));
		
		map.put("ar", ar);
		map.put("pageCode", pageCode);
		map.put("nowPage", page.getNowPage());	// 현재 페이지
		map.put("rowTotal", rowTotal);	// 총 회원 수
		map.put("blockList", BLOCK_LIST);	// 한 페이지당 보여질  회원들 수
		
		return map;
	}
}
