package com.pmd.drm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.Paging;
import com.pmd.util.Paging_Bulletin;
import com.pmd.vo.BulletinVO;

import mybatis.dao.BulletinDAO;

@Controller
public class AdminBoardAction {

	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한 페이지당 보여질 게시물의 수
	public final int BLOCK_PAGE = 5; // 한 블록당 보여질 페이지 수
	
	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드값
	
	@Autowired
	private BulletinDAO b_dao;
	
	
	 // 관리자 게시글 관리
	@RequestMapping("/adv_bbsList.inc")
	public ModelAndView adv_bbsList(String nowPage, String b_category) { // 카테고리 인자 필요
		ModelAndView mv = new ModelAndView();
		
		if(b_category == null) { // 첫 진입 때는 자유게시판
			b_category = "free";
		}
		
		if(nowPage == null) // 첫 진입 때는 1페이지
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		
		rowTotal = b_dao.getCount(b_category); // 총 게시물 수
		
		// 페이징 처리.. 나중에 관리자용으로 바꿔야 함
		Paging_Bulletin page = new Paging_Bulletin(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category);		
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		// 해당 카테고리의 게시물 목록을 설정한 페이징만큼 가져 옴
		BulletinVO[] ar = b_dao.getList(String.valueOf(begin), String.valueOf(end), b_category);
		
		String board_name = null; // jsp에서 표현할 문자열
		
		if(b_category.equals("free"))
			board_name = "자유";
		else if(b_category.equals("qa"))
			board_name = "Q&A";
		else if(b_category.equals("adv"))
			board_name = "광고문의";
		
		
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("board_name", board_name);
		mv.addObject("b_category", b_category);
		mv.setViewName("admin_board");
		
		return mv;
	}
	
	// 관리자 게시글 삭제
	@RequestMapping(value = "/delOrRestoreBoard.inc")
	public ModelAndView delOrRestoreBoard(String b_idx, String status, String b_category){
		ModelAndView mv = new ModelAndView();
		
		boolean chk = b_dao.delOrRestoreBoard(b_idx, status);
	
		
		mv.setViewName("redirect:/adv_bbsList.inc?b_category="+b_category);
		
		return mv;
	}
	
}
