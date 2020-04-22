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

import com.pmd.util.Paging_Bulletin;
import com.pmd.util.Paging_SearchBulletin;
import com.pmd.vo.BulletinVO;
import com.pmd.vo.UserVO;

import mybatis.dao.BulletinDAO;
import mybatis.dao.Bulletin_C_DAO;

@Controller
public class ListAction {
	
	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한 페이지당 보여질 게시물의 수
	public final int BLOCK_PAGE = 5; // 한 블록당 보여질 페이지 수
	
	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드값
	
	@Autowired
	private HttpSession session;

	@Autowired
	private BulletinDAO b_dao;
	
	@Autowired
	private Bulletin_C_DAO b_c_dao;
	
	
	// 카테고리 별 게시판 보여주기
	@RequestMapping("/list.inc")
	public ModelAndView list(String nowPage, String b_category, String active) {
		
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		// 총 게시물의 수를 얻는다.
		rowTotal = b_dao.getCount(b_category);
		
		// 페이징 처리
		Paging_Bulletin page = new Paging_Bulletin(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category);
		
		// 생성된 페이지 기법의 HTML코드를 만들자
		pageCode = page.getSb().toString();
		
		// JSP에서 표현할 게시물들의 목록
		int begin = page.getBegin();
		int end = page.getEnd();
		
		BulletinVO[] ar = b_dao.getList(String.valueOf(begin), String.valueOf(end), b_category);
		
		// 게시물의 댓글 갯수를 저장하기 위한 정수형 배열
		int[] comm_ar = null;
		
		if(ar != null && ar.length > 0) {
			comm_ar = new int[ar.length];
			
			// 댓글 갯수를 가져오기 위한 for문
			for(int i=0; i<comm_ar.length; i++) {
				comm_ar[i] = b_c_dao.commCount(ar[i].getB_idx());
			}
		}
		
		String board_name = null;
		if(b_category.equals("free"))
			board_name = "자유게시판";
		else if(b_category.equals("qa"))
			board_name = "Q&A";
		else if(b_category.equals("adv"))
			board_name = "광고문의";
		
		// 네이버 로그인을 한 후 현재 보고 있는 페이지로 돌아오기 위해 필요한 값들을 세션에 저장 //
		session.setAttribute("path", "list");
		session.setAttribute("nowPage", page.getNowPage());
		session.setAttribute("b_category", b_category);
		
		// JSP에서 사용할 모든 값들을 저장할 객체 
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("board_name", board_name);
		mv.addObject("b_category", b_category);
		mv.addObject("comm_ar", comm_ar);
		mv.addObject("active", active);
		mv.setViewName("list");		
		
		return mv;
	}
	
	
	// 검색할 때 
	@RequestMapping(value = "/searchBulletin.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchBulletin(String nowPage, String searchType, String searchValue, String b_category){
		
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);
		
		rowTotal = b_dao.searchBulletinCount(searchType, searchValue, b_category);
		
		// 페이징 처리
		Paging_SearchBulletin page = new Paging_SearchBulletin(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, b_category, searchType, searchValue);
		// 생성된 페이지 기법의 HTML코드를 만들자
		pageCode = page.getSb().toString();
		
		// JSP에서 표현할 게시물들의 목록
		int begin = page.getBegin();
		int end = page.getEnd();
		
		// 검색결과 목록을 가져 옴
		BulletinVO[] ar = b_dao.searchBulletin(String.valueOf(begin), String.valueOf(end), searchType, searchValue, b_category);
		
		
		// 게시물의 댓글 갯수를 저장하기 위한 정수형 배열
		int[] comm_ar = null;
		
		if(ar != null && ar.length > 0) {
			comm_ar = new int[ar.length];
			
			// 댓글 갯수를 가져오기 위한 for문
			for(int i=0; i<comm_ar.length; i++) {
				comm_ar[i] = b_c_dao.commCount(ar[i].getB_idx());
			}
		}

		String board_name = null;
		if(b_category.equals("free"))
			board_name = "자유게시판";
		else if(b_category.equals("qa"))
			board_name = "Q&A";
		else if(b_category.equals("adv"))
			board_name = "광고문의";
		
		UserVO uvo = null;
		
		session.setAttribute("path", "list");
		session.setAttribute("nowPage", page.getNowPage());
		session.setAttribute("b_category", b_category);
		
		Map<String, Object> map = new HashMap<String, Object>();

	
		map.put("ar", ar); // 해당 게시물 정보들
		map.put("pageCode", pageCode); // 페이징 코드
		map.put("nowPage", page.getNowPage()); // 현재 페이지
		map.put("rowTotal", rowTotal); // 검색결과 수
		map.put("blockList", BLOCK_LIST); // 페이지 당 보여질 갯수
		map.put("board_name", board_name); // 게시판 이름(한글)
		map.put("b_category", b_category); // 게시판 이름(코드값)
		map.put("comm_ar", comm_ar); // 댓글 수 표현목적
		
	
		if(session.getAttribute("userInfo") != null) { // 비밀글 접근목적
			uvo = (UserVO) session.getAttribute("userInfo");
			map.put("userInfo", uvo.getU_idx());
			map.put("status", uvo.getStatus()); // 9 = 관리자
		}
		
		return map;
	}
}
