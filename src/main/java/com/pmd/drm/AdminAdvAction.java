package com.pmd.drm;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.Paging_AdvGroup;
import com.pmd.vo.AdvVO;

import mybatis.dao.BulletinDAO;

@Controller
public class AdminAdvAction {

	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한 페이지당 보여질 게시물의 수
	public final int BLOCK_PAGE = 5; // 한 블록당 보여질 페이지 수

	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드값

	@Autowired
	private BulletinDAO b_dao;

	

	
	// 광고목록 첫 이동
	@RequestMapping("/admin_advList.inc")
	public ModelAndView admin_advList(String nowPage, String adv_group) {
		ModelAndView mv = new ModelAndView();
		
		if(adv_group == null) { // 첫 진입 때는 Group 1 표시
			adv_group = "1";
		}
		
		if(nowPage == null) // 첫 진입 때는 Page값 1
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		rowTotal = b_dao.getCountAdv(adv_group); // 그룹 별 게시글 총 갯수
		
		// 페이징처리.. 광고용으로 바꿔야 함
		Paging_AdvGroup page = new Paging_AdvGroup(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, adv_group);
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		AdvVO[] ar = b_dao.listAdv(begin, end, adv_group); // 해당그룹 글 목록 가져옴
		
		// jsp에서 표현할 문자열
		String board_name = null; 
		
		if(adv_group.equals("1"))
			board_name = "1번 광고";
		else if(adv_group.equals("2"))
			board_name = "2번 광고";
		else if(adv_group.equals("3"))
			board_name = "3번 광고";
		else if(adv_group.equals("4"))
			board_name = "4번 광고";
		
		
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", this.nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("board_name", board_name);
		mv.addObject("adv_group", adv_group);
		mv.setViewName("admin_board_adv");		
		
		return mv;
	}
	
	// 그룹 변경
	@RequestMapping(value = "/admin_groupList.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> admin_groupList(String nowPage, String adv_group){
		if(nowPage == null) // 첫 진입 때는 Page값 1
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		rowTotal = b_dao.getCountAdv(adv_group); // 그룹 별 게시글 총 갯수
		
		// 페이징처리.. 광고용으로 바꿔야 함
		Paging_AdvGroup page = new Paging_AdvGroup(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, adv_group);
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		AdvVO[] ar = b_dao.listAdv(begin, end, adv_group); // 해당그룹 글 목록 가져옴
		
		// jsp에서 표현할 문자열
		String board_name = null; 
		
		if(adv_group.equals("1"))
			board_name = "1번 광고";
		else if(adv_group.equals("2"))
			board_name = "2번 광고";
		else if(adv_group.equals("3"))
			board_name = "3번 광고";
		else if(adv_group.equals("4"))
			board_name = "4번 광고";
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ar", ar); // 검색 결과값
		map.put("pageCode", pageCode); // 페이지버튼
		map.put("nowPage", page.getNowPage()); // 현재페이지
		map.put("rowTotal", rowTotal); // 검색결과 총 갯수
		map.put("blockList", BLOCK_LIST); // 한 페이지에 보여질 리스트 갯수
		map.put("board_name", board_name);
		
		return map;
	}
	
	//delOrRestoreAdv
	@RequestMapping(value = "/delOrRestoreAdv.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delOrRestoreAdv(String a_idx, String status, String adv_group, String nowPage){

		boolean chk = b_dao.delOrRestoreAdv(a_idx, status);
		
		if(nowPage == null) // 첫 진입 때는 Page값 1
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		rowTotal = b_dao.getCountAdv(adv_group); // 그룹 별 게시글 총 갯수
		
		// 페이징처리.. 광고용으로 바꿔야 함
		Paging_AdvGroup page = new Paging_AdvGroup(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, adv_group);
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		String begin = String.valueOf(page.getBegin());
		String end = String.valueOf(page.getEnd());
		
		AdvVO[] ar = b_dao.listAdv(begin, end, adv_group); // 해당그룹 글 목록 가져옴
		
		// jsp에서 표현할 문자열
		String board_name = null; 
		
		if(adv_group.equals("1"))
			board_name = "1번 광고";
		else if(adv_group.equals("2"))
			board_name = "2번 광고";
		else if(adv_group.equals("3"))
			board_name = "3번 광고";
		else if(adv_group.equals("4"))
			board_name = "4번 광고";
		
		AdvVO avo = b_dao.viewAdv(a_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ar", ar); // 검색 결과값
		map.put("pageCode", pageCode); // 페이지버튼
		map.put("nowPage", page.getNowPage()); // 현재페이지
		map.put("rowTotal", rowTotal); // 검색결과 총 갯수
		map.put("blockList", BLOCK_LIST); // 한 페이지에 보여질 리스트 갯수
		map.put("board_name", board_name);
		map.put("img", avo.getFile_name());
		map.put("adv_group", avo.getAdv_group());
		
		return map;
	}
	
}
