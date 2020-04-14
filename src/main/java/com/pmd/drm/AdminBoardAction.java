package com.pmd.drm;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.Paging;
import com.pmd.util.Paging_AdvList;
import com.pmd.util.Paging_Bulletin;
import com.pmd.util.Paging_SearchAdvList;
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
	// 맨 처음 진입할 때 수행
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
		
		
		rowTotal = b_dao.getCountForAdmin(b_category); // 총 게시물 수
		
		// 페이징 처리.. 나중에 관리자용으로 바꿔야 함
		Paging_AdvList page = new Paging_AdvList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category);		
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		// 해당 카테고리의 게시물 목록을 설정한 페이징만큼 가져 옴
		BulletinVO[] ar = b_dao.getListForAdmin(String.valueOf(begin), String.valueOf(end), b_category);
		
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
	
	
	// 카테고리 변경되었을 때,
	@RequestMapping(value="/admin_board.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> admin_board(String nowPage, String b_category){
		
		if(nowPage == null) // 첫 진입 때는 1페이지
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		
		rowTotal = b_dao.getCountForAdmin(b_category); // 총 게시물 수
		
		// 페이징 처리.. 나중에 관리자용으로 바꿔야 함
		Paging_AdvList page = new Paging_AdvList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category);		
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		// 해당 카테고리의 게시물 목록을 설정한 페이징만큼 가져 옴
		BulletinVO[] ar = b_dao.getListForAdmin(String.valueOf(begin), String.valueOf(end), b_category);
		
		String board_name = null; // jsp에서 표현할 문자열
		
		if(b_category.equals("free"))
			board_name = "자유";
		else if(b_category.equals("qa"))
			board_name = "Q&A";
		else if(b_category.equals("adv"))
			board_name = "광고문의";		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ar", ar); // 검색 결과값
		map.put("pageCode", pageCode); // 페이지버튼
		map.put("nowPage", page.getNowPage()); // 현재페이지
		map.put("rowTotal", rowTotal); // 검색결과 총 갯수
		map.put("blockList", BLOCK_LIST); // 한 페이지에 보여질 리스트 갯수
		map.put("board_name", board_name);
		
		return map;
	}
	
	// 관리자 게시글 삭제 or 복구
	@RequestMapping(value = "/delOrRestoreBoard.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delOrRestoreBoard(String b_idx, String status, String b_category, String nowPage){
		
		boolean chk = b_dao.delOrRestoreBoard(b_idx, status);
		
		if(nowPage == null) // 첫 진입 때는 1페이지
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		
		rowTotal = b_dao.getCountForAdmin(b_category); // 총 게시물 수
		
		// 페이징 처리.. 관리자용으로 바꿔야 함
		Paging_AdvList page = new Paging_AdvList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category);		
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		// 해당 카테고리의 게시물 목록을 설정한 페이징만큼 가져 옴
		BulletinVO[] ar = b_dao.getListForAdmin(String.valueOf(begin), String.valueOf(end), b_category);
		
		String board_name = null; // jsp에서 표현할 문자열
		
		if(b_category.equals("free"))
			board_name = "자유";
		else if(b_category.equals("qa"))
			board_name = "Q&A";
		else if(b_category.equals("adv"))
			board_name = "광고문의";		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ar", ar); // 검색 결과값
		map.put("pageCode", pageCode); // 페이지버튼
		map.put("nowPage", page.getNowPage()); // 현재페이지
		map.put("rowTotal", rowTotal); // 검색결과 총 갯수
		map.put("blockList", BLOCK_LIST); // 한 페이지에 보여질 리스트 갯수
		map.put("board_name", board_name);
		
		
		return map;
	}
	
	
	
	// 검색영역
	@RequestMapping(value = "/searchBulletinCountForAdmin.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchBulletinCountForAdmin(String nowPage, String searchTypeForAdmin, String searchValueForAdmin, String b_category){
		// searchTypeForAdmin, 셀렉트 값
		// searchValueForAdmin, 텍스트 값
		// b_category, 현재 카테고리 값
		
		if(nowPage == null) // 첫 진입 때는 1페이지
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		// 검색 게시물 수
		rowTotal = b_dao.searchBulletinCountForAdmin(searchTypeForAdmin, searchValueForAdmin, b_category); 
		
		// 페이징 처리.. 검색용으로 바꿔야 함
		Paging_SearchAdvList page = new Paging_SearchAdvList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category, 
																searchTypeForAdmin, searchValueForAdmin);
		
		pageCode = page.getSb().toString(); // 페이징 HTML처리
		
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		// 검색 목록을 가져 옴
		BulletinVO[] ar =  b_dao.searchBulletinForAdmin(String.valueOf(begin), String.valueOf(end), searchTypeForAdmin, searchValueForAdmin, b_category);

		
		String board_name = null; // jsp에서 표현할 문자열
		
		if(b_category.equals("free"))
			board_name = "자유";
		else if(b_category.equals("qa"))
			board_name = "Q&A";
		else if(b_category.equals("adv"))
			board_name = "광고문의";		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("ar", ar); // 검색 결과값
		map.put("pageCode", pageCode); // 페이지버튼
		map.put("nowPage", page.getNowPage()); // 현재페이지
		map.put("rowTotal", rowTotal); // 검색결과 총 갯수
		map.put("blockList", BLOCK_LIST); // 한 페이지에 보여질 리스트 갯수
		map.put("b_category", b_category);
		map.put("board_name", board_name);
	
		return map;
	}
}
