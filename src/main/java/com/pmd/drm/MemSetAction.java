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
	public final int BLOCK_LIST = 10;	// 페이지당 보여질 회원 수
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
		
		/**** 페이징 ****/
		// 메서드 호출
		Paging_UsersList page = new Paging_UsersList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 버튼 코드
		pageCode = page.getSb().toString();
		
		// JSP에서 표현할 회원들 목록
		int begin = page.getBegin(); 
		int end = page.getEnd();
//		int begin = 1;
//		int end = 3;
		
		System.out.println("begin:"+begin);
		System.out.println("end"+end);
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
	public Map<String, Boolean> userStatus(String u_idx, String status){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		Boolean chk = b_dao.blockOrRelUser(u_idx, status);
		
		map.put("res", chk);
		return map;
	}
}
