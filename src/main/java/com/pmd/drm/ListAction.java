package com.pmd.drm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.util.Paging_Bulletin;
import com.pmd.vo.BulletinVO;

import mybatis.dao.BulletinDAO;

@Controller
public class ListAction {
	
	// 페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한 페이지당 보여질 게시물의 수
	public final int BLOCK_PAGE = 5; // 한 블록당 보여질 페이지 수
	
	int nowPage; // 현재 페이지 값
	int rowTotal; // 전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드값

	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping("/list.inc")
	public ModelAndView list(String nowPage, String b_category) {
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
		
		// JSP에서 사용할 모든 값들을 저장할 객체
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.setViewName("list");
		
		return mv;
	}
	
}
