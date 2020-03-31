package com.pmd.drm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pmd.vo.BulletinVO;

import mybatis.dao.BulletinDAO;

@Controller
public class ViewBoardAction {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BulletinDAO b_dao;
	
	@RequestMapping("/viewBoard.inc")
	public ModelAndView viewBoard(String b_idx, String nowPage, String b_category) {
		ModelAndView mv = new ModelAndView();
		
		session.setAttribute("path", "viewBoard");
		session.setAttribute("b_idx", b_idx);
		session.setAttribute("nowPage", nowPage);
		session.setAttribute("b_category", b_category);
		
		BulletinVO vo = b_dao.viewPost(b_idx);
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_category", b_category);
		mv.setViewName("viewBoard");
		
		return mv;
	}

}
